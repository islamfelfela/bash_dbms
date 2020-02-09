#! /bin/bash
#. ./operations.sh

useDB(){

    while true
    do
echo "Enter Database Name"
     read -e liveDB
     if [[ $liveDB == "" ]]
     then
            echo -e "\e[41minvalid entry..\e[0m"
            read -e
            break
        elif [[ ! $liveDB =~ [[:alnum:]] ]]
        then
            echo -e "\e[41minvalid entry..\e[0m"
            read -e
            break

        elif ! [[ -d "Databases/$liveDB" ]]; 
        then
            echo -e "\e[41minvalid entry..\e[0m"
            read -e
            break
               
        else
                export $liveDB
                cd Databases/$liveDB
                operations
                # echo "passed"
     fi
   

    done
     
}




