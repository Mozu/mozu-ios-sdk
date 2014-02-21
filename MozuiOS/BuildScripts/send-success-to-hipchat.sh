#!/bin/bash
#this script is meant to be run from the project folder

#exit script on any failed commands
set -e

if [ "$1" == "" ]
then
  echo "Usage: $0 <build name>"
  exit 1
fi
# Send a message to Hipchat

curl -d "room_id=MobileApps&from=BuildBot&message=Build+Status:+New $1 build available&color=green" https://api.hipchat.com/v1/rooms/message?auth_token=751360bec0de31a53519e7f77f6f47&format=json