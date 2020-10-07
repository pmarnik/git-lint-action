#!/bin/bash

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


cp "$CONFIG_FILE_LOCATION" "/config/git-lint/configuration.yml"

echo CONFIG_FILE_LOCATION=$CONFIG_FILE_LOCATION

export XDG_CONFIG_DIRS=/config
export CIRCLECI=true

git-lint -a
