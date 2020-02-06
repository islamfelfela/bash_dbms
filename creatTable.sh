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
                            export $tableName
                            touch $tableName
                            touch "$tableName.md"
                            echo $tableName
                            echo "Created..."
                            getcolnames #function in temp.sh
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
# creatTable