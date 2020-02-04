#! /bin/bash
clear;

. ./useDB.sh
. ./ShowDBS.sh
. ./MakeDB.sh
. ./operations.sh
. ./deleteTable.sh
. ./creatTable.sh
. ./insertIntoTable.sh
. ./selectAllFromTable.sh

dbsScreen=true;
	################################################################################
	# Databases Screen
	while $dbsScreen; do
	PS3="dbscreen> : "
		#clear;
		#echo -e "\t\tYour Existing Databases:\n$(find -maxdepth 1 -type d | cut -d'/' -f2 | sed '1d')"
		#separator;
		select choice in "Create a new database" "Use existing Database" "Drop Database" "Exite" "Show dbs"; do 
		case $REPLY in
			1 ) #Create a database

				# if ! [[  -e `pwd`/DB ]]; then
				# 	mkdir -p ./DataBases
				# fi
				# cd ./DB/
			

				separator;
				createDb;

					echo -e "\e[42mDatabase is loading...\e[0m"
				echo press any key
				read
				;;
			2 ) # Use existing
				echo "Use DataBase"
				useDB
				# separator;
				# useExistingDb;
				break
				;;
			3 ) # Drop Database
				# separator;
				# dropDb;
				;;
			4 ) # Exite
				#cd /home/felfela/Desktop/bash_dbms
				exite
				# welcomeScreen=true
				# dbsScreen=false
				# tablesScreen=false
				;;
				5) #showDatabases
				# ShowDBS;
				ShowDBS
	 	echo -e "\e[42mDatabase is loading...\e[0m"
				echo press any key
				read

	

			
				;;
			* )
				echo -e "\e[41minvalid entry\e[0m"
				echo press any key
				read
				;;
		esac
		break
		done
	done
	
################################################################################


