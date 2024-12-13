#!/bin/bash
ASKFILE=$1
CUR_DIR=$PWD
IFS='
' 
echo -e "File list $CUR_DIR:\n"

i=0

for str in $(ls -Al)
do
	if [ $i -eq 0 ]
	 then
	  i=$((i + 1))
	  continue
	fi
	file=$(echo "$str" | grep -oP '\S+$')
	rights=$(echo "$str" | grep -oP '(?<=^.).{9}')
	type_symbol=$(echo "$str" | grep -oP '^.{1}')
	case $type_symbol in
	  -)
	   TYPE="Simple file"
	   ;;
    b)
     TYPE="Block special file"
     ;;
	  c)
     TYPE="Character special file"
     ;;
	  l)
     TYPE="Symbolic link"
     ;;
	  p)
	   TYPE="FIFO"
	   ;;
	  s)
	   TYPE="Socket "
	   ;;
	  d)
	   TYPE="Directory"
	   ;;
	   w)
	   TYPE="Whiteout"
	   ;;
	esac
	result="$i Rights: $rights \t$TYPE\t"
	result="$result $file"
	i=$((i+1))
	echo -e "$result"
done

if  [ "$ASKFILE" != "" ]; then
	echo 
	if [ -f "$ASKFILE" ]; then
    		echo "File '$ASKFILE' found in current directory"
	else
    		echo "File '$ASKFILE' not found in current directory"
	fi

fi
	echo