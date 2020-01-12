#!/bin/bash
#Variables
nocolour="\033[0m"
red="\033[0;31m"
blue="\033[0;34m"
green="\033[0;32m"
yellow="\033[0;33m"
#important notes
<<Notes
* You must install gnome terminal before you install this tool
 
* To install gnome terminal type :-
apt-get install gnome-terminal
 
* To Run This Tool You Must Be Root
* To Run This Tool You Must Type This Command After Install It :-
chmod +x m-scanner
* To Run The Tool After That just Type :-
./m-scanner
* All The Information You Get From This Tool You Will Found It In Directory Named M-Scanner-Results
* The Nikto Step May Take Some Time To Run
Notes
#banner
cat <<"EOF"
███╗   ███╗      ███████╗ ██████╗ █████╗ ███╗   ██╗███╗   ██╗███████╗██████╗ 
████╗ ████║      ██╔════╝██╔════╝██╔══██╗████╗  ██║████╗  ██║██╔════╝██╔══██╗
██╔████╔██║█████╗███████╗██║     ███████║██╔██╗ ██║██╔██╗ ██║█████╗  ██████╔╝
██║╚██╔╝██║╚════╝╚════██║██║     ██╔══██║██║╚██╗██║██║╚██╗██║██╔══╝  ██╔══██╗
██║ ╚═╝ ██║      ███████║╚██████╗██║  ██║██║ ╚████║██║ ╚████║███████╗██║  ██║
╚═╝     ╚═╝      ╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝
                                                                             
By Mr Momen                     
EOF
sleep 1

apt-get install gnome-terminal

#{if} statments
if [ $(whoami) != "root" ]
then
echo -e "${red} You must be root ${nocolour}"
exit
clear
else
read -p  "Enter the domain here :- " domain
if [ -z $domain ]
then
echo -e "${red} The doamin is empty ${nocolour}"
exit
fi
fi
#introduction
echo -e "${yellow} =========== { workig in $domain } ============ ${nocolour}"
sleep 3
mkdir M-Scanner-Results
#working with curl
echo -e "${yellow} =========== { Domain Banner } ========== ${nocolour}"
touch curl.txt
curl -i $domain > curl.txt
mv curl.txt M-Scanner-Results
sleep 2
echo .
echo .
#working with nmap
echo -e "${yellow} =========== { Starting Nmap in $domain }============ ${nocolour}"
touch scan.txt && gnome-terminal -e "tail -F scan.txt"
nmap -sS -O -oX nmap.xml $domain > scan.txt
mv scan.txt nmap.xml M-Scanner-Results
sleep 2
echo .
#working with nikto
echo -e "${yellow} =========== { Starting Nikto In $domain } =========== ${nocolour}"
touch nikto.txt && gnome-terminal -e "tail -F nikto.txt"
nikto -h $domain > Nikto.txt
mv Nikto.txt M-Scanner-Results
sleep 2
echo -e "${red} =========== { End } ========== ${nocolour}"
echo "Thaks For Using M-Scanner Tool"
cat << "EOF"
 _______  _______         _______  _______  _______  _______  _       
(       )(  ____ )       (       )(  ___  )(       )(  ____ \( (    /|
| () () || (    )|       | () () || (   ) || () () || (    \/|  \  ( |
| || || || (____)|       | || || || |   | || || || || (__    |   \ | |
| |(_)| ||     __)       | |(_)| || |   | || |(_)| ||  __)   | (\ \) |
| |   | || (\ (          | |   | || |   | || |   | || (      | | \   |
| )   ( || ) \ \__   _   | )   ( || (___) || )   ( || (____/\| )  \  |
|/     \||/   \__/  (_)  |/     \|(_______)|/     \|(_______/|/    )_)
                                                                      
EOF