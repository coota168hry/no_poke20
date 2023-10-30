#!/bin/bash
set -eu -o pipefail

pwd
nohup rails s -e development &

echo $?