
#! /bin/bash

function deleteRow
 {

	########## Tested Dummy Inserted Data by hand 
	# choose table Name
	echo enter name of the table
	read -e dbtable
	##########
	# if table not exist
	if ! [[ -f "$dbtable" ]]; then
		echo -e "\e[41mthis table doesn't exist\e[0m"
		echo press any key
		read -e
	else
		##########
		# if table exists
		##########
		# enter primary key
		echo -e "enter primary key \"\e[44m$(head -1 "$dbtable" | cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $1}')\e[0m\" of type \e[44m$(head -1 "$dbtable" | cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $2}')\e[0m and size \e[44m$(head -1 "$dbtable" | cut -d ':' -f1 | awk -F "-" 'BEGIN { RS = ":" } {print $3}')\e[0m" of the record to delete
		
		read -e
		#########
		# get Number of record
		recordNum=$(cut -d ':' -f1 "$dbtable" | awk '{if(NR != 1) print $0}'	| grep -x -n -e "$REPLY" | cut -d':' -f1)
		#! -x => exact match // -e => pattern // -n record number prefix

		##########
		# if enter null Value
		if [[ "$REPLY" == '' ]]; then
			echo -e "\e[41mno entry\e[0m"
		##########
		# if record not exist
		elif [[ "$recordNum" = '' ]]; then
			echo -e "\e[41mthis primary key doesn't exist\e[0m"
		##########
		# if record exists
		else
			let recordNum=$recordNum+1 #!=> recordNum is 0 based but sed is 1 based
			sed -i "${recordNum}d" "$dbtable"
			echo -e "\e[42mrecord deleted successfully\e[0m"
		fi
		echo press any key
		read -e
	fi
}