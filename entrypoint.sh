#!/bin/bash
echo Your container args are: "$@"

env

if ! [ -d "$LINTER_WORKSPACE" ]; then
  echo "Could not find LINTER_WORKSPACE=$LINTER_WORKSPACE directory" >&2
  exit 1
fi

cd "$LINTER_WORKSPACE"
echo $CONFIG_FILE_LOCATION

#CONFIG_FILE_LOCATION=/default/config

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

#git-lint -a

echo "LINTER_WORKSPACE=$LINTER_WORKSPACE"
echo "LINTER_CONFIG_FILE=$LINTER_CONFIG_FILE"
echo "LINTER_WORKSPACE_CONFIG_FILE=$LINTER_WORKSPACE_CONFIG_FILE"
#mkdir -p 

#/config/git-lint/configuration.yml

export XDG_CONFIG_DIRS=/config

cp "$CONFIG_FILE_LOCATION" "/config/git-lint/configuration.yml"
#COPY config.yml /config/git-lint/configuration.yml

echo CONFIG_FILE_LOCATION=$CONFIG_FILE_LOCATION
git-lint -c -i

git-lint -a
