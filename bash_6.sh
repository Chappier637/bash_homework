#!/bin/bash

if [ -f input.txt ]; then
    echo "File input.txt found. Contents:"
    cat input.txt
else
    echo "File input.txt not found."
    exit 1
fi

wc -l < input.txt > output.txt
echo "Strings in input.txt written to output.txt."

ls non_existent_file 2> error.log
echo "Erros of ls written to error.log."