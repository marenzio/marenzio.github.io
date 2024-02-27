#!/bin/bash


# Requires saxon9ee and phantomjs
# saxon9ee can be aliased from Oxygen in ~/.bash_profile
# alias saxon="java -jar /Applications/oxygen/lib/saxon9ee.jar"

shopt -s expand_aliases
[[ -f ~/.bash_profile ]] && source ~/.bash_profile

#books=('M_01_5' 'M_06_5' 'M_06_5')
books=('M_04_6')

# indentation for xmllint
# export XMLLINT_INDENT="    "

for b in ${books[@]}; do
    echo "Processing book $b";
    DIRNAME_BOOK=${b//_/-}
    FILENAME_BOOK="apparatus.html"
    rm ../_includes/$DIRNAME_BOOK/$FILENAME_BOOK
    echo $DIRNAME_BOOK;
    
    for i in `LS ../mei/*/$b*.mei`; do 
        f=${i##*/};
        n=${f:0:9}
        DIRNAME=${n//_/-}
        FILENAME=$f
        echo $FILENAME
        echo $DIRNAME

        # cp $i tmp.mei
        # xmllint --format tmp.mei | sed  's/\/>/ \/>/g' > $i
        # rm tmp.mei
        
        saxon $i app.xsl > ../_includes/$DIRNAME/app.html
        saxon $i app.xsl output=full elem=span >> ../_includes/$DIRNAME_BOOK/$FILENAME_BOOK
        echo "" >> ../_includes/$DIRNAME_BOOK/$FILENAME_BOOK
        
        saxon $i text-comments.xsl part=front > ../_includes/$DIRNAME/text.html
        saxon $i text-comments.xsl part=back > ../_includes/$DIRNAME/comments.html
    done

done

echo "Done!"
