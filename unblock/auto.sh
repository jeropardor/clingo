#!/bin/bash

num=$1
visualize=$2

if [ -z "$1" ] || [ "$num" -lt 1 ] || [ "$num" -gt 10 ]
then
    printf "Enter a valid test number: \"./auto.sh <N> [-v]\"\n\t n: (1..10)\n\t -v: visualize solution\n"
    exit 0
fi


# encode
python3 encode.py < examples/level$num.txt > examples/level$num.lp

# solve
telingo --verbose=0 --warn none unblock.lp examples/level$num.lp > examples/sol$num.txt

# clean
rm examples/level$num.lp

# visualize
if [ ! -z "$2" ] || [ "$visualize" = "-v" ]
then
    python3 showunblock.py examples/level$num.txt examples/sol$num.txt
fi
