#!/bin/bash
# unused_distfiles.sh
# Copyright (c)2012 Markus Schmits <RamsesV@gmx.net>
# Summary: Cleans unused distfiles from cache in Exherbo 
# Distribution: GPL-2 

FILES=$(cave print-unused-distfiles)
FILESTOTAL=$(ls /var/cache/paludis/distfiles/)
count1=0
count2=0

echo

for file in $FILESTOTAL
do

   let "count1 += 1"

done


for file in $FILES
do

   let "count2 += 1"

done

echo "Found $count2 obsolete distfiles from a total of $count1."; echo

if [ -e "$file" ]       # Check if file exists.
then
   echo "Following distfiles are unused: "; echo

   for file in $FILES
   do
      echo "Found to delete: $file"; 
      continue
   done

else  
   echo "Result: no distfiles found to delete."; echo
   exit 0
fi


GetAnswer ()
{
  prompt=$1
  echo $prompt
  read answer
}  

if [ "$count2" <> "0" ]
then
    GetAnswer "Shall $count2 distfiles found be deleted? (y/n)";
    
    # ask user, if files found shall be deleted
    if [[ "$answer" = "y" || "$answer" = "Y" ]] 
    then
       echo "Cleaning directory form follwing files:"; echo
       for file in $FILES
       do
          rm $file && echo "$file is deleted!"; echo
          continue
       done
    
    elif [[ "$answer" = "n" || "$answer" = "N" ]]
    then
       echo "No distfiles deleted!"; echo
    else
       echo "No valid answer."; echo
       exit 0
    fi

else
   echo "Zeerro."; echo
fi

exit 0
