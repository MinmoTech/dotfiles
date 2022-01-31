#!/bin/sh
set -eu

FILE=$1

hash=$(ipfs add -wrQ "$FILE")
echo "$hash"
echo "https://ipfs.io/ipfs/${hash}/${FILE}" | xclip -sel clip
