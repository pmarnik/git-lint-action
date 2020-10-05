#!/bin/sh -l

echo "Hello $1"
echo "XXX"


cat /github/workspace/README.md
echo $WHO_TO_GREET

time=$(date)
echo "::set-output name=time::$time"
