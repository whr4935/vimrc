#!/bin/sh
# add arguments for extra include path.

native_project=0


while test $# != 0
do
    case $1 in
        -n|--native) native_project=1
            shift
            ;;

        -h|--help)
            echo -n "make_cscope_db.sh [args] [include path]\n"
            echo "\t-n: is native project."
            echo "\t-h: show this help."
            shift
            break
            ;;

        *) break
            ;;
    esac
done

# echo $native_project

if [ $native_project -eq 1 ];then
    cscope_arg=-bq
    echo cscope_arg=$cscope_arg
else
    cscope_arg=-bkq
fi


# exit


for i in $@;do
    arg="-I"$i" "
    args=$args$arg 
done


find $PWD -path .git  -prune \
    -o -name "*.h"    -print \
    -o -name "*.hpp"  -print \
    -o -name "*.c"    -print \
    -o -name "*.cc"   -print \
    -o -name "*.cpp" > cscope.files

if [ -n "$args"  ];then
    echo "extra args:\n  $args"
fi

cscope $cscope_arg  -i cscope.files $args
# ctags --c++-kinds=+px --fields=+iaS --extra=+q -L cscope.files
ctags -R --c++-kinds=+px --fields=+iaS --extra=+q . $@





