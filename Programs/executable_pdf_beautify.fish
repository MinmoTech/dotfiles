#!/bin/env fish

for file in *
	set ocrlang $argv[1]
	set layout $argv[2]
	set rotate $argv[3]
	set folder $file-imagefolder
	set outfolder $file-outfolder
	set finishfolder finished
	mkdir $folder
	mkdir $outfolder
	mkdir -p $finishfolder
	pdfimages $file $folder/out
	set counter 1
	for imagefile in $folder/*;
		echo $imagefile
		if [ "$layout" = "single" ]
			unpaper $imagefile $outfolder/outfile{$counter}-1.pbm $outfolder/outfile{$counter}-2.pbm;
		else
			if [ "$rotate" = "left" ]
				unpaper -l double --pre-rotate -90 --output-pages 2 $imagefile $outfolder/outfile{$counter}-1.pbm $outfolder/outfile{$counter}-2.pbm;
			else if [ "$rotate" = "right" ]
				unpaper -l double --pre-rotate 90 --output-pages 2 $imagefile $outfolder/outfile{$counter}-1.pbm $outfolder/outfile{$counter}-2.pbm;
			else
				unpaper -l double --no-noisefilter --no-grayfilter --output-pages 2 $imagefile $outfolder/outfile{$counter}-1.pbm $outfolder/outfile{$counter}-2.pbm;
			end


		end
		set counter (math $counter + 1)
		rm $imagefile
	end
	echo "convert $outfolder/* $finishfolder/file.pdf"
	img2pdf $outfolder/* -o $finishfolder/file.pdf
	rm -f $outfolder/*
	ocrmypdf -l $ocrlang $finishfolder/file.pdf $finishfolder/$file
	# ocrmypdf -l $ocrlang --clean-final --remove-background $finishfolder/file.pdf $finishfolder/$file
	rm -f $finishfolder/file.pdf
	rmdir $folder
	rmdir $outfolder
end
