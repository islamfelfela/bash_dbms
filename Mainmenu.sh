#! /bin/bash

Mainmenu(){

clear;
. ./useDB.sh
. ./ShowDBS.sh
. ./MakeDB.sh
. ./operations.sh
. ./listTables.sh
. ./creatTable.sh
. ./insertIntoTable.sh
. ./selectAllFromTable.sh
. ./DropDatabases.sh
. ./getcols.sh
. ./creatMD.sh
. ./selectRecord.sh
. ./deleteRow.sh
. ./deleteTable.sh



################################################################################
# Databases Screen
while $dbsScreen;
do
## Make directory to hold all databases when run project
 mkdir -p Databases;
    PS3="dbscreen> "
    clear;
    separator;
    echo -e "\t\tYour Existing Databases:\n$(find -maxdepth 1 -type d | cut -d'/' -f2 | sed '1d')"
    separator;
    select choice in "Create a new database" "Use existing Database" "Drop Database" "Exit" "Show dbs";
    do
        case $REPLY in
            1 ) #Create a database
                separator;
                createDb;
                echo -e "\e[42mDatabase is loading...\e[0m"
                echo press any key
                read -e
                ;;

            2 ) # Use existing
				useDB
                # separator;
                # useExistingDb;
                ;;

            3 ) # Drop Database
                # read
                separator;
                # echo "DROP"
                dropDb
                break
                ;;
            
            4 ) # Exit
                exit
                break
                ;;

            5) #showDatabases
                ShowDBS;
                echo -e "\e[42mDatabase is loading...\e[0m"
                echo press any key
                read -e
                ;;
            * )
                echo -e "\e[41minvalid entry\e[0m"
                echo press any key
                read -e
                ;;
        esac
        break
    done
done

################################################################################

}

Mainmenu
