# location : /home/trettel/.zshrc
# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
export ZSH=/opt/.oh-my-zsh

# This need to be setup before ZSH_THEME for PowerLevel9k theme.
# POWERLEVEL9K_MODE='nerdfont-complete'


# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="powerlevel9k/powerlevel9k"
ZSH_THEME="agnoster"
# urxvt shit stuff
export WORDCHARS='*?_-.[]~=/&;!#$%^(){}<>'
bindkey ';5D' backward-word
bindkey ';5C' forward-word



# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(
	git
	archlinux
	zsh-completions
	zsh-autosuggestions
	zsh-syntax-highlighting
	history
	sudo
	lol
	extract
)

autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Z
. /usr/share/z/z.sh

# fe [FUZZY PATTERN] - Open the selected file with the default editor
#   - Bypass fuzzy finder if there's only one match (--select-1)
#   - Exit if there's no match (--exit-0)
fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}




# alias

alias sb100="xbacklight -set 100"
alias sb80="xbacklight -set 80"
alias sb50="xbacklight -set 50"
alias sb20="xbacklight -set 20"
alias sb1="xbacklight -set 1"

alias javacc="javac *.java"



# Atalhos
hash -d q18.1=~/Documents/UF/p/18.1

hash -d q18.2=~/Documents/UF/p/18.2
hash -d POO=~/Documents/UF/p/18.2/POO
hash -d CEC=~/Documents/UF/p/18.2/CEC
hash -d SD=~/Documents/UF/p/18.2/SD
hash -d AA=~/Documents/UF/p/18.2/AA
hash -d CES=~/Documents/UF/p/18.2/CES


hash -d HP=~/Documents/projects/HeroPublishing
hash -d IC=~/Documents/UF/IC
hash -d DR=~/Documents/projects/IA_plays_something/DinoRunner
hash -d TTT=~/Documents/projects/IA_plays_something/tic-tac-toe
hash -d ML=~/Documents/MachineLearning
hash -d SL=~/Documents/projects/ScientometricsLab
hash -d WAL=~/Pictures/wallpapers
hash -d GDF=~/Documents/projects/GDF_Formatter
hash -d HM=~/Documents/projects/HashingMusics
hash -d CPE=~/Documents/projects/BackPlataformaCPE
hash -d RSL=~/Documents/CreationLab/RustLab
hash -d ChFS=~/Documents/projects/ChaosFS
hash -d TARS=~/Documents/projects/TARS

# PowerLevel9k config
# More info on https://github.com/bhilburn/powerlevel9k/wiki/Stylizing-Your-Prompt
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context_joined dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(command_execution_time)
POWERLEVEL9K_DIR_HOME_BACKGROUND='cyan'
POWERLEVEL9K_DIR_DEFAULT_BACKGROUND='cyan'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND='cyan'
POWERLEVEL9K_STATUS_OK_BACKGROUND='023'
POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD='1'
#POWERLEVEL9K_PROMPT_ON_NEWLINE=true
#POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\u2570\uf460 "
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=6
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uf113'


# Highlights
#
# Colors
# Magenta = 165      Cyan    = 030      Yellow  = 178
# Red     = 160      Blue    = 033      Green   = 028
# Orange  = 208      Purple  = 093
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
# brackets
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=033,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=160,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=178,bold'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=165,bold'
# main
# default
ZSH_HIGHLIGHT_STYLES[default]='none'
# unknown
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=160'
# command
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=165,bold'
ZSH_HIGHLIGHT_STYLES[alias]='fg=208'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=028,bold'
ZSH_HIGHLIGHT_STYLES[function]='fg=028,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=028'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=208,underline' #DarkOrange
ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=178'
ZSH_HIGHLIGHT_STYLES[hashed-command]='fg=028'
ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=033'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=033,underline'
# path
ZSH_HIGHLIGHT_STYLES[path]='fg=178' #Yellow
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=178'
ZSH_HIGHLIGHT_STYLES[path_approx]='fg=178'
# shell
ZSH_HIGHLIGHT_STYLES[globbing]='fg=030'
ZSH_HIGHLIGHT_STYLES[history-expansion]='fg=033'
ZSH_HIGHLIGHT_STYLES[assign]='fg=165'
ZSH_HIGHLIGHT_STYLES[dollar-double-quoted-argument]='fg=093,underline'
ZSH_HIGHLIGHT_STYLES[back-double-quoted-argument]='fg=093,underline'
ZSH_HIGHLIGHT_STYLES[back-quoted-argument]='fg=093'
# quotes
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=165,underline'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=165'

# conda init >>>
# !! Contents within this block are managed by 'conda init' !!
#   __conda_setup="$(CONDA_REPORT_ERRORS=false '/home/trettel/.anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
#   if [ $? -eq 0 ]; then
#       eval "$__conda_setup"
#   else
#       if [ -f "/home/trettel/.anaconda3/etc/profile.d/conda.sh" ]; then
#           . "/home/trettel/.anaconda3/etc/profile.d/conda.sh"
#           CONDA_CHANGEPS1=false conda activate base
#       else
#           export PATH="/home/trettel/.anaconda3/bin:$PATH"
#       fi
#   fi
#   unset __conda_setup
# <<< conda init <<<
