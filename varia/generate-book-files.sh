for i in `LS *.sib`; do 
    f=${i%%.sib}; 
    n=${f##M_??_?_??_}; 
    echo "#    - id: \"$f.xhtml\""
    echo "#      name: \"${n//_/ }\""
done

tmp="../varia/M-06-5-tmp.xhtml"
for i in `LS *.sib`; do 
    f=${i%%.sib};
    n=${f:0:9}
    DIRNAME=${n//_/-}
    FILENAME=$f
    echo $FILENAME
    echo $DIRNAME
    sed "s/FILENAME/$FILENAME/g" $tmp | sed "s/DIRNAME/$DIRNAME/g" > ../$f.xhtml
    mkdir ../_includes/$DIRNAME
    inc="app text comments"
    for i in $inc; do
        if [ ! -f ../_includes/$DIRNAME/$i.html ]; then
            touch ../_includes/$DIRNAME/$i.html
        fi
    done
done