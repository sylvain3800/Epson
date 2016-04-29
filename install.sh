zenity --info \
--title "Bienvenue" \
--text "Ce script est concu pour vous faciliter la tâche lors de l'instalation de votre imprimante Epson pour ubuntu 16.04 (et derivés)"

sudo apt-get install printer-driver-escpr 
cd Epson-master



VERSION=$(uname -i);

if [ $VERSION = "x86_64" ] ; then 
   sudo dpkg -i epson-prnter-utility-64.deb
else
    sudo dpkg -i epson-prnter-utility-32.deb
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