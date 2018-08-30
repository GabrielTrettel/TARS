# .zshrc config file by Gabriel M. Trettel

# Path to your oh-my-zsh installation.
export ZSH=/home/trettel/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

# urxvt shit stuff
export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
bindkey ';5D' backward-word
bindkey ';5C' forward-word


plugins=(git
	 archlinux
	 zsh-completions
	 zsh-autosuggestions
	 zsh-syntax-highlighting
	 history
	 sudo)

source $ZSH/oh-my-zsh.sh


# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi


# alias
alias javacc="javac *.java"



# Atalhos
hash -d q18.1=~/Documents/UF/p/18.1

hash -d q18.2=~/Documents/UF/p/18.2
hash -d POO=~/Documents/UF/p/18.2/POO
hash -d CEC=~/Documents/UF/p/18.2/CEC
hash -d SD=~/Documents/UF/p/18.2/SD
hash -d AA=~/Documents/UF/p/18.2/AA
hash -d CES=~/Documents/UF/p/18.2/CES

hash -d HP=~/Documents/UF/IC/HeroPublishing
hash -d IC=~/Documents/UF/IC
hash -d DR=~/Documents/projects/IA_plays_something/DinoRunner
hash -d TTT=~/Documents/projects/IA_plays_something/tic-tac-toe
hash -d ML=~/Documents/projects/MachineLearning
hash -d CF=~/Documents/projects/config

hash -d WAL=~/Pictures/wallpapers
