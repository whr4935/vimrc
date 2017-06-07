#!/bin/sh
# add arguments for extra include path.

for i in $@;do
    arg="-I"$i" "
    args=$args$arg 
done


find $PWD -path .git -prune -o -name "*.h" -o -name "*.hpp" -o -name "*.c"-o -name "*.cc" -o -name "*.cpp" > cscope.files
if [ -n "$args"  ];then
    echo "extra args:\n  $args"
fi

cscope -bkq -i cscope.files $args
# ctags --c++-kinds=+px --fields=+iaS --extra=+q -L cscope.files
ctags -R --c++-kinds=+px --fields=+iaS --extra=+q . $@
