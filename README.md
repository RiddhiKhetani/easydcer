# easydcer
Bash Script which makes exporting Drupal default content a lot easier than manually doing it

##### Work Done
+ Complete support for DCER - Script can export any number of blocks, node, menu_links, file in just a matter of minutes

##### Work to be done
+ Adding support for Drush Configuration Export - Would love if someone could give their input on this

#### HOW TO USE THIS SCRIPT

+ You need to give execution permissions for this script file in order to execute it

  + `chmod +x easydcer`

+ If you are cloning the repository, then you might get the following error when trying to run the script.

  + > /bin/bash^M: bad interpreter: No such file or directory

+ Please run the following command in the root folder of the project if incase you get the above error 

  + `sed -i -e 's/\r$//' easydcer`
  
+ Once all the above steps are done, Execute the script like you would do with any other normal bash script

  + `sudo ./easydcer install` - to install the script onto your system
  + After that refer to `easydcer --help` - to understand how the script works

###### Enjoy Scripting 🙂
