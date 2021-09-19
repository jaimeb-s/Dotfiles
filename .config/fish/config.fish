## Set values
# Hide welcome message
set -U fish_greeting

## Starship prompt
starship init fish | source

## Useful aliases
# Replace ls with exa
alias ls='exa -G --color=always --group-directories-first --icons'
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias lal='exa -al --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'"  

# Replace cat with bat
alias cat="bat"

# sudo
alias sdo='sudo'

# Dotfiles
alias dt="cd ~/Dotfiles"

# exit
alias ex="exit"

# clear
alias cl="clear"

# cd
alias ..='cd ..'
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'
alias ..5='cd ../../../../..'

# tar
alias tarnow='tar -acf '
alias untar='tar -zxvf '

# Common use
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
#alias rmpkg="sudo pacman -Rdd"

alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'			# List amount of -git packages

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

## Comprimir
#zip archivo.zip archivo-a-comprimir
## Descomprimir
#unzip archivo.zip
