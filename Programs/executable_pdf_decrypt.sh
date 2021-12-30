#!/bin/sh
set -eu

password=$1
pdf=$2

qpdf --password="$password" --replace-input --decrypt="$pdf" "$pdf"
