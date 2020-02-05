


                        ## Get Columns Names 
                            colNames=()       
                            while true 
                            do
                                        read -p "Enter Number Of Columns" colNum

                                        i=1
                                        while (i<$colNum)
                                        do
                                            if [[ $colNum =~ "^-?[0-9]+$" && $colNum -gt 0 ]]
                                            then
                                            read -p "Enter Column Name: " colName
                                                if [ $colName =~ "^-?[a-zA-Z]+$" ]
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
                                                        echo "num"
                                                        $colType="num"
                                                        break
                                                        ;;
                                                    "varchar")
                                                        # col type is varchar
                                                        echo "varchar"
                                                        $colType="varchar"
                                                        break
                                                        ;;
                                                    *)
                                                        # dafault
                                                        echo "enter valid selection"
                                                        break
                                                        
                                                    esac
                                                    echo "$colName":"$colType" > $tableName.md
                                                    ((i++))
                                                
                                            done        
                                    done
                                            
                            done
            #End Col Names And Types