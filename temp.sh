#! /bin/bash

getcolnames(){
    ## Get Columns Names 
                colNames=()
                while true 
                do
                            read -p "Enter Number Of Columns" colNum

                            typeset -i counter=1
                            while ($counter<$colNum)
                            do
                                if [[ $colNum =~ ^-?[0-9]+$ && $colNum -gt 0 ]]
                                then
                                read -p "Enter Column Name: " colName
                                    if [[ $colName =~ ^-?[a-zA-Z]+$ ]]
                                    then
                                        nameExistFlag=0
                                        for k in ${colNames[@]}
                                            do
                                                if [ $k==$colName]
                                                then
                                                    $nameExistFlag=1
                                                fi
                                            done

                                            if [ $nameExistFlag -eq 0]
                                            then
                                                colNames[i]=colName
                                                break
                                                else
                                                echo "Col Name Exist.."
                                            fi
                                            

                                    fi
                                    echo "Enter Valid Name.."

                                fi
                                done
                        colType=""
                        while true 
                        do
                                echo "Select Column Type :"
                                select ch in "num" "varchar"
                                    do
                                        case $ch in 
                                        "num")
                                            # col type is num
                                            $colType="num"
                                            echo $colType
                                            break
                                            ;;
                                        "varchar")
                                            # col type is varchar
                                            $colType="varchar"
                                            echo $colType
                                            break
                                            ;;
                                        *)
                                            # dafault
                                            echo "enter valid selection"
                                            break
                                            
                                        esac
                                        echo "$colName":"$colType" > $tableName.md
                                        ((counter=$counter+1))
                                    
                                done        
                        done
                                
                done
#End Col Names And Types
}

            