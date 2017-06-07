#!/bin/sh

find $PWD -path .git -prune -o -name "*.h" -o -name "*.hpp" -o -name "*.c"-o -name "*.cc" -o -name "*.cpp" > cscope.files
if [ -n "$*"  ];then
    echo "extra args:\n  $@"
fi
cscope -bkq -i cscope.files $@
# ctags -R
