#!/bin/bash

p=("500" "750" "1000")
n=("50")
T=("8")
delta=("0.0" "0.05" "0.10")

for (( i=0; i<3; i++ ));
do
  for (( j=0; j<1; j++ ));
  do
    for (( k=0; k<1; k++ ));
    do
     for ((s=0; s<3; s++ ));
	do
      filename="${i}_${j}_${k}_${s}"
      echo "${p[$i]} ${n[$j]} ${T[$k]} ${delta[$s]}" > ${filename}.input1
     done
   done
  done
done
