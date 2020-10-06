#!/bin/bash

LINTER_WORKSPACE=$PWD

if ! [ -z "$LINTER_CONFIG_FILE" ]; then
  CONFIG_FILE_LOCATION=$LINTER_CONFIG_FILE
fi

if ! [ -z "$LINTER_WORKSPACE_CONFIG_FILE" ]; then
  CONFIG_FILE_LOCATION="$LINTER_WORKSPACE/$LINTER_WORKSPACE_CONFIG_FILE"
fi

echo $CONFIG_FILE_LOCATION
if [ -z "$CONFIG_FILE_LOCATION" ]; then
  echo "No CONFIG_FILE_LOCATION defined" >&2
  exit 1
fi

if ! [ -e "$CONFIG_FILE_LOCATION" ]; then
  echo "Could not find config file at $CONFIG_FILE_LOCATION" >&2
  exit 1
fi



export XDG_CONFIG_DIRS=/config

cp "$CONFIG_FILE_LOCATION" "/config/git-lint/configuration.yml"

echo CONFIG_FILE_LOCATION=$CONFIG_FILE_LOCATION

env
pwd
ls 

#git-lint -c -i



git branch 

git log master..HEAD

git log master..test3

git log origin/master..HEAD

git-lint -a
