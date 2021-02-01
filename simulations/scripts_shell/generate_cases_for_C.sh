#!/bin/bash

p=("500")
n=("50")
delta=("0.00" "0.05" "0.10")
T=("8")

for (( i=0; i<1; i++ ));
do
  for (( j=0; j<1; j++ ));
  do
    for (( k=0; k<1; k++ ));
    do
      for ((d=0; d<3; d++));
      do
        for ((num=1;num<501;num++))
        do
        filename="${i}_${j}_${k}_${d}_${num}"
        echo "${p[$i]} ${n[$j]} ${T[$k]} ${delta[$d]} ${num}" > ${filename}.input2
        done
      done
    done
  done
done
