#!/bin/bash
 
say_hello() {
    echo "Hello, $1"
}

sum() {
    local num1="$1"
    local num2="$2"
    echo $((num1 + num2))
}

read -p "Enter your name" name
say_hello "$name"

read -p "Enter first number " number1
read -p "Enter second number: " number2
result=$(sum "$number1" "$number2")
echo "Sum $number1 of $number2 equal: $result"