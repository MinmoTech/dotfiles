#!/bin/sh
set -eu

workdir=~/Documents
image=$workdir/ocr.jpg
output=$workdir/ocr

mkdir -p "$workdir"

sleep 0.3
maim --select ${image}
mogrify -modulate 100,0 -resize 400% ${image}
invert=false

while getopts ":i" opt; do
    case $opt in
    i)
        invert=true
        ;;
    esac
done

if [ "$invert" = true ]; then
    convert ${image} -channel RGB -negate ${image}
else
    convert ${image} -channel RGB ${image}
fi

# text=$(tesseract --psm 5 --oem 1 -l jpn_vert ${image} ${output} && < ${output}.txt sed 's/ //g' | tr -d '\n' | sed 's/.$//')
text=$(tesseract -l jpn --psm 13 ${image} ${output} && sed <${output}.txt 's/ //g' | tr -d '\n' | sed 's/.$//')
echo "$text" | xclip
~/Programs/translate.py
# echo "$text" | xclip -selection clipboard &
# echo "$text" | trans -speak -brief ja:en &
# # translated_text=$(deep_translator -trans "google" -src "ja" -tg "en" -txt "$text" | tail -1)
# translated_text=$(python /home/julius/Programs/deepl_trans.py "${text}")
# pronounciation=$(echo "$text" | iconv -f utf8 -t shift-jis | kakasi -JH -KH -Ea -s | iconv -f shift-jis -t utf8)
# notify-send "$text
# $pronounciation
# $translated_text"
