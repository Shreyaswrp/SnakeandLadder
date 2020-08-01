#! /bin/bash -x

#CONSTANTS
START_POSITION=0

#variables
player=1
position=0

#rolling a die to get the result using RANDOM
dieresult=$((RANDOM % 6 + 1))

#checking for options to proceed using RANDOM
options=$((RANDOM % 3))
if [[ $options == 0 ]]
	then
		echo "No play"
	elif [[ $options == 1 ]]
		then
			echo "Snake"
			position=$((position - dieresult))
	else
		echo "Ladder"
		positin=$((position + dieresult ))
fi

