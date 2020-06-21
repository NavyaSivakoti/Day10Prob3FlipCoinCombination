#!/bin/bash -x

declare -A flip_value
declare -A flip_Newvalue
declare -A final
head=0
tail=0
nhead=0
ntail=0
countHH=0
countHT=0
countTH=0
countTT=0
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

for ((j=0; j<$num; j++ ))
{
        if [ $((RANDOM%2)) -eq 0 ]
        then
                echo "HEADS"
                ((nhead++))
                flip_Newvalue[$j]="H"
        else
                echo "TAILS"
                ((ntail++))
                flip_Newvalue[$j]="T"
        fi
}

echo "heads: " $head
echo "tails: " $tail
echo "nhead: " $nhead
echo "ntail: " $ntail


echo "Dict1 : ${flip_value[@]}"
echo "Dict2 : ${flip_Newvalue[@]}"
for (( k=0; k<$num; k++ ))
{
	echo "final loop " ${flip_value[$k]}
	echo "final new loop" ${flip_Newvalue[$k]}
	final[$k]=${flip_value[$k]}${flip_Newvalue[$k]}
}

echo "final : ${final[@]}"

for ele in ${final[@]}
do
	if [ $ele == HH ]
	then
		((countHH++))
	fi
done


for ele in ${final[@]}
do
        if [ $ele == HT ]
        then
                ((countHT++))
        fi
done


for ele in ${final[@]}
do
        if [ $ele == TH ]
        then
                ((countTH++))
        fi
done


for ele in ${final[@]}
do
        if [ $ele == TT ]
        then
                ((countTT++))
        fi
done


echo "HH Count : $countHH"
echo "HT Count : $countHT"
echo "TH Count : $countTH"
echo "TT Count : $countTT"

echo "Doublet Combination HH %" $((countHH*100/num))
echo "Doublet Combination HT %" $((countHT*100/num))
echo "Doublet Combination TH %" $((countTH*100/num))
echo "Doublet Combination TT %" $((countTT*100/num))

