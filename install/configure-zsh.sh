#!/bin/bash

export BLUE='\033[0;34m'
export NC='\033[0m'

##oh-my-zsh
echo -e "${BLUE}[*] Install oh-my-zsh..${NC}"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


echo -e "${BLUE}[*] Change zsh theme..${NC}"
sed -i '/ZSH_THEME/c\ZSH_THEME="afowler"' ~/.zshrc
sed -i "/PROMPT=/c\PROMPT=\'%{\$fg_bold[green]%}🦍 %m%{\$reset_color%} %{\${fg_bold[blue]}%}:: %{\$reset_color%}%{\${fg[green]}%}%3~ \$(git_prompt_info)%{\${fg_bold[\$CARETCOLOR]}%}»%{\${reset_color}%} \'" ~/.oh-my-zsh/themes/afowler.zsh-theme

echo "Restart zsh to make changes effective"
