#!/bin/sh
set -eu

FILE=$1

hash=$(ipfs add -wrQ "$FILE")
echo "$hash"
echo "https://dweb.link/ipfs/${hash}/${FILE}" | xclip -sel clip
echo "$hash" > /tmp/ipfshash
ssh root@plexiglas.xyz "docker exec ipfs ipfs pin add /ipfs/${hash}" &
