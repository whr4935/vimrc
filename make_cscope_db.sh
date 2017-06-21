#!/bin/sh
# add arguments for extra include path.

kernel_mode=1   #kernel_mode doesn't serach system include path.
cscope_arg=-bqk

while test $# != 0
do
    case $1 in
        -n|--native)
            kernel_mode=0
            shift
            ;;

        -k|--kernel-mode)
            kernel_mode=1
            shift
            ;;

        -h|--help)
            echo -n "make_cscope_db.sh [-n|k] [extra include paths]\n"
            echo "\t-n: set to native project mode."
            echo "\t-k: set to kernel mode (don't search system include path)."
            echo "\t-h: show this help."
            exit 0
            ;;

        *) break
            ;;
    esac
done

if [ $kernel_mode -eq 0 ];then
    cscope_arg=${cscope_arg%k}
    echo -n "native mode, "
else
    echo -n "kernel mode, "
fi
echo cscope_arg=$cscope_arg


for i in $@
do
    arg="-I"$i
    args=$args" "$arg
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
ctags -R --c++-kinds=+px --fields=+iaS --extra=+q $PWD $@



