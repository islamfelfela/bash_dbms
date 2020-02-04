#! /bin/bash

operations(){
    echo "Operations on table"
    select ch in "creat table" "delete table" "insert" "select all" "select row";
    do
        case $ch in
            1)
                echo "creat table"
                clear
                creatTable
                break
                ;;
            2)
                echo "delete table"
                clear
                deleteTable
                break
                ;;
            3)
                echo "insert"
                clear
                insertIntoTable
                break
                ;;
            3)
                echo "select all"
                clear
                selectAllFromTable
                break
                ;;
            
            4)
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
