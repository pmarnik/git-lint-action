#!/bin/sh -l

echo "Hello $1"
echo "XXX"

find /github/

time=$(date)
echo "::set-output name=time::$time"
