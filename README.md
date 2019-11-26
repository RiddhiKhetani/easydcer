# easy_defContentExport
Bash Script which makes exporting Drupal default content a lot easier than manually doing it

##### Work Done
+ Complete support for DCER - Script can export any number of blocks, node, menu_links, file in just a matter of minutes

##### Work to be done
+ Adding support for Drush Configuration Export - Would love if someone could give their input on this

#### HOW TO USE THIS SCRIPT

+ You need to give execution permissions for this script file in order to execute it

  + `chmod +x easy-defContentExport.sh`

+ If you are cloning the repository, then you might get the following error when trying to run the script.

  + > /bin/bash^M: bad interpreter: No such file or directory

+ Please run the following command in the root folder of the project if incase you get the above error 

  + `sed -i -e 's/\r$//' easy-defContentExport.sh`
  
+ Once all the above steps are done, Execute the script like you would do with any other normal bash script

  + `./easy-defContentExport.sh` - and follow the instructions on screen

#### Sample Walkthrough

> Step 1
![](https://github.com/ruthvikvegunta/easy_defContentExport/blob/master/captures/Step%201.png)
> Step 2
![](https://github.com/ruthvikvegunta/easy_defContentExport/blob/master/captures/Step%202.png)
> Step 3a
![](https://github.com/ruthvikvegunta/easy_defContentExport/blob/master/captures/Step%203a.png)
> Step 3b
![](https://github.com/ruthvikvegunta/easy_defContentExport/blob/master/captures/Step%203b.png)
> Step 4
![](https://github.com/ruthvikvegunta/easy_defContentExport/blob/master/captures/Step%204.png)
> Step 5
![](https://github.com/ruthvikvegunta/easy_defContentExport/blob/master/captures/Step%205.png)
> Step 6a
![](https://github.com/ruthvikvegunta/easy_defContentExport/blob/master/captures/Step%206a.png)
> Step 6b
![](https://github.com/ruthvikvegunta/easy_defContentExport/blob/master/captures/Step%206b.png)
> Step 7a
![](https://github.com/ruthvikvegunta/easy_defContentExport/blob/master/captures/Step%207a.png)
> Step 7b
![](https://github.com/ruthvikvegunta/easy_defContentExport/blob/master/captures/Step%207b.png)

###### Enjoy Scripting 🙂
