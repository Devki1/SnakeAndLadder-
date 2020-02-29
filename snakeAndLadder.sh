#!/bin/bash -x
echo "Welcome to snake and ladder Simulation"
#snake and ladder game played with single player and  start with zero position
#VARIABLES
numberofPlayer=2
position=0
position1=0
position2=0
DontPlay=0
Ladder=1
snake=2
diecount=0
diecount2=0
declare -A diePosition
function snakeGame()
{
	position=$1
	playerRollsDie=$((RANDOM%6+1))
	checkOption=$((RANDOM%3))
	case $checkOption in
		$DontPlay)
				position=$position
				;;
		$Ladder)
				#Exact winning condition
				if(( $((position+playerRollsDie))>100 ))
				then
					position=$position
				else
					position=$((position+playerRollsDie))
					position=$position
				fi
				;;
		$snake)
			#Exact restart condition
				if(($position>$playerRollsDie))
				then
					position=$((position-playerRollsDie))
					position=$position
				else
					position=0
				fi
				;;
	esac
	diePosition[$diecount]=$position
	echo $position
}
#Till play 100 for both player
while(($position1!=100 && $position2!=100))
do
	((diecount++))
	position1="$(snakeGame $position1)"
	echo "player1 $diecount : Position $position1"
	((diecount2++))
	position2="$(snakeGame $position2)"
	echo "player2 $diecount2 : Position $position2"
done
#This is used to  winning position
if(($position1==100))
then
	echo "Congratulations!!! Player1 Won !!\nPlayer1 roll the $diecount times \n"
else
	echo "Congratulations!!!! Player2 Won !! \nPlayer2 roll the $diecount2 times \n"
fi
