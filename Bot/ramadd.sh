echo "starting.."
echo "You must be in root user"
sudo su
echo "note: You Cant Repeat This process"
echo "How much"
read -p "ram:" COUNT
echo "===================================="
echo "adding $COUNT ram"
echo "===================================="
sudo dd if=/dev/zero of=/mnt/swap.0 bs=$COUNT count=1048576
echo "=======25%"
sudo mkswap /mnt/swap.0
echo "=============50%"
echo "/mnt/swap.0 swap swap defaults 0 0" >> /etc/fstab
echo "=================70%"
swapon /mnt/swap.0
echo "=====================90%"
sudo swapon -s
clear
echo "=======================100%"
echo "===================================="
free m
echo "===================================="
echo "ram added $COUNT mb"
echo "done"
