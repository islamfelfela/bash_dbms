#! /bin/bash
#. ./operations.sh

useDB(){
     read -p "Enter DB Name : " liveDB
     if [[ -n $liveDB ]]
     echo $liveDB
     then
        if ! [[ -d bash_dbms/Databases/$liveDB ]]
            then
                echo "exist"
                export $liveDB
                cd Databases/$liveDB
                operations
            else
                echo "NO DataBase Exist With That Name, Enter Valid Name"
                Mainmenu
        fi
        else
            echo " Enter Valid DB Name"
        useDB

     fi
}
