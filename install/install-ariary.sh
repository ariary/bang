#!/bin/bash
export BLUE='\033[0;34m'
export NC='\033[0m'
## Install and update ariary repo
## put ~/.local/bin/ in your $PATH (export $PATH=$PATH:$HOME/.local/bin/)

### Queensono
queensono(){
    echo -e "${BLUE}[*] Install Queensono..${NC}"
    curl -s -lO -L https://github.com/ariary/QueenSono/releases/latest/download/qsreceiver
    curl -s -lO -L https://github.com/ariary/QueenSono/releases/latest/download/qssender
    chmod +x qsreceiver qssender
    sudo setcap cap_net_raw+eip qssender
    sudo setcap cap_net_raw+eip qsreceiver
    mv qsreceiver $HOME/.local/bin/ && mv qssender $HOME/.local/bin/
}

### Fileless-xec
fileless-xec(){
    echo -e "${BLUE}[*] Install fileless-xec..${NC}"
    curl -s -lO -L https://github.com/ariary/fileless-xec/releases/latest/download/fileless-xec
    chmod +x fileless-xec
    mv fileless-xec $HOME/.local/bin/
}

### Gitar
gitar(){
    echo -e "${BLUE}[*] Install gitar..${NC}"
    curl -s -lO -L https://github.com/ariary/gitar/releases/latest/download/gitar
    chmod +x gitar
    mv gitar $HOME/.local/bin/
    git clone https://github.com/ariary/gitar.git && cd gitar
    make build.gitar.image
    cd .. && rm -rf gitar
}

### jse
jse(){
    echo -e "${BLUE}[*] Install jse..${NC}"
    curl -lO -L -s https://github.com/ariary/JSextractor/releases/latest/download/jse
    chmod +x jse
    mv jse $HOME/.local/bin/
}

### DomXssFinder
domxssfinder(){
    echo -e "${BLUE}[*] Install DomXssFinder (fsource and fsink)..${NC}"
    curl -s -lO -L https://github.com/ariary/DomXssFinder/releases/latest/download/fsink 
    curl -s -lO -L https://github.com/ariary/DomXssFinder/releases/latest/download/fsource
    chmod +x fsink fsource
    mv fsink $HOME/.local/bin/ && mv fsource $HOME/.local/bin/
}

### httpecho
httpecho(){
    echo -e "${BLUE}[*] Install httpecho..${NC}"
    curl -lO -L -s https://github.com/ariary/httpecho/releases/latest/download/httpecho
    chmod +x httpecho
    mv httpecho $HOME/.local/bin/
}

### httpcustomhouse
httpcustomhouse(){
    echo -e "${BLUE}[*] Install httpcustomhouse tools (httpclient, httpoverrid and httpcustomhouse)..${NC}"
    curl -s -lO -L https://github.com/ariary/HTTPCustomHouse/releases/latest/download/httpcustomhouse && chmod +x httpcustomhouse
    curl -s -lO -L https://github.com/ariary/HTTPCustomHouse/releases/latest/download/httpoverride && chmod +x httpoverride
    curl -s -lO -L https://github.com/ariary/HTTPCustomHouse/releases/latest/download/httpclient && chmod +x httpclient
    mv httpcustomhouse $HOME/.local/bin/
    mv httpoverride $HOME/.local/bin/
    mv httpclient $HOME/.local/bin/
}

### console.sh
console.sh(){
    echo -e "${BLUE}[*] Install console.sh..${NC}"
    curl -lO -L -s https://github.com/ariary/console.sh/releases/latest/download/console.sh
    chmod +x console.sh
    mv console.sh $HOME/.local/bin/
}

### cfuzz
cfuzz(){
    echo -e "${BLUE}[*] Install cfuzz..${NC}"
    curl -lO -L -s https://github.com/ariary/cfuzz/releases/latest/download/cfuzz
    chmod +x cfuzz
    mv cfuzz $HOME/.local/bin/
}

### tacos
tacos(){
    echo -e "${BLUE}[*] Install tacos..${NC}"
    git clone https://github.com/ariary/tacos.git && cd tacos
    go mod tidy
    make before.build
    make build.tacos && mv tacos $HOME/.local/bin/
    mkdir -p $HOME/.tacos
    mv light-pty4all $HOME/.tacos/
    cd .. && rm -rf tacos
}

### smtrackerp
smtrackerp(){
    echo -e "${BLUE}[*] Install smtrackerp..${NC}"
    curl -lO -L -s https://github.com/ariary/SMTrackerP/releases/download/v0.0.1/smtrackerp
    chmod +x smtrackerp
    mv smtrackerp $HOME/.local/bin/
}

### lobfuscator
lobfuscator(){
    echo -e "${BLUE}[*] Install lobfuscator..${NC}"
    git clone https://github.com/ariary/magnet.git && cd magnet
    go mod tidy
    make build.lobfuscator && mv lobfuscator $HOME/.local/bin/
    cd .. && rm -rf magnet
}

### surge-binary-deployment.sh
surge-binary-deployment.sh(){
    echo -e "${BLUE}[*] Install surge-binary-deployment.sh..${NC}"
    curl -s https://gist.githubusercontent.com/ariary/2db681e3c4ae94901476dffe870119dc/raw/25a10f67b18863e763a05317aa54ed665669e15c/surge-binary-deployment.sh >surge-binary-deployment.sh
    chmod +x surge-binary-deployment.sh
    mv surge-binary-deployment.sh $HOME/.local/bin/
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

# By default install all
if [ -z "$1" ]; then
    install_exclude " "
fi
