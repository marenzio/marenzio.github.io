#!/bin/bash

fname=$1
#output="/tmp/$fname"
output="$fname"

#cd $fname

rm $fname.pdf; 
rm out/*.svg;
rm out/*.pdf;
#mkdir $output

echo $2
~/projects/verovio/tools/verovio -r ~/projects/verovio/data -f mei -w 2286 -h 3048 --all-pages -b 80 --rdg-xpath-query="$2" --ignore-layout -o out/$fname.svg $fname.xml
# for i in `LS out/*.svg`; do svg2pdf $i ${i/.svg/.pdf}; done; 
for i in `LS out/*.svg`; do rsvg-convert $i -f pdf -o ${i/.svg/.pdf}; done; 

# create a pdf
pdfmerge --output=$fname.pdf out/*.pdf > $fname.pdf

# copy the files to the proto dir
cp out/*.svg ../www/$fname



#rm $output/*.svg
#rm $output/*.pdf

cd ..
