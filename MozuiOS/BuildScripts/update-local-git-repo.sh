#!/bin/bash

#this script is meant to be run from the project folder

#exit script on any failed commands
set -e

# This is for generating the change log.
# Go to our local git repo, update it. We only use it for the build change log, and possibly for stamping builds.
# This separate repo could be avoided if TeamCity brought across the .git folder.
# We do this as the first step of the build so as to stay as closely in sync with TeamCity as possible.
pushd $gitRepoPath/mozu-ios-master-for-build-log
git pull -q
popd

