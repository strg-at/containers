#!/usr/bin/bash

# Set the default shell to zsh for both user and root users
chsh -s $(which zsh) root || true
chsh -s $(which zsh) user || true

# Hack to get the latest ruby version installed
RUBY_VER=$(ls -alt /home/user/.local/share/gem/ruby | sed -n '2p' | cut -d ' ' -f9)

# Only set the default zshrc configuration if the file doesn't exist
if [ ! -f /root/.zshrc ]; then
    cat <<'EOF' >/root/.zshrc
# Set up the prompt

autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Use emacs keybindings even if our EDITOR is set to vi
bindkey -e

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
alias docker-compose='docker compose'
EOF
fi

if [ ! -f /home/user/.zshrc ]; then
    cp /root/.zshrc /home/user/.zshrc
    echo "path+=('/home/user/.local/share/gem/ruby/$RUBY_VER/bin')" >> /home/user/.zshrc
fi

chown user:user /home/user/.zshrc
