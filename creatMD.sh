#! /bin/bash

function createMetaData {
		if [[ -f "$dbtable" ]]; then
			# num of cols
			validMetaData=true
			while $validMetaData;
            do
				echo -e "\e[44mhow many columns you want?\e[0m"
				read num_col
				if [[ "$num_col" = +([1-9])*([0-9]) ]];
                then
					validMetaData=false
				else
					echo -e "\e[41minvalid entry\e[0m"
				fi
			done
			## pk name
			validMetaData=true
			while $validMetaData;
            do
				echo -e "\e[44menter primary key name\e[0m"
				read -e pk_name
				# Handle null entry
				if [[ $pk_name = "" ]]; 
                then
					echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
				# Handle special characters
				elif [[ $pk_name =~ [/.:\|\-] ]]; 
                then
					echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
				# valid entry
				elif [[ $pk_name =~ ^[a-zA-Z] ]]; 
                then
					echo -n "$pk_name" >> "$dbtable"
					echo -n "-" >> "$dbtable"
					validMetaData=false
				# numbers or other special characters
				else
					echo -e "\e[41m Primary key can't start with numbers or special characters\e[0m"
				fi
			done
			# pk dataType
			validMetaData=true
			while $validMetaData; do
				echo -e "\e[44menter primary key datatype\e[0m"
				select choice in "integer" "string"; do
					if [[ "$REPLY" = "1" || "$REPLY" = "2" ]]; then
						echo -n "$choice" >> "$dbtable"
						echo -n "-" >> "$dbtable"
						validMetaData=false
					else
						echo -e "\e[41minvalid chioce\e[0m"
					fi
					break
				done
			done
			# pk size
			validMetaData=true
			while $validMetaData; do
				echo -e "\e[44menter primary key size\e[0m"
				read size
				if [[ "$size" = +([1-9])*([0-9]) ]]; then
					echo -n "$size" >> "$dbtable"
					echo -n ":" >> "$dbtable"
					validMetaData=false
				else
					echo -e "\e[41minvalid entry\e[0m"
				fi
			done
			## to iterate over the enterd num of columns after the primary key, in order to enter its metadata
			for (( i = 1; i < num_col; i++ )); do
				# field name
				validMetaData=true
				while $validMetaData; do
					echo -e "\e[46menter field $[i+1] name\e[0m"
					read -e field_name
					# null entry
					if [[ $field_name = "" ]]; then
						echo -e "\e[41minvalid entry, please enter a correct name\e[0m"
					# special characters
					elif [[ $field_name =~ [/.:\|\-] ]]; then
						echo -e "\e[41mYou can't enter these characters => . / : - | \e[0m"
					############
					# valid entry
					elif [[ $field_name =~ ^[a-zA-Z] ]]; then
						echo -n "$field_name" >> "$dbtable"
						echo -n "-" >> "$dbtable"
						validMetaData=false
					# numbers or other special characters
					else
						echo -e "\e[41mfield name can't start with numbers or special characters\e[0m"
					fi
				done
				# field dataType
				validMetaData=true
				while $validMetaData; do
					echo -e "\e[46menter field $[i+1] datatype\e[0m"
					select choice in "integer" "string"; do
						if [[ "$REPLY" = "1" || "$REPLY" = "2" ]]; then
							echo -n "$choice" >> "$dbtable"
							echo -n "-" >> "$dbtable"
							validMetaData=false
						else
							echo -e "\e[41minvalid choice\e[0m"
						fi
						break
					done
				done
				# field size
				validMetaData=true
				while $validMetaData; do
					echo -e "\e[46menter field $[i+1] size please\e[0m"
					read size
					if [[ "$size" = +([1-9])*([0-9]) ]]; 
                    then
						echo -n "$size" >> "$dbtable"
						# if last column
						if [[ i -eq $num_col-1 ]]; then
							echo $'\n' >> "$dbtable"
							echo -e "\n\e[42mtable created successfully\e[0m"
							echo press any key
							read
						# next column
						else
							echo -n ":" >> "$dbtable"
						fi
						validMetaData=false
					else
						echo -e "\e[41minvalid entry\e[0m"
					fi
				done
			done
		else
			echo -e "\e[41minvalid entry\e[0m" 
			echo press any key
			read
		fi
}