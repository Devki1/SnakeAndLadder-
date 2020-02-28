#!/bin/bash -x
echo "Welcome to snake and ladder Simulation"
#snake and ladder game played with single player and  start with zero position
numberofPlayer=1
position=0
DontPlay=0
Ladder=1
snake=2
while(($position!=100))
do
	playerRollsDie=$((RANDOM%6+1))
	checkOption=$((RANDOM%3))
	case $checkOption in
		$DontPlay)
			position=$position
			echo "Stay in the same $position"
			;;
		$Ladder)
			position=$(($position+$playerRollsDie))
			echo "counted a ladder position:"$position
			;;
		$snake)
			position=$(($position-$playerRollsDie))
			echo "new position:"$position
			if(($position<0))
			then
				position=0
			fi
			;;
	esac
done
