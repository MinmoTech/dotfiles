#!/bin/sh
set -eu

text=$(xclip -o -selection clipboard | sed 's/ //g' | tr -d \\n)
echo "$text" | xclip -selection clipboard &
# translated_text=$(echo "$text" | trans -brief ja:en)
echo "$text" | trans -speak -brief ja:en &
translated_text=$(python /home/julius/Programs/deepl_trans.py "${text}")
pronounciation=$(echo "$text" | iconv -f utf8 -t shift-jis | kakasi -JH -KH -Ea -s | iconv -f shift-jis -t utf8)
notify-send "$text
$pronounciation
$translated_text"
