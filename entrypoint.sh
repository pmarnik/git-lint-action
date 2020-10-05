#!/bin/sh -l

echo "Hello $1"
echo "XXX"

find /github/
cat /github/workspace/README.md

time=$(date)
echo "::set-output name=time::$time"
