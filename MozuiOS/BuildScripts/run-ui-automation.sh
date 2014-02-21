#!/bin/bash

#this script is meant to be run from the project folder
#exit script on any failed commands
set -e

# delete these artifacts now so that if we encounter an error mid-run, we don't mistakenly report to the build server..
# ..a previous run's results as if they were this run's results.
rm -f /tmp/zucchini_run_log.txt
rm -rf /tmp/zucchini
rm -f /tmp/zucchini_failed_tests.zip

echo Run UI tests
pushd automation
pushd zucchini

# capture script output, suppress it going to console
./run-all-in-clean-simulator.sh --ci --silent

# search the TAP report for "not ok" and set return code to 1 if any are found
! find /tmp/zucchini/features/ -name zucchini.t -exec sh -c "cat {}" ";" | grep -q "not ok"
RETURNCODE=$? # inverse grep command will return 1 if "not ok" *is* found in any of the tap files

popd
popd

# capture any failed test artifacts
./BuildScripts/capture-uiautomation-failures.sh /tmp/zucchini

exit $RETURNCODE