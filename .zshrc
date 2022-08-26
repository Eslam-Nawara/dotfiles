# Enable colors and change prompt
autoload -U colors && colors
PROMPT="%{$fg[blue]%}%3~ %{$fg[blue]%}❭%{$reset_color%}%b "

# Lines configured by zsh-newuser-install
HISTFILE=~/.cache/zsh/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

PLUGINS_DIR="/usr/share/zsh/plugins"

# Plugins
source $PLUGINS_DIR/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
source $PLUGINS_DIR/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Source some files to set aliases and environment variables
[[ -f $HOME/.config/zsh/zsh_aliases    ]] && source "$HOME/.config/zsh/zsh_aliases"
[[ -f $HOME/.config/zsh/zsh_env        ]] && source "$HOME/.config/zsh/zsh_env"
