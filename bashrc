[[ -s "$HOME/.bash_aliases" ]] && source "$HOME/.bash_aliases"

export LIBRARY_PATH=$LIBRARY_PATH:/usr/lib64:/usr/lib64/mysql
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/lib:/usr/lib64
export LD_LIBRARY_PRELOAD=$HOME/lib:/usr/lib64

export PATH=~/.npm-global/bin:$PATH

# Add RVM to PATH for scripting
export PATH="$PATH:$HOME/.rvm/bin"

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Display current Git branch name in terminal prompt
find_git_branch() {
  local firstline
  local folder
  folder=`pwd`
  while [ "$folder" != "/" ] ; do
    if [[ -f "$folder/.git/HEAD" ]]; then
      break
    fi
    folder=`dirname "$folder"`
  done
  if [ "$folder" != "/" ] ; then
    read -r firstline<"$folder/.git/HEAD"
    git_branch="(${firstline/ref: refs\/heads\//})"
  else
    git_branch=""
  fi
}
PROMPT_COMMAND="find_git_branch; $PROMPT_COMMAND"
txtgrn="$(tput setaf 2 2>/dev/null || echo '\e[0;32m')"
txtcyn="$(tput setaf 6 2>/dev/null || echo '\e[0;36m')"
txtpur="$(tput setaf 5 2>/dev/null || echo '\e[0;35m')"
bakred="$(tput setab 1 2>/dev/null || echo '\e[41m')"
txtrst="$(tput sgr 0 2>/dev/null || echo '\e[0m')"
export PS1="\u@\h \w \[$txtcyn\]\$git_branch\[$txtrst\]\$ "
export SUDO_PS1="\[$bakred\]\u@\h\[$txtrst\] \w\$ "

export RIPGREP_CONFIG_PATH="$HOME/.ripgreprc"
