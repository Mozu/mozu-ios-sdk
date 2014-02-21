#!/bin/bash

#this script is meant to be run from the project folder

#exit script on any failed commands
set -e

echo Unit test
# this touches the simulator, so we'll retry it a few times.
./BuildScripts/exec-with-retry.sh eval "./automation/zucchini/kill-simulator.sh; xctool test > DerivedData/test-results.xml"

# Old way, but needs an updated Ruby
#xcodebuild -sdk iphonesimulator -workspace Volusion.xcworkspace -scheme CmdLineTests -configuration Debug RUN_APPLICATION_TESTS_WITH_IOS_SIM=YES ONLY_ACTIVE_ARCH=NO build  2>&1 | ocunit2junit
