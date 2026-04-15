# Path to your oh-my-zsh installation.
export ZSH="~/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="simple"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Disable oh-my-zsh auto update
DISABLE_AUTO_UPDATE=true

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"

export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"

export PATH="$PATH:/Applications/Chia.app/Contents/Resources/app.asar.unpacked/daemon"

# export PATH="$(pyenv root)/shims:$PATH"

source "$HOME/.zsh_aliases"
export GOPATH="$HOME/.golib"
export PATH="$PATH:$HOME/.golib/bin"

export N_PREFIX="$HOME/.n/"

export PATH=~/node_modules/.bin:$PATH

unsetopt inc_append_history
unsetopt share_history
unsetopt sharehistory

# export PATH="$HOME/.nodenv/bin:$PATH"
# eval "$(nodenv init -)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export PATH="$PATH:/Applications/CMake.app/Contents/bin"

export DENO_INSTALL="/Users/user/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"

. "$HOME/.local/bin/env"
eval "$(uv generate-shell-completion zsh)"
export PATH="/opt/homebrew/opt/go/bin:$PATH"
