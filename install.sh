
zenity --info \
--title "Bienvenue" \
--text "Ce script est concu pour vous faciliter la tâche lors de l'installation de votre imprimante Epson pour ubuntu 16.04 (et derivés)"


VERSION=$(uname -i);
#test afin de savoir si ubuntu 16.04 est une installe fraiche ou une migration
[ -z `dpkg --get-selections | grep -w ^lsb[^-]` ] && migration="nein!";
echo $migration;

if [ $migration = "nein!" ] ; then

# installation pilote generique dépots
sudo apt-get install printer-driver-escpr
sudo apt-get install gedit
# créations de liens symboliques dans /lib 
cd /lib
sudo ln -sf ld-linux.so.2 /lib/ld-lsb.so.3
sudo ln -sf ld-linux.so.2 /lib/ld-lsb.so.2
sudo ln -sf ld-linux.so.2 /lib/ld-lsb.so.1
sudo ln -s /lib/x86_64-linux-gnu/ld-2.23.so /lib64/ld-lsb-x86-64.so.3
sudo ln -s /lib/x86_64-linux-gnu/ld-2.23.so /lib64/ld-lsb-x86-64.so.2

# déplacement dans /Epson-master et lancement gui
cd ~/Epson-master

VERSION=$(uname -i);
#boite de dialogue 
zenity --question \
--title "Votre imprimante est elle l'une de celle listé ci dessous ?" \
--text "WorkForce 60  WorkForce 625  WorkForce 630  WorkForce 633  
WorkForce 635  WorkForce T42WD

Epson Stylus NX625 Epson Stylus SX525WD Epson Stylus SX620FW 
Epson Stylus TX560WD Epson Stylus Office B42WD Epson Stylus Office BX525WD
Epson Stylus Office BX625FWD Epson Stylus Office TX620FWD

Epson ME OFFICE 82WD Epson ME OFFICE 85ND Epson ME OFFICE 900WD Epson ME OFFICE 960FWD"
if [ $? = 0 ]
then
if [ $VERSION = "x86_64" ] ; then 
   sudo dpkg -i printer-workforce-serie-64.deb
else
     sudo dpkg -i printer-workforce-serie-32.deb
fi;
else 	



if [ $VERSION = "x86_64" ] ; then 
   sudo dpkg -i epson-prnter-utility-64.deb
else
    sudo dpkg -i epson-prnter-utility-32.deb
fi;

fi;


#boite de dialogue 
zenity --question \
--title "Instalation pilote pc-fax ?" \
--text "Votre imprimmante possède elle une option pour envoyer des fax ?

Si vous n'êtes pas sur ou ne savez pas alors cliquez sur non "
if [ $? = 0 ]
then
if [ $VERSION = "x86_64" ] ; then 
   sudo dpkg -i epson-pc-fax-64.deb
else
     sudo dpkg -i epson-pc-fax-32.deb
fi;
	
fi;


#boite de dialogue 
zenity --question \
--title "Instalation pilote scanner ?" \
--text "Votre imprimante dispose-elle d'une fonction scanner ?"
if [ $? = 0 ]
then

sudo apt-get install xsltproc 
 VERSION=$(uname -i);

if [ $VERSION = "x86_64" ] ; then 

tar -xvf iscan-bundle-1.0.0.x64.deb.tar.gz 
cd iscan-bundle-1.0.0.x64.deb/
sudo ./install.sh


else
 tar -xvf iscan-bundle-1.0.0.x86.deb.tar.gz 
 cd iscan-bundle-1.0.0.x86.deb/
 sudo ./install.sh

  
fi

fi
else

#boite de dialogue 
zenity --question \
--title "Votre imprimante est elle l'une de celle listé ci dessous ?" \
--text "WorkForce 60  WorkForce 625  WorkForce 630  WorkForce 633  
WorkForce 635  WorkForce T42WD

Epson Stylus NX625 Epson Stylus SX525WD Epson Stylus SX620FW 
Epson Stylus TX560WD Epson Stylus Office B42WD Epson Stylus Office BX525WD
Epson Stylus Office BX625FWD Epson Stylus Office TX620FWD

Epson ME OFFICE 82WD Epson ME OFFICE 85ND Epson ME OFFICE 900WD Epson ME OFFICE 960FWD"
if [ $? = 0 ]
then
if [ $VERSION = "x86_64" ] ; then 
   sudo wget http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/68/57/94df38d353c3a8df88d3419e4ecd58079213dbed/epson-inkjet-printer-workforce-635-nx625-series_1.0.1-1lsb3.2_amd64.deb
   sudo dpkg -i epson-inkjet-printer-workforce-635-nx625-series_1.0.1-1lsb3.2_amd64.deb
else
   sudo wget http://a1227.g.akamai.net/f/1227/40484/7d/download.ebz.epson.net/dsc/f/01/00/01/68/57/3e718773102b82118ac89ea8d848845b05083604/epson-inkjet-printer-workforce-635-nx625-series_1.0.1-1lsb3.2_i386.deb
     sudo dpkg -i epson-inkjet-printer-workforce-635-nx625-series_1.0.1-1lsb3.2_i386.deb
fi;
else 	



if [ $VERSION = "x86_64" ] ; then 
   sudo wget https://download3.ebz.epson.net/dsc/f/03/00/04/54/27/47432df8892c34f5a66725de1c0d333aa77a4860/epson-inkjet-printer-escpr_1.6.5-1lsb3.2_amd64.deb
   sudo dpkg -i epson-inkjet-printer-escpr_1.6.5-1lsb3.2_amd64.deb
else
   sudo wget https://download3.ebz.epson.net/dsc/f/03/00/04/54/27/c1552a8de15863e3051a177deca6d7d8c940b9e1/epson-inkjet-printer-escpr_1.6.5-1lsb3.2_i386.deb
   sudo dpkg -i epson-inkjet-printer-escpr_1.6.5-1lsb3.2_i386.deb
fi;

fi;


#boite de dialogue 
zenity --question \
--title "Instalation pilote scanner ?" \
--text "Votre imprimante dispose-elle d'une fonction scanner ?"
if [ $? = 0 ]
then

sudo apt-get install xsltproc 
 VERSION=$(uname -i);

if [ $VERSION = "x86_64" ] ; then 

tar -xvf iscan-bundle-1.0.0.x64.deb.tar.gz 
cd iscan-bundle-1.0.0.x64.deb/
sudo ./install.sh


else
 tar -xvf iscan-bundle-1.0.0.x86.deb.tar.gz 
 cd iscan-bundle-1.0.0.x86.deb/
 sudo ./install.sh

  
fi

fi

fi

sudo /etc/init.d/cups restart 

xterm -e ~/Epson-master/postinstall.sh
exit 0

