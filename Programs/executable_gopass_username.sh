#!/bin/sh

gopass_key=$(gopass ls --flat | rofi -dmenu)
gopass show -c "${gopass_key}" username || gopass show -c "${gopass_key}" user
