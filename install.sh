zenity --info \
--title "Bienvenue" \
--text "Ce script est concu pour vous faciliter la tâche lors de l'installation de votre imprimante Epson pour ubuntu 16.04 (et derivés)"


VERSION=$(uname -i);
# installation pilote generique dépots
sudo apt-get install printer-driver-escpr

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

exit 0

