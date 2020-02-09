#! /bin/bash

function checkDataType {
	datatype=$(head -1 $2 | cut -d ':' -f$3 | awk -F "-" 'BEGIN { RS = ":" } {print $2}')
	if [[ "$1" = '' ]]; then
		echo 1
	elif [[ "$1" = -?(0) ]]; then
		echo 0 # error!
	elif [[ "$1" = ?(-)+([0-9])?(.)*([0-9]) ]]; then
		if [[ $datatype == integer ]]; then
			# datatype integer and the input is integer
			echo 1
		else
			# datatype string and input is integer
			echo 1
		fi
	else
		if [[ $datatype == integer ]]; then
			# datatype integer and input is string
			echo 0 # error!
		else
			# datatype string and input is string
			echo 1
		fi
	fi
}

# Check Size
function check_size {
		datasize=$(head -1 $2 | cut -d ':' -f$3 | awk -F "-" 'BEGIN { RS = ":" } {print $3}')
		if [[ "${#1}" -le $datasize ]]; then
				echo 1
			else
				echo 0 # error
		fi
}

function insertData {
	##########
	# choose the table
	echo enter the name of the table
	read -e dbtable
	##########
	# not exist
	if ! [[ -f "$dbtable" ]]; then
		echo -e "\e[41mthis table doesn't exist\e[0m"
		echo press any key
		read -e
	else
		##########
		## table exists
		insertingData=true
		while $insertingData ; do
			##########
			# enter pk
			## => enter pk of type "id" of type integer and size 1
			echo -e "enter primary key \"\e[44m$(head -1 "$dbtable" | cut -d ':' -f1 | awk -F "-" '{print $1}')\e[0m\" of type \e[44m$(head -1 "$dbtable" | cut -d ':' -f1 | awk -F "-" '{print $2}')\e[0m and size \e[44m$(head -1 "$dbtable" | cut -d ':' -f1 | awk -F "-" '{print $3}')\e[0m"

			read -e
			##########
			# match data & size
			check_type=$(check_dataType "$REPLY" "$dbtable" 1)
			check_size=$(check_size "$REPLY" "$dbtable" 1)
			#=> print all records except first record
			pk_used=$(cut -d ':' -f1 "$dbtable" | awk '{if(NR != 1) print $0}' | grep -x -e "$REPLY") 
			##########
			# null entry
			if [[ "$REPLY" == '' ]]; then
				echo -e "\e[41mno entry\e[0m"
			#############
			# special characters
			elif [[ $REPLY =~ [/.:\|\-] ]]; then
				echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
			##########
			# not matching datatype 
			elif [[ "$check_type" == 0 ]]; then 
				echo -e "\e[41mentry invalid\e[0m"
			##########
			# not matching size	
			elif [[ "$check_size" == 0 ]]; then
				echo -e "\e[41mentry size invalid\e[0m"
			##########
			#! if primary key exists
			elif ! [[ "$pk_used" == '' ]]; then
				echo -e "\e[41mthis primary key is already used\e[0m"
			##########
			# primary key is valid
			else 
				echo -n "$REPLY" >> "$dbtable"
				echo -n ':' >> "$dbtable"
				##########
				# to get number of columns in table
				num_col=$(head -1 "$dbtable" | awk -F: '{print NF}')
				## to iterate over the columns after the primary key, in order to enter its data
				for (( i = 2; i <= num_col; i++ )); do
					##########
					# enter other data
					inserting_other_data=true
					while $inserting_other_data ; do
						echo -e "enter \"\e[44m$(head -1 "$dbtable" | cut -d ':' -f$i | awk -F "-" 'BEGIN { RS = ":" } {print $1}')\e[0m\" of type \e[44m$(head -1 "$dbtable" | cut -d ':' -f$i | awk -F "-" 'BEGIN { RS = ":" } {print $2}')\e[0m and size \e[44m$(head -1 "$dbtable" | cut -d ':' -f$i | awk -F "-" 'BEGIN { RS = ":" } {print $3}')\e[0m"

						read -e
						##########
						# match data with its col datatype & size
						check_type=$(check_dataType "$REPLY" "$dbtable" "$i")
						check_size=$(check_size "$REPLY" "$dbtable" "$i")
						##########
						# not matching datatype
						if [[ "$check_type" == 0 ]]; then
							echo -e "\e[41mentry invalid\e[0m"
						##########
						# not matching size
						elif [[ "$check_size" == 0 ]]; then
							echo -e "\e[41mentry size invalid\e[0m"
						#############
						# special characters
						elif [[ $REPLY =~ [/.:\|\-] ]]; then
							echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
						##########
						# entry is valid
						else
							##########
							# if last column
							if [[ i -eq $num_col ]]; then
								echo "$REPLY" >> "$dbtable"
								inserting_other_data=false
								insertingData=false
								echo -e "\e[42mentry inserted successfully\e[0m"
							else
								##########
								# next column 
								echo -n "$REPLY": >> "$dbtable"
								inserting_other_data=false
							fi
						fi
					done
				done
			fi
		done
		echo press any key
		read -e
	fi
}