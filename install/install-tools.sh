#!/bin/bash

#######################
### "MODULES"/TOOLS ###
#######################

#xclip
xclip(){
    echo "[*] Install clip.."
    sudo apt install xclip
}

#bat & extras
bat(){
    echo "[*] Install bat & co.."
    sudo apt install bat
    git clone https://github.com/eth-p/bat-extras.git && cd bat-extras && ./build.sh
    mv ./bin/* $HOME/.local/bin/
}


#fd
fd(){
    echo "[*] Install fd.."
    sudo apt install fd-find
    ln -s $(which fdfind) $HOME/.local/bin/fd
}


#go
golang(){
    echo "[*] Install go.."
    GO_URL="https://golang.org"
    GO_ENDPOINT="$(curl -s https://go.dev/dl/ | grep "linux" -n --color |head -1| cut -d "=" -f 3 | cut -d '"' -f 2)"
    curl -L0 -s $GO_URL$GO_ENDPOINT -o go.tar.gz
    sudo tar -C /usr/local -xvf go.tar.gz
    rm go.tar.gz
    echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.profile
    echo "export PATH=$PATH:$HOME/go/bin" >> $HOME/.zshrc #Add go install in PATH
}


#ko
ko(){
    echo "[*] Install ko.."
    go install github.com/google/ko@latest
}


#ngrok
ngrok(){
    echo "[*] Install ngrok.."
    wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
    unzip ngrok-stable-linux-amd64.zip
    mv ./ngrok $HOME/.local/bin/
    echo "[INPUT REQUIRE] Enter your ngrok token: (find it https://dashboard.ngrok.com/get-started/your-authtoken)"
    read -s NGROK_TOKEN
    $HOME/.local/bin/ngrok authtoken $NGROK_TOKEN
    unset NGROK_TOKEN
}

#fx
fx(){
    wget https://github.com/antonmedv/fx/releases/latest/download/fx-linux.zip
    unzip fx-linux.zip && rm fx-linux.zip
    mv fx-linux fx && mv fx $HOME/.local/bin/
}


sourcing(){
    echo "export PATH=$PATH:$HOME/.local/bin/" >> $HOME/.zshrc
}




####################
### INSTALL PART ###
####################
install_include(){

    # Get functions available
    FUNCTIONS=$(typeset -f | awk '/ \(\) $/ && !/^main / {print $1}')
    exclude=(install install_exclude install_include)
    for del in ${exclude[@]}
    do
        FUNCTIONS=("${FUNCTIONS[@]/$del}") #Quotes when working with strings
    done

    if [ -z "$1" ]
    then
        echo "modules available:"
        echo $FUNCTIONS
        echo "Enter modules you want to install(separated by a space):"
        read INCLUDES
    else
        INCLUDES=$@ #add all argument to include
    fi

    #execute functions
    install $INCLUDES
}

install_exclude () {
    FUNCTIONS=$(typeset -f | awk '/ \(\) $/ && !/^main / {print $1}')
    exclude=(install install_exclude install_include)
    for del in ${exclude[@]}
    do
        FUNCTIONS=("${FUNCTIONS[@]/$del}") #Quotes when working with strings
    done

    if [ -z "$1" ]
    then
        echo "modules available:"
        echo $FUNCTIONS
        echo "Enter modules you don't want to install(separated by a space):"
        read EXCLUDES
    else
        EXCLUDES=$@ #add all argument to include
    fi

    #withdraw "excluded" functions
    for del in ${EXCLUDES[@]}
    do
        FUNCTIONS=("${FUNCTIONS[@]/$del}") #Quotes when working with strings
    done

    #execute
    install $FUNCTIONS
}

#install from list of functions
install(){
    for f in $@
    do
        $f
    done
}

if [ "$1" = "--exclude" ]; then
    install_exclude "${@:2}"
fi

if [ "$1" = "--include" ]; then
    install_include "${@:2}"
fi