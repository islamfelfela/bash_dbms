#! /bin/bash


creatTable(){

    while true
    do
            read -p "Enter Taple Name : " tableName
            if [ -n "$tableName" ]
            then
                if [ -f "$tableName" ]
                then
                    echo "table Exist"
                    elif [[ $tableName =~ ^-?[a-zA-Z]+$ ]]
                        then
                            echo $tableName
                            touch $tableName
                            touch $tablemName.md
                            echo "Created..."
                            break;
                        else
                            echo "Enter string name"
                    fi
            else
                echo "name Not valid"
            fi
    done

#operations


}
creatTable