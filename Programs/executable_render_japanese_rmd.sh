#!/bin/sh
set -eu

file=$1

ls "${file}" | \
    entr Rscript -e "library(rmarkdown);render(\"${file}\",\
    pdf_document(latex_engine = 'xelatex', \
    pandoc_args = c(pandoc_variable_arg(\"mainfont\", \"Source Han Sans HC\"), \
    pandoc_variable_arg(\"boldfont\", \"Source Han Sans HC Heavy\"))))"
