# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

setopt no_share_history

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Configure the correct version of Java for BUCK
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$JAVA_HOME/bin:$PATH

export PATH=~/.npm-global/bin:$PATH
export NVM_DIR="$HOME/.nvm"

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

### Add Postgres App binaries to PATH
export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

source "$HOME/.zsh_aliases"
export PATH="$(pyenv root)/shims:$PATH"
export GOPATH="$HOME/.golib"
