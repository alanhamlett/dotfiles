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

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Initialize rbenv
eval "$(rbenv init -)"

# Configure the correct version of Java for BUCK
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$JAVA_HOME/bin:$PATH

export PATH=~/.npm-global/bin:$PATH
export NVM_DIR="$HOME/.nvm"

source "$HOME/.zsh_aliases"

alias ll="ls -la"
alias l="ls -la"
alias vi=vim
alias vim=/usr/local/bin/vim
alias brokenxcode='rm -rf ~/Library/Developer/Xcode/DerivedData/'

# git specific
alias gitprune="git remote prune origin"
alias rb='curbranch=`git rev-parse --abbrev-ref HEAD`; git checkout master && git pull && git checkout $curbranch && git rebase master'
alias st="git status"
alias p="git pull"
alias push="git push"
alias pushf="git push --force-with-lease"
alias pushn="git push --no-verify"
alias pushfn="git push --force-with-lease --no-verify"
alias ci="git commit -a"
alias co="git checkout"
alias branch="git branch"
alias stash="git stash"
alias rebase="git rebase"
alias reset="git reset"
alias gdiff="git diff"
alias log="git log"
