#!/bin/bash

set -m 

sleep 10 &
pid1=$!
echo "Process 1 sleep 10 with PID: $pid1"

sleep 15 &
pid2=$!
echo "Process 2 sleep 15 with PID: $pid2"

sleep 20 &
pid3=$!
echo "Process 3 sleep 20 with PID: $pid3"

echo -e "Backgroud tasks:"
jobs

read -p "Press Enter, to continue and move task from the background..."

fg %1

echo -e "Backgroud tasks after fg:"
jobs

read -p "Press Enter, to move second (sleep 15) to background..."

bg %2

echo -e "Background task after bg:"
jobs

echo "The end"