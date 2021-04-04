#!/bin/bash

while :
do
clear
echo "!!!!Welcome to the Phone Dictionary!!!!"
echo ""
echo "1. Add a Contact"
echo "2. Search Contacts"
echo "3. Delete Contact"
echo "4. View Phone Dictionary"
echo "5. Quit"
echo ""
read -p "Enter your choice : " usr_cmd
clear

case $usr_cmd in
1)echo "<<ADD NEW CONTACT>>"
echo""
read -p "Enter First Name : " fname
read -p "Enter Last Name : " lname
read -p "Enter Number : " number
read -p "Enter Email : " email
read -p "Enter Address : " address
clear

echo "New Contact Info :"
echo ""
echo -e "First Name : $fname\nLast Name : $lname\nNumber : $number\nEmail : $email\nAddress : $address"    
echo "$fname $lname : $number : $email : $address" >> phonedir.log
echo " "
echo "Saved Successfully!!"
;;


2) echo "<<SEARCH CONTACTS>>"
echo ""
read -p "Enter First Name or contact number to search : " search_query
clear
echo "SEARCH RESULTS :"
echo ""
grep -i $search_query phonedir.log
;;


3)echo "<<DELETE CONTACT>>"
echo ""
read -p "Enter First Name or contact number to be Deleted : " delete_string
sed -i -e "/$delete_string/d" phonedir.log
echo ""
echo "Deleted Successfully!!"
;;


4)echo "<<PHONE DICTIONARY>>"
echo " "
cat phonedir.log ;;


5)break;;
*)echo "INVALID OPTION";;
esac;


echo ""
read -p "Press 5 to Quit, Anything else to Return to Main Menu : " confirm_exit
if [ $confirm_exit -eq 5]
then break
fi
done
