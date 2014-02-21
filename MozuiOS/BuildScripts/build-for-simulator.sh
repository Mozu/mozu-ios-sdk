#!/bin/bash

#this script is meant to be run from the project folder
#exit script on any failed commands
set -e

echo Updating Volusion-Info.plist to enable embedded server
# enable embedded server
/usr/libexec/Plistbuddy -c "Set VOEmbeddedServer true" "Volusion/Volusion-Info.plist"

echo Build for simulator
./BuildScripts/exec-with-retry.sh eval "./automation/zucchini/kill-simulator.sh;xcodebuild -workspace Volusion.xcworkspace -scheme Volusion -configuration Release -sdk iphonesimulator"
