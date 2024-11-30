#List the contents of the home directory.
ls 


#Change the current directory to /var/log and list its contents.
cd var/log
ls


#Find and display the path to the bash executable using the which command.
which bash


#Find current shell
echo $SHELL

#----------------------------------------------------------------------------------------------------------

#Create a directory named linux_fundamentals in your home directory.
mkdir ~/linux_fundamentals

#Inside linux_fundamentals, create a subdirectory named scripts.
cd ~/linux_fundamentals
mkdir scripts

#Create an empty file named example.txt inside the linux_fundamentals directory.
touch example.txt
 
#Copy example.txt to the scripts directory.
cp example.txt scripts

#Move example.txt from linux_fundamentals to linux_fundamentals/backup.
mv example.txt backup

#Change the permissions of example.txt to read and write for the owner, and read-only for the group and others.
chmod u=rw,g=r,o=r example.txt

#Verify the permission changes using ls -l
ls -l example.txt


#-----------------------------------------------------------------------------------------------------


#Create a file named example.txt in your home directory.
touch example.txt

#Change the owner of example.txt to a user named student
sudo chown student example.txt

#Change the group of example.txt to a group named students.




#-----------------------------------------------------------------------------------------------------

#Create a directory named project in your home directory.
mkdir project

#Create a file named report.txt inside the project directory.
touch report.txt

#Set the permissions of report.txt to read and write for the owner, and read-only for the group and others.
chmod u=rw,g=r,o=r report.txt

#Set the permissions of the project directory to read, write, and execute for the owner, and read and execute for the group and others
chmod u=rwx,g=rx,o=rx report.txt

#Verify the changes using appropriate commands.
ls -l report.txt 

#--------------------------------------------------------------------------------------------------
#Create a new user named developer.
sudo sysadminctl -addUser developer 

#Set the home directory of the user developer to /home/developer_home.
sudo mkdir -p /home/developer_home
sudo usermod -d /home/developer_home -m developer

#Assign the shell /bin/sh to the user developer.
sudo usermod -s /bin/sh developer

#Verify the new user's information.
sudo usermod -l devuser developer

#Change the username of the user developer to devuser.

#Add devuser to a group named devgroup.

#Set the password of devuser to devpass. ( hint: use passwd command. Run passwd --help to see available options)


#Verify the changes made to the user.


#---------------------------------------------------------------------------------------------------    

#Create a file named original.txt in your home directory.
touch original.txt

#Create a symbolic link named softlink.txt pointing to original.txt.
ln -s original.txt softlink.txt

#Verify the symbolic link and ensure it points to the correct file.
ls -al | grep softlink.txt

#Delete the original file original.txt and observe the status of the symbolic link.
rm original.txt
##link broken, as original final is deleted. If we want to read the file using cat command. then it will
#give "cat: softlink.txt: No such file or directory" this error


#Create a file named datafile.txt in your home directory.
touch datafile.txt

#Create a hard link named hardlink.txt pointing to datafile.txt.
ln datafile.txt hardlink.txt

#Verify the hard link and ensure it correctly points to the file.
ls -all | grep hardlink.txt

#Check the inode of both datafile.txt and hardlink.txt
ls -i datafile.txt
ls -i hardlink.txt     #both are same

#Delete the original file datafile.txt and observe the status of the hard link.
rm datafile.txt   #If we remove datafile, hardlink file is not deleted. And contents of hardlink file remain safe.

#Find all .txt files in your home directory. ( use find command. Run find --help for usage)
find ~ -type f -name "*.txt" 



#--------------------------------------------------------------------------------------------------

#Update repo cache using apt/apt-get
sudo apt update

#Install a package named tree
sudo apt install tree -y

#Install gcloud CLI tool using apt ( Follow instructions from here: https://cloud.google.com/sdk/docs/install#deb )
sudo apt install apt-transport-https ca-certificates gnupg -y
echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

sudo apt update

sudo apt install google-cloud-cli -y