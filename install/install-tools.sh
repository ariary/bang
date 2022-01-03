#!/bin/bash

export BLUE='\033[0;34m'
export ROSE='\033[1;35m'
export NC='\033[0m'

#######################
### "MODULES"/TOOLS ###
#######################

#xclip
xclip(){
    echo -e "${BLUE}[*] Install xclip..${NC}"
    sudo apt install xclip
    echo "\n"
}

#flameshot
flameshot(){
    echo -e "${BLUE}[*] Install flameshot..${NC}"
    sudo apt install flameshot
    echo "\n"
}

#bat & extras
bat(){
    echo -e "${BLUE}[*] Install bat & co..${NC}"
    go install -u github.com/mvdan/sh/cmd/shfmt
    sudo apt install bat
    git clone https://github.com/eth-p/bat-extras.git && cd bat-extras && ./build.sh
    mv ./bin/* $HOME/.local/bin/
    rm -rf bat-extras
    echo "\n"
}


#fd
fd(){
    echo -e "${BLUE}[*] Install fd..${NC}"
    sudo apt install fd-find
    ln -s $(which fdfind) $HOME/.local/bin/fd
    echo "\n"
}


#go
golang(){
    echo -e "${BLUE}[*] Install go..${NC}"
    GO_URL="https://golang.org"
    GO_ENDPOINT="$(curl -s https://go.dev/dl/ | grep "linux" -n --color |head -1| cut -d "=" -f 3 | cut -d '"' -f 2)"
    curl -L0 -s $GO_URL$GO_ENDPOINT -o go.tar.gz
    sudo tar -C /usr/local -xvf go.tar.gz
    rm go.tar.gz
    echo "export PATH=$PATH:/usr/local/go/bin" >> $HOME/.profile
    echo "export PATH=$PATH:$HOME/go/bin" >> $HOME/.zshrc #Add go install in PATH
    echo "\n"
}


#ko
ko(){
    echo -e "${BLUE}[*] Install ko..${NC}"
    go install github.com/google/ko@latest
    echo "\n"
}


#ngrok
ngrok(){
    echo -e "${BLUE}[*] Install ngrok..${NC}"
    wget --no-check-certificate https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
    unzip ngrok-stable-linux-amd64.zip
    mv ./ngrok $HOME/.local/bin/
    echo -e "${ROSE}[INPUT REQUIRE] Enter your ngrok token: (find it https://dashboard.ngrok.com/get-started/your-authtoken)${NC}"
    read -s NGROK_TOKEN
    $HOME/.local/bin/ngrok authtoken $NGROK_TOKEN
    unset NGROK_TOKEN
     echo "\n"
}

#fx
fx(){
    echo -e "${BLUE}[*] Install fx..${NC}"
    wget https://github.com/antonmedv/fx/releases/latest/download/fx-linux.zip
    unzip fx-linux.zip && rm fx-linux.zip
    mv fx-linux fx && mv fx $HOME/.local/bin/
    echo "\n"
}

mitm-proxy(){
    echo -e "${BLUE}[*] Install mitm-proxy..${NC}"
    rm -f ~/Downloads/mitmproxy-*
    echo -e "${ROSE}Visit https://mitmproxy.org > \"Download binary\" > Press enter when it is ok...${NC}"
    read ok
    tar xvf ~/Downloads/mitmproxy-*
    mv mitmproxy $HOME/.local/bin/
    mv mitmdump $HOME/.local/bin/
    mv mitmweb $HOME/.local/bin/
    rm -f ~/Downloads/mitmproxy-*
    echo "\n"
}

pup(){
    echo -e "${BLUE}[*] Install pup..${NC}"
    go get github.com/ericchiang/pup
    echo "\n"
}

vim(){
    echo -e "${BLUE}[*] Install vim..${NC}"
    sudo apt install vim
    echo -e "${BLUE}[->] Set up vundle vim..${NC}"
    mkdir -p ~/.vim/bundle/
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    echo -e "${BLUE}[->] Install vim plugin (Nerdtree,lightline)..${NC}"
    echo -e "
set nocompatible 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'itchyny/lightline.vim'
Plugin 'preservim/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch' 
call vundle#end()
map <C-g> :NERDTreeToggle<CR>
filetype plugin indent on
    " >> $HOME/.vimrc
    echo -e "${BLUE}[->] Load plugin into vim..${NC}"
    vim -u NONE -c "PluginInstall" -c q
    echo "\n"
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
