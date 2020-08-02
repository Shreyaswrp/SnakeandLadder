#! /bin/bash -x

#CONSTANTS
START_POSITION=0

#variables
player=1
position=0

while [ $position -lt 100 ]
do
	#rolling a die to get the result using RANDOM
	dieResult=$((RANDOM % 6 + 1))

	#checking for options to proceed using RANDOM
	options=$((RANDOM % 3))

	case $options in

		0)position=$((position));;

		1)result=$((position+dieResult))
			if [ $result -le 100 ]
			then
				position=$((position+dieResult))
			else
				position=$position
			fi
			;;

		2)result=$((position-dieResult))
			if [ $result -gt 0 ]
			then
				position=$((position-dieResult))
			else
				position=$position
			fi;;


	esac

done
echo $position

