# Part 1 Task 1

# check number of arguments:
# if number of arguments != 2, error
if [ $# -ne 2 ]
then
	echo "You have entered an incorrect number of arguments." #error message
	exit 1
fi

# check second argument
# if it is negative or 0, error
if [ $2 -le 0 ]
then
	echo "Second argument can be a positive integer only." #error message
	exit 0
fi

# check first argument using switch case
# if it is {left, right, full}, output pattern depending on input parameters
# if it is none of the above, error
case $1 in
left)   # code for first half of left diamond
	for (( i = 0; i < $2; i++ )) #control number of rows
	do
		for (( j = 0; j <= i; j++ )) #control number of characters in each row
		do
			printf "*" # to print without newline.
		done
		echo #print a new line
	done
	# code for second half of left diamond
	for (( i = "$[$2-1]"; i > 0; i-- )) #control number of rows
	do
		for (( j = 0; j < i; j++ )) #control number of characters in each row
		do
			printf "*"
		done
		echo
	done
;;
right)  # code for first half of right diamond
	# code for initial spaces
	for (( i = 0; i < $2; i++ )) #control number of rows
	do
		for (( j = "$[$2-1]"; j > i; j-- )) #control number of spaces in each row
		do
			printf " "
		done
		# code for output
		for (( k = 0; k <= i; k++ )) #control number of characters in each row
		do
			printf "*"
		done
	echo
	done
	# code for second half of right diamond
	# code for initial spaces
	for (( i = 1; i < $2; i ++ )) #control number of rows
	do
		for (( j = 0; j < i; j++ )) #control number of spaces in each row
		do
			printf " "
		done
		for (( k = "$[$2-1]"; k >= i; k-- )) #control number of characters in each row
		do
			printf "*"
		done
	echo
	done
;;
full)   # code for first horizontal half of diamond
	# code for initial spaces
	for (( i = 0; i < $2; i++ )) #control number of rows
	do
		for (( j = "$[$2-1]"; j > i; j-- )) #control number of spaces in each row
		do
			printf " "
		done
		# code for output
		for (( k = 0; k <= i; k++ )) #control number of characters in each row
		do
			printf "*"
		done
		# code after first vertical half of diamond
		if [ $i -ne 0 ]
		then
			for (( l = 0; l < i; l++ ))
			do
				printf "*"
			done
		fi
	echo
	done
	# code for second horizontal half of diamond
	# code for initial spaces
	for (( i = 1; i <= $2; i ++ )) #control number of rows
	do
		for (( j = 0; j < i; j++ )) #control number of spaces in each row
		do
			printf " "
		done
		for (( k = i; k < $2; k++ ))	#control number of characters in each row
		do
			printf "*"
			# code for second vertical half of diamond
			if [ $k -eq "$[$2-1]" ] #if all *s of first half are printed
			then
				for (( l = k; l > i; l-- ))
				do
					printf "*"
				done
			fi
		done
	echo
	done
;;
*) echo "First argument can be left, right, or full only.";; #error message
esac

