# easy_defContentExport
Bash Script which makes exporting Drupal default content a lot easier than manually doing it

#### HOW TO USE THIS SCRIPT

+ You need to give execution permissions for this script file in order to execute it

  + `chmod +x easy-defContentExport.sh`

+ If you are cloning the repository, then you might get the following error when trying to run the script.

  + > /bin/bash^M: bad interpreter: No such file or directory

+ Please run the following command in the root folder of the project if incase you get the above error 

  + `sed -i -e 's/\r$//' easy-defContentExport.sh`
  
+ Once all the above steps are done, Execute the script like you would do with any other normal bash script

  + `./easy-defContentExport.sh` - and follow the instructions on screen



##### Enjoy Scripting 🙂
