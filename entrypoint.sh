#!/bin/sh -l

echo "Hello $1"
echo "XXX"

find /github/
cat /github/workspace/README.md
echo $GITHUB_WORKSPACE
ls $GITHUB_WORKSPACE

time=$(date)
echo "::set-output name=time::$time"
