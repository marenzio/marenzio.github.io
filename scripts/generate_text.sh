#!/bin/bash

for i in `LS ../tei/*.xml`; do
    # format source file
    cp $i tmp.xml
    xmllint --format tmp.xml > $i
    f=${i##*/};
    FILENAME=${f%%.xml}.html
    echo $FILENAME
    bin/teitohtml --verbose $i tmp.html
    xmllint --format tmp.html | tail -n +2 >  ../texts/$FILENAME
done

echo "Done!"
