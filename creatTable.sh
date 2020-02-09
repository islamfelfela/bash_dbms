#! /bin/bash

creatTable(){


		# Table Name
		echo "Enter Table Name : "
		read -e dbtable

		# handle Null Entry
		if [[ $dbtable = "" ]]; then
			echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
			echo press any key
			read -e;

		# handle special chars
		elif [[ $dbtable =~ [/.:\|\-] ]]; then
			echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
			echo press any key
			read -e

		# table name exists
		elif [[ -e "$dbtable" ]]; then
			echo -e "\e[41m Table exists\e[0m"
			echo press any key
			read -e
			# break
		# new table
		elif  [[ $dbtable =~ ^[a-zA-Z] ]]; then
			touch "$dbtable"
			createMetaData;
		else
			echo -e "\e[41mTable name can't start with numbers or special characters\e[0m"
			echo press any key
			read -e
		fi

}





