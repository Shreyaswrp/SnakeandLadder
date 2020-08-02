#! /bin/bash -x

#CONSTANTS
START_POSITION=0

#variables
player=1
position=0

#to store the position after every dice roll
declare -a diceArray
diceRoll=0

while [ $position -lt 100 ]
do
	#rolling a die to get the result using RANDOM
	dieResult=$((RANDOM % 6 + 1))

	#to get dice roll count
	((diceRoll++))
	#checking for options to proceed using RANDOM
	options=$((RANDOM % 3))

	case $options in

		0)position=$((position))
			    diceArray[$diceRoll]=$position;;

		1)result=$((position+dieResult))
			if [ $result -le 100 ]
			then
				position=$((position+dieResult))
				diceArray[$diceRoll]=$position
			else
				position=$position
				diceArray[$diceRoll]=$position
			fi
			;;

		2)result=$((position-dieResult))
			if [ $result -gt 0 ]
			then
				position=$((position-dieResult))
				diceArray[$diceRoll]=$position
			else
				position=$position
				diceArray[$diceRoll]=$position
			fi;;


	esac

done

echo $position
echo $diceRoll times dice was played to win the game.
echo Positions after every dice roll ${diceArray[@]}

