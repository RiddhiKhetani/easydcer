#! /bin/bash

##############################################################################################################################################################
##  Tired of manually exporting Drupal's default content?                                                                                                   ## 
##  No problem, I've written this script just to make it a bit easier and to save a bit of our precious time which we dev's don't have in general xD.       ## 
##  On the contrary why do manual work, when UNIX can automate it for you ;)                                                                                ##
##                                                                                                                                                          ## 
##  Kindly let me know if anyone faces Issues. If anyone is interested in joining hands so we can develop this a lot better, please get in touch with me :) ##
##                                                                                                                                                          ## 
##                                                                                                                          By : Ruthvik Vegunta            ##  
##############################################################################################################################################################


# Variables
today_date=`date '+%b-%d'`
_baseFolder_=~/Desktop/defaultContent/$today_date
red=`tput setaf 1`
green=`tput setaf 2`
white=`tput setaf 7`
whitebackground=`tput setab 7`
redbackground=`tput setab 1`
blackbackground=`tput setab 0`
enable_underline=`tput smul`
disable_underline=`tput rmul`
bold=`tput bold`
reset=`tput sgr0`
flag=FALSE

# Start Message
function startScript(){
  printf "\n\n----- Exporting the content you need -----\n\n"
}

function createFolders(){
  if [ ! -d $_baseFolder_/copy_from_this ]; then
    (cd $_baseFolder_/ ; `mkdir copy_from_this`)
  fi
  if [ ! -d $_baseFolder_/copy_from_this/block_content ]; then
    (cd $_baseFolder_/copy_from_this ; `mkdir block_content`)
  fi
  if [ ! -d $_baseFolder_/copy_from_this/node ]; then
    (cd $_baseFolder_/copy_from_this ; `mkdir node`)
  fi
  if [ ! -d $_baseFolder_/copy_from_this/file ]; then
    (cd $_baseFolder_/copy_from_this ; `mkdir file`)
  fi
  if [ ! -d $_baseFolder_/copy_from_this/menu_link_content ]; then
    (cd $_baseFolder_/copy_from_this ; `mkdir menu_link_content`)
  fi
}

