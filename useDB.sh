#! /bin/bash

useDB(){
     read -p "Enter DB Name : " liveDB
     if [[ -n $liveDB ]]
     echo $liveDB
     then
        if [[ -d /home/felfela/Desktop/bash_dbms/Databases/$liveDB ]]
        then
            echo "exist"
            export $liveDB
            cd /home/felfela/Desktop/bash_dbms/Databases/$liveDB
            operations
        else
            echo "NO DataBase Exist With That Name, Enter Valid Name"
            #Mainmenu
        fi
        else
            echo " Enter DB Name"
        useDB

     fi
}
