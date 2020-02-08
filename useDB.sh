#! /bin/bash
#. ./operations.sh

useDB(){

    while true
    do

     read -p "Enter DB Name : " liveDB
     if [[ $liveDB == "" ]]
     then
            echo -e "\e[41minvalid entry..\e[0m"
            read
            break
        elif [[ ! $liveDB =~ [[:alnum:]] ]]
        then
            echo -e "\e[41minvalid entry..\e[0m"
            read
            break

        elif ! [[ -d "Databases/$liveDB" ]]; 
        then
            echo -e "\e[41minvalid entry..\e[0m"
            read
            break
               
        else
                export $liveDB
                cd Databases/$liveDB
                operations
                # echo "passed"
     fi
   

    done
     
}




####   insert -> 