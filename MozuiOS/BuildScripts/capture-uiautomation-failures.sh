#!/usr/bin/perl

# This script parses the Zucchini UI Automation framework's TAP output,
# and copies the PNG files for failed tests to a tmp folder structure.
# It then creates a ZIP archive of that folder structure.

use File::Path;
use File::Copy;

$OUTPUTROOT = '/tmp';
$OUTPUTDIR = "$OUTPUTROOT/zucchini_failed_tests";

# delete the worker files
unlink "$OUTPUTROOT/zucchini_failed_tests.zip";
system("rm -rf $OUTPUTDIR");
mkdir $OUTPUTDIR;

$RESULTS_FOLDER = $ARGV[0];

if ($RESULTS_FOLDER eq "")
{
    print "Usage: capture-uiautomation-failures.sh <path_to_zucchini_reports>\n";
    exit 1;
}

$PATH = $RESULTS_FOLDER . "/features";
print "Looking in $PATH\n";

opendir (my $dh, $PATH)
  or die "$0: opendir: $!";

my $failedTestsFound = 0;
while (defined(my $name = readdir $dh)) 
{
    next unless -d "$PATH/$name";
    next if $name =~ /^\.\.?+$/;

    my $failuresPath = "$PATH/$name";
    print "Looking for failures from $failuresPath\n";
    # open the TAP file output by zucchini
    open(TAPFILE, "$failuresPath/zucchini.t") || die ("$0: open: $!");
    $testCase;

    # read each line of the TAP file
    while (<TAPFILE>) 
    {
        chomp;

        # track the test case by parsing for a "not ok" feature with no indentation.
        # find the failing PNGs for that test case by parsing for a not ok PNG with indentation.
        if ($_ =~ m/^not ok.*\s-\s(.*)/)
        {
            $testCase = $1;
            print "Test case: $testCase\n";
        }
        elsif ($_ =~ m/^\s+not ok.*\s-\s(.*\.png)/)
        {
            # copy failing PNG to tmp folder structure for subsequent archiving
            my $failedScreenshotName = $1;
            my $casePath = "$OUTPUTDIR/$testCase";

            print "Capturing not ok screenshot: $failedScreenshotName\n\n";
            if (! -d $casePath)
            {
                mkpath($casePath);
            }
            $failedTestsFound++;

            # use ImageMagick to combine the actual/expected/diff images into one, annotated image for easy viewing
            # within teamcity
            my $actualFilename = "$casePath/$failedScreenshotName-Actual";
            my $expectedFilename = "$casePath/$failedScreenshotName-Expected";
            my $diffFilename = "$casePath/$failedScreenshotName-Diff";

            # annotate the images
            system("convert \"./automation/zucchini/features/$testCase/run_data/Masked/actual/$failedScreenshotName\" -gravity North -background Yellow -splice 0x50 -pointsize 34 -annotate +0+10 'Actual' -bordercolor Blue -border 4x0 \"$actualFilename\"");
            system("convert \"./automation/zucchini/features/$testCase/run_data/Masked/reference/$failedScreenshotName\" -gravity North -background Green -splice 0x50 -pointsize 34 -annotate +0+10 'Expected' -bordercolor Blue -border 4x0 \"$expectedFilename\"");
            system("convert \"./automation/zucchini/features/$testCase/run_data/Diff/$failedScreenshotName\" -gravity North -background Red -splice 0x50 -pointsize 34 -annotate +0+10 'Differences' -bordercolor Blue -border 4x0 \"$diffFilename\"");

            # combine the images into one image
            system("convert \"$actualFilename\" \"$expectedFilename\" \"$diffFilename\" +append \"$casePath/$failedScreenshotName\"");
            
            # clean up the temporary images
            unlink $actualFilename;
            unlink $expectedFilename;
            unlink $diffFilename;
       }
    }
    close(TAPFILE);
}
closedir $dh;

# create ZIP archive if there were failing PNGs.
if ($failedTestsFound > 0)
{
    my $zipFilename = "$OUTPUTROOT/zucchini_failed_tests.zip";
    print "Creating ZIP archive $zipFilename for $failedTestsFound 'not ok' screenshots.\n";
	system("zip -m -9 --recurse-paths $zipFilename $OUTPUTDIR");
}