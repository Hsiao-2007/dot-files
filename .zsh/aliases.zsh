alias gt="git status"
# alias sysup="sudo pacman -Syu; flatpak update; yay -Syu; sudo fwupdtool upgrade"
alias sysup="sudo pacman -Syu; flatpak update; yay -Syu; sudo fwupdmgr upgrade"
alias cat="bat"
alias ls="eza --color=always --git --no-user --no-permissions --no-time --no-filesize --icons=always" 
alias lt="eza --color=always --git --long --no-user --no-permissions --no-time --no-filesize --tree --level=2 --icons=always"
alias la="eza --color=always --git --no-user --no-permissions --no-time --no-filesize --icons=always -a" 
alias ll="eza --color=always --git --long --icons=always"
alias cp='cp -i'
alias rm='rm -i'
alias mv='mv -i'
alias find='fd --color always'
alias grep='rg -p'
alias vim="nvim"
# alias vpnup="sudo nmcli connection up HomeServer"
# alias vpndw="sudo nmcli connection down HomeServer"
# alias setup-espidf="source /opt/esp-idf/export.sh"
