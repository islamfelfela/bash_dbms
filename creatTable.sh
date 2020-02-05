#! /bin/bash


creatTable(){

    while true
    do
            read -p "Enter Taple Name" tableName
            if [[ -n $tableName ]]
            then
                if [[ -f $tableName ]]
                then
                    echo "table Exist"
                    else
                        if [[ $tableName =~ ^-?[a-zA-Z]+$ ]]
                        then
                            echo $tableName
                            echo $liveDB
                            touch /home/felfela/Desktop/bash_dbms/Databases/$liveDB/$tablemName
                            touch $tablemName.md
                            echo "Created..."

                        break
                        else
                                    echo "Enter string name"
                        fi
                    
                fi
            else
                echo "name Not valid"
            fi
    done

operations


}