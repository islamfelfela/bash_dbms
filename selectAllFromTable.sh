#! /bin/bash


function selectAllFromTable {
	# choose table
	echo enter name of the table
	read dbtable
	# not exist
	if ! [[ -f "$dbtable" ]]; then
		echo -e "\e[41mthis table doesn't exist\e[0m"
		echo press any key
		read
	else
		
		## table exists
		
		# display table's data
		echo "------------------------------------------------------------"
		head -1 "$dbtable" | awk 'BEGIN{ RS = ":"; FS = "-" } {print $1}' | awk 'BEGIN{ORS="\t"} {print $0}'
		echo -e "\n------------------------------------------------------------"
		sed '1d' "$dbtable" | awk -F: 'BEGIN{OFS="\t"} {for(n = 1; n <= NF; n++) $n=$n}  1'
		echo $'\n'press any key
		read
	fi
}