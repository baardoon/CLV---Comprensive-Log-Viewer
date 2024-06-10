#!/bin/bash

zypperlogs(){

  cd /var/log/
  cat zypper.log | cut -d " " -f1,2,5,6
  read -p "Press any to exit" pause
  cd
}

nginxlogs (){

  cd /var/log/nginx
  read -p "Do you want to see acces.log (1) or error.log(2)" nginx
  if [[ $nginx -eq 1 ]]; then
    cat access.log | cut -d " " -f1,3,6,8,9,11
  elif [[ $nginx -eq 2 ]]; then
    cat error.log
  else
    echo "This is not a valid option"
  fi
  read -p "Press any to exit" pause
  cd
}

yast2logs (){

  cd /var/log/YaST2/
  
}

if [[ $UID -le 0 ]]; then
  menu=0
  until [[ $menu -eq 8 ]]; do
    clear
    echo "1.- System logs"
    echo "2.- Zypper logs"
    echo "3.- Nginx logs"
    echo "4.- Yast2 logs"
    echo "5.- Samba logs"
    echo "6.- Mysql logs"
    echo "7.- Xorg logs"
    echo "8.- Exit"
    read -p "Select an option: " menu
    case $menu in 
      1)  Syslog
      ;;
      2)  zypperlogs
      ;;
      3)  nginxlogs
      ;;
      4)  yast2logs
      ;;
      5)
      ;;
      6)
      ;;
      7)
      ;;
    esac
  done
  echo "Gooodbyeee"
else
  echo "This program must be executed as root"
fi
