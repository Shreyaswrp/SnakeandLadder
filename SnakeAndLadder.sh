#! /bin/bash -x

#CONSTANTS
START_POSITION=0

#variables
positionOfPlayer1=0
positionOfPlayer2=0

#to store the position after every dice roll
declare -a diceArrayPlayer1
declare -a diceArrayPlayer2
diceRollPlayer1=0
diceRollPlayer2=0

#stay in the same position
No_Play=0
#move ahead
Ladder=1
#move behind
Snake=2

function rollAdie() {

	if [[ $1 -eq 1 ]]
	then
		#rolling a die to get the result using RANDOM
        	dieResult=$((RANDOM % 6 + 1))
	 	#to get dice roll count
        	((diceRollPlayer1++))

	else
        	dieResult=$((RANDOM % 6 + 1))
        	((diceRollPlayer2++))
	fi
}


function play ( ) {

	while [ $positionOfPlayer1 -lt 100 ] && [ $positionOfPlayer2 -lt 100 ]
	do
		#rolling a die for players 1 and 2
		rollAdie 1
		rollAdie 2
		#getting options to proceed in the game for players 1 and 2
		getOptions 1
		getOptions 2

	done
}

#to get options of no play,snake or ladder
function getOptions () {

	#checking for options to proceed using RANDOM
	options=$((RANDOM % 3))

	case $options in

		0)if [[ $1 -eq 1 ]]
		  then
			positionOfPlayer1=$((positionOfPlayer1))
			diceArrayPlayer1[$diceRollPlayer1]=$positionOfPlayer1
		  else
			position0fPlayer2=$((positionOfPlayer2))
			diceArrayPlayer2[$diceRollPlayer2]=$positionOfPlayer2
		  fi;;

		1)if [[ $1 -eq 1 ]]
		  then
			result=$((positionOfPlayer1+dieResult))
			if [ $result -le 100 ]
			then
				positionOfPlayer1=$((positionOfPlayer1+dieResult))
				diceArrayPlayer1[$diceRollPlayer1]=$positionOfPlayer1
				#if got ladder,play again
				rollAdie $1
				getOptions $1
			else
				positionOfPlayer1=$positionOfPlayer1
				diceArrayPlayer1[$diceRollPlayer1]=$positionOfPlayer1
			fi
		else
			result=$((positionOfPlayer2+dieResult))
			if [ $result -le 100 ]
                        then
                                positionOfPlayer2=$((positionOfPlayer2+dieResult))
                                diceArrayPlayer2[$diceRollPlayer2]=$positionOfPlayer2
				rollAdie $2
				getOptions $2
                        else
                                positionOfPlayer2=$positionOfPlayer2
                                diceArrayPlayer2[$diceRollPlayer2]=$positionOfPlayer2
                        fi
		fi
			;;

		2)if [ $1 -eq 1 ]
		  then
			result=$((positionOfPlayer1-dieResult))
			if [ $result -gt 0 ]
			then
				positionOfPlayer1=$((positionOfPlayer1-dieResult))
				diceArrayPlayer1[$diceRollPlayer1]=$positionOfPlayer1
			else
				positionOfPlayer1=0
				diceArrayPlayer1[$diceRollPlayer1]=$positionOfPlayer1
			fi
		  else
			result=$((positionOfPlayer2-dieResult))
			if [ $result -gt 0 ]
                        then
                                positionOfPlayer2=$((positionOfPlayer2-dieResult))
                                diceArrayPlayer2[$diceRollPlayer2]=$positionOfPlayer2
                        else
                                positionOfPlayer2=0
                                diceArrayPlayer2[$diceRollPlayer2]=$positionOfPlayer2
                        fi
		  fi
				;;

	esac

}

play

#checking which player is the winner
if [ $positionOfPlayer1 -gt $positionOfPlayer2 ]
then
	echo "player1 won the game and rolled the dice for $diceRollPlayer1 times"
else
	echo "player2 won the game and rolled  the dice for $diceRollPlayer2 times"
fi

#dispalying every positions of the two players
echo ${diceArrayPlayer1[@]}
echo ${diceArrayPlayer2[@]}
