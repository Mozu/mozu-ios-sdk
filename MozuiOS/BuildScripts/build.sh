#!/bin/bash

#this script is meant to be run from the project folder

#exit script on any failed commands
set -e

IS_ARCHIVE_BUILD=$1
if [ "$IS_ARCHIVE_BUILD" != "true" ]
then
  echo "Not building App Store Archive. Pass true as first argument if you want to build an App Store archive."
  echo "Usage: $0 true"
fi

echo Install cocoapods
pod install

echo Stamp build number
/usr/libexec/Plistbuddy -c "Set CFBundleVersion $BUILD_NUMBER" "MozuiOSTests/MozuiOSTests-Info.plist"

echo Unlock code signing keychain
# We need to unlock our keychain so the builds can be signed.
#security list-keychain

KEYCHAIN=/Users/teamcity_mac/Library/Keychains/codesign.keychain

# the -s option adds $KEYCHAIN to the search scope, while the -d option adds $KEYCHAIN to the system domain; both are needed
security -v list-keychains -d system -s $KEYCHAIN
security -v unlock-keychain -p volusion $KEYCHAIN
#security list-keychain

if [ "$IS_ARCHIVE_BUILD" == "true" ]
then
	# echo Updating MozuiOSTests-Info.plist with production values
	# disable embedded server
	# /usr/libexec/Plistbuddy -c "Set VOEmbeddedServer false" "MozuiOSTests/MozuiOSTests-Info.plist"

	# set production testflight app token
	# /usr/libexec/Plistbuddy -c "Set TFApplicationToken 7193eecf-cc6b-49a8-8673-83af756c3729" "Volusion/Volusion-Info.plist"

	# set production bundle ID
	# /usr/libexec/Plistbuddy -c "Set CFBundleIdentifier com.volusion.store" "Volusion/Volusion-Info.plist"

	# set production bundle display name
	# /usr/libexec/Plistbuddy -c "Set CFBundleDisplayName \${PRODUCT_NAME}" "Volusion/Volusion-Info.plist"
fi

# echo Compile
# ./BuildScripts/exec-with-retry.sh eval "./kill-simulator.sh; xcodebuild -workspace MozuiOS.xcworkspace -scheme MozuiOS -configuration Release build ONLY_ACTIVE_ARCH=NO -target MozuiOSTests"

if [ "$IS_ARCHIVE_BUILD" == "true" ]
then
	echo Test release build
	./BuildScripts/exec-with-retry.sh eval "./kill-simulator.sh; xcodebuild -workspace MozuiOS.xcworkspace -scheme MozuiOS -destination 'platform=iOS Simulator,name=iPhone Retina (4-inch)' -configuration Release test"
else
	echo Skipping Archive build because "true" was not passed as first argument.
fi

# echo Code sign
# PRODUCTDIR=DerivedData/Volusion/Build/Products/Release-iphoneos
# TARGET=Volusion
# OUTDIR=`pwd`/${PRODUCTDIR}
# /usr/bin/xcrun -sdk iphoneos PackageApplication -v "${PRODUCTDIR}/${TARGET}.app" -o "${OUTDIR}/Volusion.ipa" --embed "${PRODUCTDIR}/${TARGET}.app.dSYM"

# Also zip the dSYM ready for Testflight upload
# pushd ${PRODUCTDIR}
# zip -r8 ${TARGET}.app.dSYM.zip ${TARGET}.app.dSYM
# popd
