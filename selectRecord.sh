# Display Record (Row)
function displayRow {
	##########
	# choose table
	echo enter name of the table
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
		##########
		# enter pk
		echo enter primary key \"$(head -1 "$dbtable" | cut -d ':' -f1 |\
		awk -F "-" 'BEGIN { RS = ":" } {print $1}')\" of type $(head -1 "$dbtable"\
		| cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $2}') and size $(head -1 "$dbtable"\
		| cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $3}') of the record
		read
		
		recordNum=$(cut -d ':' -f1 "$dbtable" | sed '1d'\
		| grep -x -n -e "$REPLY" | cut -d':' -f1)
		##########
		# null entry
		if [[ "$REPLY" == '' ]]; then
			echo -e "\e[41mno entry\e[0m"
		##########
		# record not exists
		elif [[ "$recordNum" = '' ]]; then
			echo -e "\e[41mthis primary key doesn't exist\e[0m"
		##########
		# record exists
		else
			let recordNum=$recordNum+1
			num_col=$(head -1 "$dbtable" | awk -F: '{print NF}') 
			##########
			# to show the other values of record
			separator;
			echo -e "\e[42mfields and values of this record:\e[0m"
			for (( i = 2; i <= num_col; i++ )); do
					echo \"$(head -1 $dbtable | cut -d ':' -f$i | awk -F "-" 'BEGIN { RS = ":" } {print $1}')\" : $(sed -n "${recordNum}p" "$dbtable" | cut -d: -f$i)
			done
			separator;
		fi
		echo press any key
		read -e
	fi
}