zenity --info --text "Les pilotes de votre imprimante devrait être operationnel !!!! 
Il ne reste plus qu'a les tester .
assurez vous que votre inprimante est branché et sous tension et lancez une impression.
une fois fait appuyez sur ok"


#boite de dialogue 
zenity --question \
--title "Resultat du test" \
--text " L'impression a-t-elle reussi?

 "
if [ $? = 0 ]
then
zenity --info --text "Les pilotes de votre imprimante sont donc operationnel !!!! 
"

exit 0  

else 	

#boite de dialogue 
 SERIE=$(zenity --entry --title='demande aide ubuntu.fr' --text="Viblement l'installation du pilote a echoué !
 afin de pouvoir trouver une solution , veuillez rentrer le numero de serie de votre imprimante : ")
 
echo "Bonjour la communauté , j'ai lancé le script pour installer mon imprimmante epson " >aidezmoi.txt && echo $SERIE >>aidezmoi.txt && echo " dispo 
[url=https://forum.ubuntu-fr.org/viewtopic.php?id=1989074]ici[/url]" >>aidezmoi.txt
echo " " >>aidezmoi.txt
echo "Cependant, mon imprimante ne foncionne toujours pas :-( " >>aidezmoi.txt
echo " " >>aidezmoi.txt
echo "Voici les informations sur mon systeme qui pourrait être utiles : " >>aidezmoi.txt
echo " " >>aidezmoi.txt
echo "ma distribution est la suivante : [code]" >>aidezmoi.txt &&  cat /etc/lsb-release >>aidezmoi.txt && echo "[/code]" >>aidezmoi.txt
echo " " >>aidezmoi.txt
VERSION=$(uname -i);

if [ $VERSION = "x86_64" ] ; then 
   echo "mon systeme est installé en 64 bit" >>aidezmoi.txt
else
   echo "mon systeme est installé en 32 bit" >>aidezmoi.txt
fi;
echo " " >>aidezmoi.txt
echo "la commande dpkg -l | grep epson me donne ce resultat : [code]" >>aidezmoi.txt && dpkg -l | grep epson >>aidezmoi.txt && echo "[/code]" >>aidezmoi.txt

echo "la commande dpkg -l | grep iscan me donne ce resultat : [code]" >>aidezmoi.txt && dpkg -l | grep iscan >>aidezmoi.txt && echo "[/code]" >>aidezmoi.txt


echo "la commande dpkg -l | greps cups me donne ce résulat : [code]" >>aidezmoi.txt && dpkg -l | grep cups >>aidezmoi.txt && echo "[/code]" >>aidezmoi.txt

echo "la commande lpstat-t me donne ce résulat : [code]" >> aidezmoi.txt && lpstat -t >>aidezmoi.txt && echo "[/code]" >>aidezmoi.txt

echo "les logs de cups sont les suivant : [code]" >>aidezmoi.txt && cat /var/log/cups/error_log >>aidezmoi.txt && echo "[/code]" >>aidezmoi.txt

echo " " >>aidezmoi.txt


echo "toute aide est la bienvenue !!" >>aidezmoi.txt

zenity --info --text "Prochaine etape demander de l'aide sur le forum ubuntu.fr .

En appuyant sur ok , une fenetre va s'ouvrir contenant des informations utiles pour vous venir en aide .

veuillez copier l'ensemble des infos se trouvant dans la fenêtre et les coller dans votre message de demande d'aide sur le forum ubuntu.fr .

Cela permettra à la communauté de vous venir en aide efficacement "
gedit aidezmoi.txt
 fi
exit 0
