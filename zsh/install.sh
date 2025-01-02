#!/bin/bash
if [[ "$USER" == "root" ]]; then
	echo "Please don't run this as root"
else
	whereis zsh
	if [[ "$?" -eq 0]]; then
        echo "Installing oh-my-zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
		echo "Copying server .zshrc..."
		cp .zshrc ~/
		echo "Copying plugins and aliases over..."
        /usr/bin/zsh
        source ~/.zshrc
		cp -r plugins/ $ZSH_CUSTOM/
		cp aliases.zsh $ZSH_CUSTOM/

	else
		echo "Please install zsh, bat, and eza first!"
		exit 1
	fi
fi
