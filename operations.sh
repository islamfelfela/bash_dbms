#! /bin/bash

# Table Menue
operations(){
    echo "Operations on table"
    while true
    do
        select ch in "creat table" "list tables" "insert into table" "select all from table" "select row" "delete row" "delete table" "back";
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
                    listTables
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
                    displayRow
                    break
                ;;
                "delete row")
                    echo "delete row"
                    clear
                    deleteRow
                    break
                ;;
                "delete table")
                    echo "delete table"
                    clear
                    deleteTable
                    break
                ;;
                
                "back")
                    echo "back"
                    clear
                    echo "back"
                    cd ..
                    cd ..
                    Mainmenu
                    
                    break
                ;;
                *)
                    echo "Wrong Input plz try again later"
                ;;
                
            esac
        done
        operations
    done
    
}
