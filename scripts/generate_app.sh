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
    saxon9ee $i text-comments.xsl part=front > ../_includes/$DIRNAME/text.html
    saxon9ee $i text-comments.xsl part=back > ../_includes/$DIRNAME/comments.html
done

echo "Done!"
