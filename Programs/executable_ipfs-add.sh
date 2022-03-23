#!/bin/sh
set -eu

FILE=$1

hash=$(ipfs add --cid-version 1 -wrQ "$FILE")
echo "$hash"
/bin/echo -n "https://ipfs.io/ipfs/${hash}/${FILE}" | xclip -sel clip
echo "$hash" > /tmp/ipfshash
