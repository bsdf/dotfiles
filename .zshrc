# Path to your oh-my-zsh configuration.
#export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
# export ZSH_THEME="wezm"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(svn git)

# source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="/usr/bin:/usr/local/bin:/cygdrive/c/Python27:/cygdrive/c/Python27/Scripts:/cygdrive/c/Windows/system32:/cygdrive/c/Windows:/cygdrive/c/Windows/System32/Wbem:/cygdrive/c/Windows/System32/WindowsPowerShell/v1.0:/cygdrive/c/Program Files/Dell/DW WLAN Card:/cygdrive/c/Program Files (x86)/QuickTime/QTSystem:/cygdrive/c/Program Files/TortoiseSVN/bin:/cygdrive/c/Program Files/SlikSvn/bin:/cygdrive/c/Program Files/SlikSvn/bin;c:\apache-maven\bin"

autoload -U promptinit
promptinit
prompt walters

unsetopt correctall

# export M2_OPTS="-Xmx1024m -XX:MaxPermSize=1024M -XX:+CMSPermGenSweepingEnabled -XX:+CMSClassUnloadingEnabled"
export MAVEN_OPTS="-Xmx1024m -XX:MaxPermSize=1024M -XX:-UseGCOverheadLimit"

bindkey '\e[3~' delete-char
bindkey ^_ backward-delete-word
export SHELL=/bin/zsh
export TERM=xterm-256color

alias ls='ls --color'
