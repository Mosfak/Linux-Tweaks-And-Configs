#!/bin/bash

#echo "This program will add a saperate partition as DATA partition.\n1.Hear More>>\n2.Continue"


echo "Enter Partition No of the data partition = "
read part

sudo umount /dev/sda$part
sudo mkdir /mnt/DATA
sudo mount /dev/sda$part /mnt/DATA

sudo chown  $USER: /mnt/DATA

echo "A saperate Data Partition has been created."

echo "Now Copy the UUID for /dev/sda$part"
sleep 5

sudo fdisk -l
echo "Copy UUID of /dev/sda$part.\n Press Enter to continue.

echo "Press [ENTER] to terminate"
read -s -N 1 key
if [[ $key == $'\x0a' ]];        # if input == ENTER key
then
exit 0
fi
done
