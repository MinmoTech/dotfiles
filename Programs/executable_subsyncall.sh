#!/bin/sh
set -eu

extension=$1
shift
for i in "$@"; do
    episode=$(echo "$i" | sed -E 's/(.*)\.mkv/\1/gm;t;d')
    subsync "$i" -i "$episode.jpn.$extension" --overwrite-input
done
