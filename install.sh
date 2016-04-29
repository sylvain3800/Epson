zenity --info \
--title "Bienvenue" \
--text "Ce script est concu pour vous faciliter la tâche lors de l'instalation de votre imprimante Epson pour ubuntu 16.04 (et derivés)"


VERSION=$(uname -i);

sudo apt-get install printer-driver-escpr 
cd Epson-master

ERSION=$(uname -i);
#boite de dialogue 
zenity --question \
--title "votre imprimante est elle l'une de celle listé ci dessous ?" \
--text " WorkForce 60  WorkForce 625  WorkForce 630  WorkForce 633  
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
--title "instalation pilote pc-fax ?" \
--text " votre imprimmante possede elle une option pour envoyer des fax ?

si vous n'êtes pas sur ou ne savez pas alors cliquez sur non "
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
--title "instalation pilote scanner ?" \
--text "votre imprimante dispose-elle d'une fonction scanner ?"
if [ $? = 0 ]
then

sudo apt-get install xsltproc 
 VERSION=$(uname -i);

if [ $VERSION = "x86_64" ] ; then 

tar -xvf iscan-bundle-1.0.0.x64.deb.tar.gz 
cd iscan-bundle-1.0.0.x64.deb/
sudo ./install.sh

zenity --info --text "les pilotes de votre imprimante et de votre scanner doivent être operationnel !!!! 
il ne vous reste plus qu'a les tester "
exit 0
else
 tar -xvf iscan-bundle-1.0.0.x86.deb.tar.gz 
 cd iscan-bundle-1.0.0.x86.deb/
 sudo ./install.sh

  
zenity --info --text "les pilotes de votre imprimante et de votre scanner doivent être operationnel !!!! 
il ne vous reste plus qu'a les tester "
exit 0  
fi

else
zenity --info --text "les pilotes de votre imprimante doivent être operationnel !!!! 
il ne vous reste plus qu'a les tester "
exit 0
fi