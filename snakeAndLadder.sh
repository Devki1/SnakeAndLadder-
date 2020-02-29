#!/bin/bash -x
echo "Welcome to snake and ladder Simulation"
#snake and ladder game played with single player and  start with zero position
numberofPlayer=1
position=0
DontPlay=0
Ladder=1
snake=2
#Winning condition
while(($position!=100))
do
	playerRollsDie=$((RANDOM%6+1))
	checkOption=$((RANDOM%3))
	case $checkOption in
		$DontPlay)
			position=$position
			echo "Stay in the same position:"$position
			printf "\n"
			;;
		$Ladder)
			#Exact winning position
			if(( $(($position+$playerRollsDie))>100))
			then
				position=$position
				echo "you staying in same position:"$position
			else
				position=$(($position+$playerRollsDie))
				echo "you are new position is :"$position
			fi
			printf "\n"
			;;
		$snake)
			position=$(($position-$playerRollsDie))
			echo "new position:"$position
			#Exact restart condition
			if(($position<0))
			then
				position=0
			fi
			printf "\n"
			;;
	esac
done
