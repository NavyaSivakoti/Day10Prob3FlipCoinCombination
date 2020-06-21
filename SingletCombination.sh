#!/bin/bash -x

declare -A flip_value
head=0
tail=0
read -p "How many times to Flip: " num

for ((i=0; i<$num; i++ ))
{
	if [ $((RANDOM%2)) -eq 0 ]
	then
		echo "HEADS"
		((head++))
		flip_value[$i]="H"
	else
		echo "TAILS"
		((tail++))
		flip_value[$i]="T"
	fi
}
echo "heads: " $head
echo "tails: " $tail

echo "${flip_value[@]}"

echo "Singlet Combination HEAD %" $((head*100/num))
echo "Singlet Combination TAIL %" $((tail*100/num))
