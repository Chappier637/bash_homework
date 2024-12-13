#!/bin/bash
 
read -p "Enter a number: " number

if (( number > 0 )); then
    echo "Positive"
    
    cnt=1
    echo "From 1 to $number"       
    while (( cnt <= number )); do
        echo $cnt
        ((cnt++))
    done

elif (( number < 0 )); then
    echo "Negative"
else
    echo "Zero"
fi