#! /bin/bash

. ./insertIntoTable.sh
operations(){
    echo "Operations on table"
    while true
    do 
        select ch in "creat table" "list tables" "insert into table" "select all from table" "select row" "back";
    do
        case $ch in
            "creat table")
                echo "creat table"
                clear
                creatTable
                break
                ;;
            "list tables" )
                echo "list tables"
                clear
                listeTables
                break
                ;;
            "insert into table")
                echo "insert into table"
                clear
                insertData
                break
                ;;
            "select all from table")
                echo "select all"
                clear
                selectAllFromTable
                break
                ;;
            
            "select row")
                echo "select row"
                clear
                selectRecord
                break
                ;;
            "back")
                echo "back"
                clear
                Mainmenu
                break
                ;;
            *)
                echo "Wrong Input WWWWWW"
                ;;

        esac
    done
    operations
     done
    
}
