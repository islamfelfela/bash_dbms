function deleteTable {
	echo enter the name of the table to delete
	read -e dbtable
	##########
	# not exist
	if ! [[ -f "$dbtable" ]]; then
		echo -e "\e[41mthis table doesn't exist\e[0m"
		echo press any key
		read -e
	##########
	# exists
	else
		rm "$dbtable"
		echo -e "\e[42mtable deleted\e[0m"
		echo press any key
		read -e
	fi
}