export PATH=/usr/local/bin:/usr/local/sbin:$PATH
export NODE_PATH=/usr/local/lib/node

alias ls='ls -G'
alias ll='ls -l'

autoload -U promptinit
promptinit
prompt walters

autoload -U compinit
compinit

export MAVEN_OPTS=-Xmx512m
export M2_HOME=/usr/share/maven

zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}'
bindkey '^[[3~' backward-delete-word