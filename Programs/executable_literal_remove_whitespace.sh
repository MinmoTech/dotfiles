#!/bin/sh
set -eu

text=$(xclip -o -selection clipboard | sed 's/ //g' | tr -d \\n)
echo "$text" | xclip -selection clipboard
