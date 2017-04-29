export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
source /usr/local/opt/nvm/nvm.sh

PATH=$PATH:~/Downloads/apache-maven-3.3.3/bin
JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_60.jdk/Contents/Home

export GOPATH=$HOME/Go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:'~/bin'

export AWS_DEFAULT_PROFILE="soke"

export ANDROID_HOME=/usr/local/opt/android-sdk

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

for al in `__git_aliases`; do
    alias g$al="git $al"

    complete_func=_git_$(__git_aliased_command $al)
    function_exists $complete_fnc && __git_complete g$al $complete_func
done

function iterm2_print_user_vars() {
  iterm2_set_user_var gitBranch $((git branch 2> /dev/null) | grep \* | cut -c3-)
}

exec `defaults write NSGlobalDomain KeyRepeat -int 0`

set -o vi

# note selection function, opens with vim
function editNote() {
  cd ~/Google\ Drive/notes/
  echo "select file:"
  select d in *.txt; do test -n "$d" && break; echo ">>> Invalid Selection"; done
  vim "$d"
}
export -f editNote
