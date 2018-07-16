#!/bin/bash

gitexe() {
        curl https://raw.githubusercontent.com/paperbenni/"$1"/master/"$2".sh | bash
}


gitexe ngrok.sh ngroktoken

TOKEN=$(cat ./token.txt)
chmod +x ./ngrok
ngrok authtoken "$TOKEN"

while : 
do
        if [ -f ngrokport.txt ]
        then
                ./ngrok tcp "$(cat ngrokport.txt)"
        else
                ./ngrok tcp 25565
        fi
        sleep 1
done
