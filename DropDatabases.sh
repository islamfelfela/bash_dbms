

function dropDb {
    separator;
    echo enter the name of the database
    read -e db
    #db="$db"
    
    if [[ "Databases/$db" = '' ]]; then
        echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
        echo press any key
        read -e
        
        elif  [[ -d Databases/"$db" ]]; then
      
         echo $db;
        rm -r  Databases/$db
        echo -e "\e[42m$db removed from your databases\e[0m"
        echo press any key
        read -e
    else
         echo -e "\e[41mthis database doesn't exist\e[0m"
        echo press any key
        read -e
        #finally remove Database
    fi
}
