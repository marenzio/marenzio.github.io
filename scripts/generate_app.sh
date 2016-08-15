#!/bin/bash


# Requires saxon9ee and phantomjs
# saxon9ee can be aliased from Oxygen in ~/.bash_profile
# alias saxon9ee="java -jar /Applications/oxygen/lib/saxon9ee.jar"

shopt -s expand_aliases
[[ -f ~/.bash_profile ]] && source ~/.bash_profile

for i in `LS ../mei/*/*.mei`; do 
    f=${i##*/};
    n=${f:0:9}
    DIRNAME=${n//_/-}
    FILENAME=$f
    echo $FILENAME
    echo $DIRNAME
    saxon9ee $i app.xsl > ../_includes/$DIRNAME/app.html
    #sed "s/FILENAME/$FILENAME/g" $tmp | sed "s/DIRNAME/$DIRNAME/g" > ../$f.xhtml
    #mkdir ../_includes/$DIRNAME
    #inc="app text comments"
    #for i in $inc; do
    #    if [ ! -f ../_includes/$DIRNAME/$i.html ]; then
    #        touch ../_includes/$DIRNAME/$i.html
    #    fi
    #done
done
echo "Generating Gootville files ..."
#saxon9ee Gootville.svg extract-glyphs.xsl > tmp/Gootville-bounding-boxes.svg
#phantomjs generate-bbox.js tmp/Gootville-bounding-boxes.svg ../data/Gootville.xml

echo "Done!"
