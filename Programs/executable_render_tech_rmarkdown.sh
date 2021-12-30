#!/bin/sh
set -eu

file=$1

ls "${file}" |
	entr Rscript -e "library(rmarkdown);render(\"${file}\",\
    pdf_document(latex_engine = 'xelatex', \
    pandoc_args = c(pandoc_variable_arg(\"mainfont\", \"DejaVuSerif\"), \
    pandoc_variable_arg(\"mainfontoptions\", \"Extension=.ttf, UprightFont=*, BoldFont=*-Bold, ItalicFont=*-Italic, BoldItalicFont=*-BoldItalic\"), \
    pandoc_variable_arg(\"monofont\", \"DejaVuSansMono.ttf\"), \
    pandoc_variable_arg(\"sansfont\", \"DejaVuSans.ttf\"))))"