# Adds EOF to all the files existing in the given directory
function addEOF(){
  for file in $1/*
  do
    echo "" >> "$file"
  done
}

# Node Export Main Logic
function nodeExport(){
  (cd /var/www/$3/app/profiles/$3_profile ; `drush $1 node $2 --folder=$_baseFolder_/$3/node_backup/$2 2>/dev/null`)
  if [ -d $_baseFolder_/$3/node_backup/$2 ]; then
    startScript  
    printf "${bold}${green}${blackbackground}Default Content for node $2 backed up successfully to ${enable_underline}$_baseFolder_/$3/node_backup/$2${disable_underline}${reset} \n\n"
    if [ -d $_baseFolder_/$3/node_backup/$2/node ]; then
      addEOF $_baseFolder_/$3/node_backup/$2/node
      createFolders $3
      `cp -r $_baseFolder_/$3/node_backup/$2/node/* $_baseFolder_/copy_from_this/node/`
      printf "${bold}${green}${blackbackground}EOF added successfully for all the node JSON files generated in node backups${reset} \n\n"
    fi
    if [ -d $_baseFolder_/$3/node_backup/$2/block_content ]; then
      printf "${green}Reference Blocks found in this Node${reset} \n"
      addEOF $_baseFolder_/$3/node_backup/$2/block_content
      createFolders $3
      `cp -r $_baseFolder_/$3/node_backup/$2/block_content/* $_baseFolder_/copy_from_this/block_content/`
      printf "\n${bold}${green}${blackbackground}EOF added successfully for all the block_content JSON files generated in node backups${reset} \n\n"
    fi
    if [ -d $_baseFolder_/$3/node_backup/$2/file ]; then
      addEOF $_baseFolder_/$3/node_backup/$2/file
      createFolders $3
      `cp -r $_baseFolder_/$3/node_backup/$2/file/* $_baseFolder_/copy_from_this/file/`
      printf "${bold}${green}${blackbackground}EOF added successfully for all the File JSON files generated in node backups${reset} \n\n"
    fi
    flag=TRUE
  else
    printf "\n${bold}${white}${redbackground}Please check if a Node with ID $2 exists${reset}\n\n"
    continue 2>/dev/null
  fi
}

# Block Export Main Logic
function blockExport(){
  (cd /var/www/$3/app/profiles/$3_profile ; `drush $1 block_content $2 --folder=$_baseFolder_/$3/block_backup/$2 2>/dev/null`)
  if [ -d $_baseFolder_/$3/block_backup/$2 ]; then
    startScript
    printf "${bold}${green}${blackbackground}Default Content for Block $2 backed up successfully to ${enable_underline}$_baseFolder_/$3/block_backup/$2${disable_underline}${reset} \n\n"
    if [ -d $_baseFolder_/$3/block_backup/$2/block_content ]; then
      addEOF $_baseFolder_/$3/block_backup/$2/block_content
      createFolders $3
      `cp -r $_baseFolder_/$3/block_backup/$2/block_content/* $_baseFolder_/copy_from_this/block_content/`
      printf "${bold}${green}${blackbackground}EOF added successfully for all the Block JSON files generated in block_content backups${reset} \n\n"
    fi
    if [ -d $_baseFolder_/$3/block_backup/$2/file ]; then
      addEOF $_baseFolder_/$3/block_backup/$2/file
      createFolders $3
      `cp -r $_baseFolder_/$3/block_backup/$2/file/* $_baseFolder_/copy_from_this/file/`
      printf "${bold}${green}${blackbackground}EOF added successfully for all the File JSON files generated in block_content backups${reset} \n\n"
    fi
    flag=TRUE
  else
    printf "\n${bold}${white}${redbackground}Please check if a Block with ID $2 exists${reset}\n\n"
    continue 2>/dev/null
  fi
}

# Menu Export Main Logic
function menuLinkExport(){
  (cd /var/www/$3/app/profiles/$3_profile ; `drush $1 block_content $2 --folder=$_baseFolder_/$3/menu_backup/$2 2>/dev/null`)
  if [ -d $_baseFolder_/$3/menu_backup/$2 ]; then
    startScript
    printf "${bold}${green}${blackbackground}Default Content for Menu $2 backed up successfully to ${enable_underline}$_baseFolder_/$3/menu_backup/$2${disable_underline}${reset} \n\n"
    if [ -d $_baseFolder_/$3/menu_backup/$2/menu_link_content ]; then
      addEOF $_baseFolder_/$3/menu_backup/$2/menu_link_content
      createFolders $3
      `cp -r $_baseFolder_/$3/menu_backup/$2/menu_link_content/* $_baseFolder_/copy_from_this/menu_link_content/`
      printf "${bold}${green}${blackbackground}EOF added successfully for all the Menu JSON files generated in menu_link_content backups${reset} \n\n"
    fi
    flag=TRUE
  else
    printf "\n${bold}${white}${redbackground}Please check if a Menu with ID $2 exists${reset}\n\n"
    continue 2>/dev/null
  fi
}

# Main Function
function main(){
  if [ "$2" == "node" ]; then
    if [ -d $_baseFolder_/$4/node_backup/$3 ]; then
      printf "\n\n${bold}${white}${redbackground}Looks like, there is already exported content which is available for Node ID $3 : Do you want to overwrite it? (yes/no) :${reset} "
      read -n 1 confirmation
      if [ $confirmation == "y" ] || [ $confirmation == "Y" ]; then
        printf "\n\n----- Overwriting Existing Backup for node with ID : $3 -----"
        nodeExport $1 $3 $4
      else
        printf "\n\n----- Skipping Backup for node with ID : $3 -----\n\n"
        continue 2>/dev/null
      fi
    else
      nodeExport $1 $3 $4
    fi
    
  elif [ "$2" == "block" ]; then
    if [ -d $_baseFolder_/$4/block_backup/$3 ]; then
      printf "\n\n${bold}${white}${redbackground}Looks like, there is already exported content which is available for Block ID $3 : Do you want to overwrite it? (yes/no) :${reset} "
      read -n 1 confirmation
      if [ $confirmation == "y" ] || [ $confirmation == "Y" ]; then
        printf "\n\n----- Overwriting Existing Backup for Block with ID : $3 -----"
        blockExport $1 $3 $4
      else
        printf "\n\n----- Skipping Backup for Block with ID : $3 -----\n\n"
        continue 2>/dev/null
      fi
    else
      blockExport $1 $3 $4
    fi

  elif [ "$2" == "menu" ]; then
    if [ -d $_baseFolder_/$4/menu_backup/$3 ]; then
      printf "\n\n${bold}${white}${redbackground}Looks like, there is already exported content which is available for Menu ID $3 : Do you want to overwrite it? (yes/no) :${reset} "
      read -n 1 confirmation
      if [ $confirmation == "y" ] || [ $confirmation == "Y" ]; then
        printf "\n\n----- Overwriting Existing Backup for Menu with ID : $3 -----"
        menuLinkExport $1 $3 $4
      else
        printf "\n\n----- Skipping Backup for Menu with ID : $3 -----\n\n"
        continue 2>/dev/null
      fi
    else
      menuLinkExport $1 $3 $4
    fi
  fi
}


##################################################
## Main Function Call - Script's starting point ##
##################################################

host=`hostname`
printf "\nWelcome ${bold}${green}$host${reset}\n"

printf "\nPlease enter the ${bold}${red}subscription name${reset} for which you are tying to export the default content for : "
read subscription

if [ ! -d /var/www/$subscription ]; then
  printf "\n${bold}${red}${whitebackground}Cannot find a local setup with name ${enable_underline}$subscription${disable_underline}, Please make sure you have this project in your local${reset}\n\n"
else
  printf "\nWhich export do you want to use? \nAvailable Options : ${bold}${red}[ 1. DCE (NOT WORKING AS OF NOW, Please refrain from selecting this) ] [ 2. DCER ]${reset} : "
  read input_1
  if [ $input_1 == 1 ]; then
    printf "\n${bold}${red}${whitebackground}DCE export mode is not working as of now, This will be fixed or removed in future${reset}\n\n"
    exit 0
    #export_mode=dce
  elif [ $input_1 == 2 ]; then
    export_mode=dcer
  else 
    printf "\n${bold}${whitebackground}${red}Invalid option!! Please Try again${reset}\n\n${bold}${whitebackground}${red}----- Exiting -----${reset}\n\n"
    exit 0
  fi

  printf "\nWhich entity type do you want to export? \nAvailable Options : ${bold}${red}[ 1. block_content ] [ 2. node ] [ 3. menu_link_content ]${reset} : "
  read input_2
  if [ $input_2 == 1 ]; then
    entity_type=block
  elif [ $input_2 == 2 ]; then
    entity_type=node
  elif [ $input_2 == 3 ]; then
    entity_type=menu
  else 
    printf "\n${bold}${whitebackground}${red}Invalid option!! Please Try again${reset}\n\n${bold}${whitebackground}${red}----- Exiting -----${reset}\n\n"
    exit 0
  fi

  printf "\nPlease enter the ID's of all the $entity_type you want to export (separate each ID with a comma). ${bold}${red}[Input Example : 21,34,45,69]${reset} : "
  read input_3

  if [ -d $_baseFolder_/copy_from_this ]; then
    `rm -r $_baseFolder_/copy_from_this`
  fi

  start_time=$(date +%s)
  idArray=(${input_3//,/ })
  for id in "${idArray[@]}"; do
    main $export_mode $entity_type $id $subscription
  done

  if [ $flag ]; then
    end_time=$(date +%s)
    execution_time=$(expr $end_time - $start_time)

    printf "\n\n\n${bold}${green}Successfully backedup the default content you need in ${enable_underline} $execution_time ${disable_underline} seconds${reset}\n"
    printf "\n${bold}${green}All your individual backups can be found ${enable_underline}$_baseFolder_/$subscription${disable_underline}${reset}\n"
    printf "\n${bold}${green}You can find your final files in ${enable_underline}$_baseFolder_/copy_from_this${disable_underline}${reset}\n"
    printf "\n${bold}${green}All of these generated JSON files have EOF${reset}\n"
    printf "\n${bold}${green}You can directly copy the contents from the ${red}copy_from_this ${green}folder and paste em into your /profile/content folder in your local setup and then commit${reset}\n"
    printf "\n\n${bold}${green}Thanks for using this script!!! Feedback is appreciated${reset}\n\n\n"
  fi
fi
