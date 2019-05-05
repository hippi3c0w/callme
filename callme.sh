#!/bin/bash
#Color variables
cat /home/hippi3c0w/tools/numberGenerator/style
echo " "
function usage(){
echo " "
echo "You must to input 2 options, one the number phone and the other the name. Please notice that number phone needs a specific format"
echo " "
echo "For example:"
echo " "
echo "./callme.sh 65%%%%432 hello"
echo " " 
}

if [[ $# -lt 2 ]];then
	usage
else
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
PURPLE='\033[0;34m'
CYAN='\033[0;35m'
LIGHTGRAY='\033[0;36m'
NC='\033[0m'
DARKGRAY='\033[1;30m'
LIGHTRED='\033[1;31m'
LIGHTGREEN='\033[1;32m'
LIGHTORANGE='\033[1;33m'
LIGHTPURPLE='\033[1;34m'
LIGHTCYAN='\033[1;35m'
echo " "
echo -e "         ${GREEN}Made by Manu Alén - @hippi3c0w ${NC}"
echo " "
echo -e "[${GREEN}+${NC}] Generating all the possible numberphones"
sleep 2
crunch 9 9 -t $1 > /home/hippi3c0w/tools/numberGenerator/numberphone.txt &
sleep 4
echo -e "[${GREEN}+${NC}] Creating csv to add this contacts to Google Contacts"
sleep 5
echo "Name,Given,Name,Additional,Name,Phone">/home/hippi3c0w/tools/numberGenerator/import.csv

for fill in $(cat /home/hippi3c0w/tools/numberGenerator/numberphone.txt)
do
extension=`cat /home/hippi3c0w/tools/numberGenerator/numberphone.txt | wc -l`
	for (( i=0;i<=$extension;i++ ))
	do
		long=`seq 1 $(echo $extension)`
		echo "$2$i,$2$i,*,contacts,$2$i,$fill">>/home/hippi3c0w/tools/numberGenerator/import.csv
	done

done
fi