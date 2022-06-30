#!/bin/sh
set -eu

FILE=$1

hash=$(ipfs add --cid-version 0 -wrQ "$FILE")
echo "$hash"
/bin/echo -n "https://nftstorage.link/ipfs/${hash}/${FILE}" | xclip -sel clip
echo "$hash" > /tmp/ipfshash
