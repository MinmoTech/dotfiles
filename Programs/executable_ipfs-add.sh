#!/bin/sh
set -eu

FILE=$1

hash=$(ipfs add -wrQ "$FILE")
echo "$hash"
/bin/echo -n "https://migaku_test.mypinata.cloud/ipfs/${hash}/${FILE}" | xclip -sel clip
echo "$hash" > /tmp/ipfshash
