#! /bin/bash

operations(){
    echo "Operations on table"
    select ch in "creat table" "delete table" "insert" "select all from table" "select row";
    do
        case $ch in
            "creat table")
                echo "creat table"
                clear
                creatTable
                break
                ;;
            "delete table" )
                echo "delete table"
                clear
                deleteTable
                break
                ;;
            "insert")
                echo "insert"
                clear
                insertIntoTable
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
            *)
                echo "Wrong Input WWWWWW"
                ;;

        esac
    done
}
