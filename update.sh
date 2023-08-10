#!/bin/bash 

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m" 


export CUSER=$(whoami)


if [ $CUSER = "root" ]; then 
  
  echo -e "\n\n${redColour}[!]${endColour} ${grayColour}You can't execute this script as root!${endColour}\n"
  exit 1 
fi


echo -e "${greenColour}[+]${endColour} ${grayColour}Updating KL-Sunset...${endColour}" 
echo -e "\n${yellowColour}[*]${endColour} ${grayColour}Author: elswix${endColour}" 

sleep 5

cp -r .config/i3 /home/$CUSER/.config/
cp -r .config/rofi /home/$CUSER/.config/



