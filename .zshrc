# PROMPT SETTINGS
# Set up the prompt
autoload -U colors && colors
PROMPT="%{$fg[blue]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%}~> "
RPROMPT="%{$fg[cyan]%}%~%{$reset_color%}"

#bindkey -e

# Prompt when using Vi-mode instead of Emacs mode
# export KEYTIMEOUT=1
# bindkey -v
# # Keep backward search using Vi mode
# bindkey '^r' history-incremental-search-backward
# function zle-keymap-select zle-line-init () {
#     PROMPT="${${KEYMAP/vicmd/"%{$fg[blue]%}%n%{$reset_color%}@%{$fg[magenta]%}%m%{$reset_color%}~> "}/(main|viins)/"%{$fg[blue]%}%n%{$fg[green]%}@%{$fg[magenta]%}%m%{$reset_color%}~> "}"
#     zle reset-prompt
# }

# zle -N zle-line-init
# zle -N zle-keymap-select

# HISTORY SETTINGS
# Keep X lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=100000000
SAVEHIST=100000000
HISTFILE=~/.zsh_history
setopt inc_append_history
setopt hist_ignore_dups

# COMPLETION
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

# Fix auto exit at eof and utf-8 in LESS
export LESS=dMqifR
export LESSCHARSET=utf-8

# Fix delete key, ctrl+l and ctrl+r
bindkey "\e[3~" delete-char
bindkey ";5D" backward-word
bindkey ";5C" forward-word
bindkey "5~" kill-word
bindkey "${terminfo[khome]}" beginning-of-line
bindkey "${terminfo[kend]}" end-of-line

# Aliases
alias ll='ls -la'
alias pac="sudo pacman -S"
alias apt="sudo apt-get install"
alias gopen="gnome-open"
alias l="ls --color=auto"
alias ls="ls --color=auto"
alias grep="grep --color=auto"
alias c="cd"
alias cc="cd .."
alias :q="exit"
alias :wq="exit"
alias gk="gitk --all&"
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'
alias vzw='vim ~/.zaxisrc'
alias vv='vim ~/.vimrc'
alias v='vim'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias rh="cat ~/.zsh_history | grep "
alias gd='git diff'
alias ccd='pushd'

## i3 lockscreen
alias i3lock='i3lock -i ~/Pictures/space.png'

## Color on man pages
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;47;34m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS=-r

# Functions
function cl() {
	cd "$1" && ls
}

# Work
source ~/.zaxisrc

unsetopt correct
