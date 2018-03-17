export LIBRARY_PATH=$LIBRARY_PATH:/usr/lib64:/usr/lib64/mysql
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/lib:/usr/lib64
export LD_LIBRARY_PRELOAD=$HOME/lib:/usr/lib64

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Display current Git branch name in your terminal prompt when in a Git working directory
# https://github.com/jimeh/git-aware-prompt
export GITAWAREPROMPT=~/.bash/git-aware-prompt
source "${GITAWAREPROMPT}/main.sh"
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

# autocomplete for git branch names
# http://code-worrier.com/blog/autocomplete-git/
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

export RIPGREP_CONFIG_PATH="~/.ripgreprc"

# Load bash aliases
[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

# Load the default .profile
[[ -s "$HOME/.profile" ]] && source "$HOME/.profile"
