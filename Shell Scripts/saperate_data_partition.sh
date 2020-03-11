#!/bin/bash

#echo "This program will add a saperate partition as DATA partition.\n1.Hear More>>\n2.Continue"


echo "Enter Partition No of the data partition = "
read part

echo "Be Super User."
sudo su
umount /dev/sda$part
mkdir /mnt/DATA
mount /dev/sda$part /mnt/DATA

chown  $USER: /mnt/DATA

echo "A saperate Data Partition has been created."

echo "Now Copy the UUID for /dev/sda$part"
sleep 5

blkid
echo "Copy UUID of /dev/sda$part.\n Press Enter to continue.
 
read -s -N 1 key
if [[ $key == $'\x0a' ]];        # if input == ENTER key
then
exit 0
fi
done

echo -n "Now Enter the UUID you copied:"
read UUID

echo "Enter you data partition file system:\n1.EXT4\n2.NTFS\n3.other\n"
read ftype

if [ $ftype = 1 ]
then 
	echo "# Mount DATA partition under /mnt/DATA">>/etc/fstab
	 echo "UUID=$UUID	/mnt/DATA 	ext4 	defaults 0 2" >> /etc/fstab
elif [ $ftype = 2 ]
then
	echo "# Mount DATA partition under /mnt/DATA">>/etc/fstab
	 echo "UUID=$UUID  /mnt/DATA  ntfs-3g  defaults,windows_names,locale=en_US.utf8  0  0">>/etc/fstab
else
	echo "Edit /etc/fstab by yourself"
	sleep 5
	nano /etc/fstab
fi


echo "1.Create Link to all the folders in /mnt/DATA to your home directory\n"
echo "2.Only Create link to /mnt/DATA to home directory\n"
echo -n "3.Do Nothing\nEnter Choice:"
read choice

cd /mnt/DATA
pth=`ls`

if [ $choice = 1 ]
then
	cd
	for val in $pth
	do
		ln -s /mnt/DATA/$val
elif [ $choice = 2 ]
then
	cd
	ln -s /mnt/DATA
	echo "Now you have a link of your DATA partition in home directory"
else
	echo "Done Nothing"
fi


echo "Everything Done\n Enjoy!!\n\n\n~Mosfak Motin Rimon\nmosfak2400@gmail.com"