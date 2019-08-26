# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/davide/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

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
  vi-mode
  sudo
  web-search
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Aliases
alias zshconfig="vim ~/.zshrc"
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"
alias proxytest="cd ~/DEV/proxy; python3 proxy.py"
alias uuaa='sudo apt-get update && sudo apt-get upgrade && sudo apt-get autoremove && sudo apt-get autoclean'
alias picclean='find ~/Desktop/ -maxdepth 1 -type f -regex ".*\.\(png\|jpg\|jpeg\)" -exec mv {} /media/davide/SAMSUNG/SW/AlgSoft\ Resizer\ 4.21/P \;'
alias vidclean='find ~/Desktop/ -maxdepth 1 -type f -regex ".*\.\(flv\|3g\|mp4\|mov\|avi\|mpg\|mpeg\|webm\|m4v\|mp4\|\)" -exec mv {} ~\/dwhelper \;'
alias cpXiaomi='cp -rt /media/davide/XIAOMI/Internal\ shared\ storage/Music'
alias mountXiaomi='sudo jmtpfs -o allow_other /media/davide/XIAOMI'

TERM=xterm-256color
# VIRTUALENVWRAPPER
export WORKON_HOME=$HOME/DEV/virtualenvs
export VIRTUALENVWRAPPER_PYTHON=`which python3`
source `which virtualenvwrapper.sh`

export XDG_CONFIG_HOME=$HOME/.config/

# allows cockatrice to run on light themes prepending GTK_STYLE=... to the command
QT_QPA_PLATFORMTHEME=gtk2
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=241'

# sqlcmd 
# https://docs.microsoft.com/en-us/sql/linux/quickstart-install-connect-ubuntu?view=sql-server-2017
export PATH="$PATH:/opt/mssql-tools/bin"

# remember, for cue+ape use: 
# shnsplit -f *.cue -o flac -t '%n - %p - %t' *.ape
function splitflac (){
  if [ -z "$2" ]; then
    cue_file=$1".cue"
    flac_file=$1".flac"
  else
    cue_file=$1
    flac_file=$2
  fi
  shnsplit -f $cue_file -t %n-%t -o flac $flac_file
}

function to-music-usb(){
  if [ -z "$1" ]; then
    from_f=$(pwd)
  else
    from_f=$1
  fi
  from_f=$(readlink -f $from_f)
  to_f="/media/davide/UsbKey16G/"
  dir_name=$(basename $from_f)
  parent_path=$(dirname $from_f)
  parent_name=$(basename $parent_path)
  target_name=$parent_name"_"$dir_name
  target_name=$(echo $target_name | tr -cd '[[:alnum:]]-_./')
  target_path=$to_f$target_name
  mkdir $target_path 2> /dev/null

  echo "parent path -->"$parent_name
  echo "target path -->"$target_path

  i=0
  find $from_f -type f -regex ".*\.\(mp3\|m4a\)$" -print0 | while IFS= read -r -d $'\0' line;do
    cp $line $target_path
    i=$[$i+1]
  done
  echo "Found and copied ["$i"] mp3 or m4a files"

  i=0
  find $from_f -type f -name "*.flac" -print0 | while IFS= read -r -d $'\0' line;do
    f_name=${$(basename $line)%.*}
    t_name=$target_path"/"$f_name".mp3"
    flac -cd $line | lame -b 320 - $t_name
    i=$[$i+1]
  done
  echo "Found,converted and copied ["$i"] flac files"
}

