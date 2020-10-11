# editor
export EDITOR='vim'

# nvm
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source /usr/local/opt/nvm/nvm.sh

# java
# PATH=$PATH:/Library/Maven/apache-maven-3.3.3
# PATH=$PATH:~/Downloads/apache-maven-3.3.3/bin
# JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home

# android
export ANDROID_HOME=/usr/local/opt/android-sdk

export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:'~/bin'

# git
alias gco='git checkout'
alias gbn='git bname'
alias gpo='git pushup'
alias gfe='git sfe'

# docker
alias dc='docker-compose'

# vault
alias vault='~/vault'

# python
alias python=/usr/local/bin/python3
alias py='python'

# tmuxinator
source ~/.bin/tmuxinator.bash

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

function_exists() {
    declare -f -F $1 > /dev/null
    return $?
}

if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
    . /usr/share/bash-completion/completions/git
fi

for al in $(git config --get-regexp '^alias\.' | cut -f 1 -d ' ' | cut -f 2 -d '.'); do

  alias g${al}="git ${al}"

  complete_func=_git_$(__git_aliased_command ${al})
  function_exists ${complete_func} && __git_complete g${al} ${complete_func}
done
unset al

# does't seem to work git version 2.20.1 
# for al in `__git_aliases`; do
    # alias g$al="git $al"
# 
    # complete_func=_git_$(__git_aliased_command $al)
    # function_exists $complete_fnc && __git_complete g$al $complete_func
# done

function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

exec `defaults write NSGlobalDomain KeyRepeat -int 0`

set -o vi

# note selection function, opens with vim
function editNote() {
  cd ~/Google\ Drive/notes/
  echo "select file:"
  select d in *.{txt,md}; do test -n "$d" && break; echo ">>> Invalid Selection"; done
  vim "$d"
}
export -f editNote
source /usr/local/opt/nvm/nvm.sh
export P4CONFIG=p4config.txt
export P4CONFIG=p4.ini

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
