#!/bin/bash

# Step 1: Create a new group
GROUP_NAME="Devops_Group"
sudo groupadd $GROUP_NAME
echo "Group $GROUP_NAME created."

# Step 2: Create three users
USER1="jayesh"
USER2="gaurav"
USER3="ferin"

# Creating users with the group as their primary group
sudo useradd -m -g $GROUP_NAME $USER1
sudo useradd -m -g $GROUP_NAME $USER2
sudo useradd -m -g $GROUP_NAME $USER3

echo "Users $USER1, $USER2, and $USER3 created."

# Step 3: Assign different permissions to the users (on a sample directory)
DIR="/home/Devops_User_Project"
sudo mkdir -p $DIR
echo "Directory $DIR created."

# Give full permissions to Jayesh (read, write, execute)
sudo chmod 700 $DIR
sudo chown $USER1:$GROUP_NAME $DIR
echo "Permissions set for $USER1 (read/write/execute)."

# Give read and execute permissions to Gaurav
sudo chmod 755 $DIR
sudo chown $USER2:$GROUP_NAME $DIR
echo "Permissions set for $USER2 (read/execute)."

# Give only read permissions to Ferin
sudo chmod 744 $DIR
sudo chown $USER3:$GROUP_NAME $DIR
echo "Permissions set for $USER3 (read-only)."

# Step 4: Remove one user (e.g., Gaurav) from the group
sudo gpasswd -d $USER2 $GROUP_NAME
echo "User $USER2 removed from group $GROUP_NAME."

# Optionally, delete the user entirely (if needed)
# sudo userdel -r $USER2
# echo "User $USER2 deleted."

# Final confirmation message
echo "Group $GROUP_NAME and users have been set up and configured."
