fastfetch

# Completion settings
autoload -U colors && colors
FPATH="$HOME/.zsh/completions:$FPATH"
autoload -U compinit; compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

bindkey -e

# History Settings
export HISTSIZE=268435456
export SAVEHIST="$HISTSIZE"
export HISTFILE="$HOME/.zsh/.zsh_history"
setopt INC_APPEND_HISTORY

# Path Variables
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH="$PATH:$(go env GOBIN)"

# Bat theme
export BAT_THEME=ansi

# XDG
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Misc
export DOCKER_HOST=unix:///run/user/1000/docker.sock
export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
export EDITOR='nvim'


# Aliases
source ~/.zsh/aliases.zsh

# ZSH Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS+=(main brackets)
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]='fg=magenta,bold'

source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--height 50% --tmux
--color=fg:-1,bg:-1,hl:#0080ff
--color=fg+:,bg+:,hl+:#5fd7ff
--color=info:#0080ff,prompt:#5fd7ff,pointer:#5fd7ff
--color=marker:#87ff00,spinner:#0080ff,header:#87afaf --preview "bat --color=always --style=numbers --line-range=:500 {}"'
eval "$(starship init zsh)"
