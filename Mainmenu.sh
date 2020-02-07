#! /bin/bash

Mainmenu(){

clear;
. ./ShowDBS.sh
. ./MakeDB.sh
. ./useDB.sh
. ./operations.sh
. ./creatTable.sh
. ./creatMD.sh
. ./listTables.sh
. ./insertIntoTable.sh
. ./selectAllFromTable.sh
. ./DropDatabases.sh


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
                read
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

}

Mainmenu
