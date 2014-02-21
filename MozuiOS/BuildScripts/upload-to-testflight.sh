#!/bin/bash

#this script is meant to be run from the project folder

#exit script on any failed commands
set -e

if [ "$1" == "" ]
then
  echo "Usage: $0 <teamcity buildtype>"
  exit 1
fi

# Grab the last build's info
curl -o lastBuild.tmp "http://teamcity01.corp.volusion.com/app/rest/buildTypes/id:$1/builds/status:SUCCESS" --user guest:guest

# Fish out the last commit of that build
last_commit=`xpath lastBuild.tmp  '/build/revisions/revision/@version'| awk -F"\"" '{print $2}'`

# Go to our local git repo, (updated earlier), and fetch the change log
# This separate repo could be avoided if TeamCity brought across the .git folder.
pushd $gitRepoPath/volusion-ios-master-for-build-log

# Format the change list
# Can't find a way to extract them via TeamCity's REST API, though the server certainly knows the changes.
NOTES=`git log --no-merges --pretty=format:"- %s (%an)" $last_commit..origin/master`

popd

echo "Changes: ${NOTES}"

# Upload
PRODUCTDIR=DerivedData/Volusion/Build/Products/Release-iphoneos
# ipa distribute -f ${PRODUCTDIR}/Volusion.ipa -d ${PRODUCTDIR}/Volusion.app.dSYM.zip --notes "${NOTES}" -a 81c20f6b35dd2328f178931b73a3d12f_MTA5MTI0MzIwMTMtMDYtMDQgMTU6Mjk6MTAuMTk4NzQw -T 88a4add2e167a166974b56586c6cbc9d_MjMyNDA1MjAxMy0wNi0yNCAxMToyNDo1Mi45ODUzNzc --notify --lists 'EveryBuild'

curl \
    http://testflightapp.com/api/builds.json \
    -F file=@${PRODUCTDIR}/Volusion.ipa \
    -F dsym=@${PRODUCTDIR}/Volusion.app.dSYM.zip \
    -F api_token='81c20f6b35dd2328f178931b73a3d12f_MTA5MTI0MzIwMTMtMDYtMDQgMTU6Mjk6MTAuMTk4NzQw' \
    -F team_token='88a4add2e167a166974b56586c6cbc9d_MjMyNDA1MjAxMy0wNi0yNCAxMToyNDo1Mi45ODUzNzc' \
    -F notify=True \
    -F distribution_lists='EveryBuild' \
    -F notes="${NOTES}"
