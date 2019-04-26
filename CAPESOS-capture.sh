#!/bin/bash
titre="Capture"

save=$(Xdialog --no-tags --with-french-labels \
        --title $titre \
        --radiolist "Où voulez-vous stocker la capture ?" 12 42 2 \
        0 "Dans un fichier" on \
        1 "Dans le presse-papier" off \
        3>&1 1>&2 2>&3);
exitcode=$?;

if [ $exitcode -eq 0 ]
then
    capture=$(Xdialog --no-tags --with-french-labels \
        --title $titre \
        --radiolist "Que voulez-vous capturer ?" 12 34 2 \
        0 "Une partie de l'écran" on \
        1 "Tout l'écran" off \
        3>&1 1>&2 2>&3);
    exitcode=$?

    if [ $exitcode -eq 0 ]
    then
        let "choix = $save+2*$capture"
        case $choix in
             0) xfce4-screenshooter --region -s ~/;;
             1) xfce4-screenshooter --region -c;;
             2) xfce4-screenshooter --fullscreen -s ~/;;
             3) xfce4-screenshooter --fullscreen -c;;
        esac
        echo $exit
        Xdialog --title $titre --msgbox "La capture est terminée." 0 0
    fi
fi
