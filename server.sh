mkdir mcpe
cd mcpe
sudo apt-get update
sudo apt-get install gcc g++ make automake libtool autoconf bison
wget -q -O - https://raw.githubusercontent.com/pmmp/php-build-scripts/master/installer.sh | bash -s - -r

rm worlds
rm PocketMine-MP.phar
rm plugins  

wget https://github.com/GraNXX/DOWNLOADS/releases/download/1%2C2/PocketMine-MP.zip
unzip PocketMine-MP.zip
rm PocketMine-MP.zip

wget https://github.com/GraNXX/DOWNLOADS/releases/download/1%2C2/worlds.zip
unzip worlds.zip
rm worlds.zip

wget https://github.com/GraNXX/DOWNLOADS/releases/download/1%2C2/plugins.zip
unzip plugins.zip
rm plugins.zip

echo "================================================================="
echo "run cd mcpe"
echo "================================================================="
echo "run ./start.sh"
echo "================================================================="
rm server.sh
