# Part 1 Task 2

wloop=true # to control while loop
while $wloop	# until exit
do
	#display main menu
	echo "Choose from the menu:"
	echo "1) Invert the permissions of a file"
	echo "2) Search for a string in file"
	echo "3) Add content of all files in current directory to a file dummy.txt"
	echo "4) Check the modified date of file and modify its date to current date if modified date is greater than 24 hours"
	echo "exit) Exit"
	printf "Your choice: "
	read choice

	case $choice in
	"1")
		# maintain log file
		printf "Option 01 selected at " >> log.txt
		date >> log.txt

		#input filename
		printf "Enter name of file: "
		read fileName
		
		# maintain log file
		echo "File name: $fileName" >> log.txt

		if [ -f "$fileName" ] # if file exists, perform required operations
		then
			# display permissions
			permissions=$(ls -l $fileName | awk '{print $1}') #select only first column from output of ls
			printf "Permissions: "
			echo $permissions
			
			# maintain log file
			echo "Permissions of $fileName: $permissions" >> log.txt

			#invert permissions
			if [ ${permissions:1:1} = r ] # find if substring starting from index 1, of length 1 returns r
			then
				#if r allowed
				chmod -r $fileName
			else	#if r not allowed
				chmod +r $fileName
			fi
			if [ ${permissions:2:1} = w ]
			then
				#if w allowed
				chmod -w $fileName
			else	#if w not allowed
				chmod +w $fileName
			fi
			if [ ${permissions:3:1} = x ]
			then
				#if x allowed
				chmod -x $fileName
			else	#if x not allowed
				chmod +x $fileName
			fi
			
			# maintain log file
			echo "Permissions changed" >> log.txt

			# display updated permissions
			permissions2=$(ls -l $fileName | awk '{print $1}') #select only first column from output of ls
			printf "Updated permissions: "
			echo $permissions2

			# maintain log file
			echo "Updated Permissions of $fileName: $permissions2" >> log.txt
		else
			echo "File doesn't exist"
			# maintain log file
			echo "File does not exist" >> log.txt
		fi
		echo >> log.txt
	;;
	"2")
		# maintain log file
		printf "Option 02 selected at " >> log.txt
		date >> log.txt

		#input filename
		printf "Enter name of file: "
		read fileName2
		
		# maintain log file
		echo "File name: $fileName2" >> log.txt
		
		if [ -f "$fileName2" ] # if file exists, perform required operations
		then
			#input string
			printf "Enter a string to search in file: "
			read str
			
			# maintain log file
			echo "String: $str" >> log.txt
		
			awk /$str/ $fileName2 # output lines where string is found
			
			# maintain log file
			echo "All lines in $fileName2 where $str is found: " >> log.txt
			awk /$str/ $fileName2 >> log.txt
		else
			echo "File doesn't exist"
			# maintain log file
			echo "File does not exist" >> log.txt
		fi
		echo >> log.txt
	;;
	"3")
		# maintain log file
		printf "Option 03 selected at " >> log.txt
		date >> log.txt
		echo >> log.txt
		
		# create dummy.txt
		touch dummy.txt
		
		# print current directory
		echo "Current directory: "
		pwd
		
		echo "Files in current directory: "
		ls
		
		file1=$(ls | awk '{print $1}')
		cat $file1 >> dummy.txt
		#file2=ls | awk '{print $2}'
		#cat file2 >> dummy.txt
		
		#cat dummy.txt >> log.txt
		echo >> log.txt
	;;
	"4")
		# maintain log file
		printf "Option 04 selected at " >> log.txt
		date >> log.txt
		
		#input filename
		printf "Enter name of file: "
		read fileName4
		
		# maintain log file
		echo "File name: $fileName4" >> log.txt
		
		if [ -f "$fileName4" ] # if file exists, perform required operations
		then
			#check modified date
			info=$(ls -l $fileName4 | awk '{print $6,$7}') #select only 6 and 7th columns from output of ls (date)
			printf "Current modified date: "
			echo $info
			
			# maintain log file
			echo "Current modification date: $info" >> log.txt
			
			# store current date
			currentDate=$(date | awk '{print $2,$3,$4}')
			
			# check if modified date of file is greater than 24 hours
			if [ ${currentDate:3:3} != ${info:0:3} ] # months are not equal: difference is >24 hours
			then
				# update modified date
				touch $fileName4
				echo "Modified time updated"
				
				# maintain log file
				printf "Modified time updated: " >> log.txt
				ls -l $fileName4 | awk '{print $6,$7,$8}' >> log.txt
			else # same month of modification
				if [ $(( $((${currentDate:0:2})) - $((${info:4:2})) )) -le 1 ] # current date > modified date by >1
				then	# check time
					if [ $(( $((${currentDate:0:2})) - $((${info:4:2})) )) -eq 1 ] #dates are not equal: check time
					then
						if [ $((${currentDate:7:2})) -gt $((${info:7:2})) ] #if current time > modified by 24 hours
						then
							#update modified date
							touch $fileName4
							echo "Modified time updated"
		
							# maintain log file
							printf "Modified time updated: " >> log.txt
							ls -l $fileName4 | awk '{print $6,$7,$8}' >> log.txt
						else # time is less than 24 hr different
							# maintain log file
							echo "Modified time not updated" >> log.txt
						fi
					else # dates are equal
						# maintain log file
						echo "Modified time not updated" >> log.txt
					fi
				else # difference between dates > 1: difference is >24 hours
					# update modified date
					touch $fileName4
					echo "Modified time updated"
					
					# maintain log file
					printf "Modified time updated: " >> log.txt
					ls -l $fileName4 | awk '{print $6,$7,$8}' >> log.txt
				fi
			fi
		else
			echo "File doesn't exist"
			# maintain log file
			echo "File does not exist" >> log.txt
		fi
		echo >> log.txt
	;;
	"exit")
		# maintain log file
		echo "Option exit" >> log.txt
		printf "Script terminated at " >> log.txt
		date >> log.txt
		echo >> log.txt
		
		wloop=false #while loop will not run again
	;;
	*) echo "Invalid option entered";; #error message
	esac
echo
done # end of while loop
