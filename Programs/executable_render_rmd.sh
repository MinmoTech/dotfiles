#!/bin/sh
set -eu

file=$1

ls "${file}" |
    entr Rscript -e "library(rmarkdown);render(\"${file}\", pdf_document())"
