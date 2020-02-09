#!/usr/bin/bash
function separator {
    # echo -e "\n############################################################\n";
    echo -e "\n************************************************************\n";
}
function createDb {
        echo "please enter the name of the database : "

    read  -e dbname
    
    #############
    # null entry
    if [[ $dbname = "" ]]; then
        echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
        echo press any key
        read
        
        # new DB
        elif [[ $dbname =~ ^[a-zA-Z] ]]; then
        mkdir -p Databases/"$dbname"
        newloc=`pwd`
        echo newloc;
        if [[ "$newloc" = `pwd` ]]; then
            echo -e "\e[42mdatabase created sucessfully in $(pwd)\e[0m"
            dbsScreen=true;
            echo press any key
            read
        else
            cd - > /dev/null 2>&1
            echo -e "\e[41mcan't access this location\e[0m"
            echo press any key
            read
        fi
        
        # special characters
        elif [[ $dbname =~ [/.:\|\-] ]]; then
        echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
        echo press any key
        read
        
        elif [[ -e $dbname ]]; then
        echo -e "\e[41mthis database name is already used\e[0m"
        echo press any key
        read
        
        # numbers or any special characters
    else
        echo -e "\e[41mDatabase name can't start with numbers or special characters\e[0m"
        echo press any key
        read
    fi
}


