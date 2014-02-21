#!/bin/bash

# this script will retry the specified command until it succeeds up to 3 times,
# for a total of 4 runs.
# the command to execute is just the argument passed to this script.

TRIES=0
until "$@" || [ $TRIES -eq 3 ]; do
   echo Failed, retrying...
   let TRIES=TRIES+1
done

exit $?
