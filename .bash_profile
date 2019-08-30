export LC_ALL=en_US.UTF-8
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

source ~/git-completion.bash

alias gs='git status'
alias ga='git add .'
alias gp='git push'
alias ws='cd /Users/davidsttivend/workspace'
alias dps='docker ps -a'
alias di='docker images'
alias dip='docker image prune'
alias evimrc='vim ~/dotfiles/.vimrc'
alias gdb='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

function gcm(){
	git commit -m "$@"
}

function dc(){
	docker-compose $@
}

function drm(){
	docker rm $@
}

function drmi(){
	docker rmi $@
}

function gc() {
	git checkout $1
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PS1='\[\e[1;31m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\]$(parse_git_branch)\[\e[1;36m\] >\[\e[m\] '
export CLICOLOR=1;
export LSCOLORS=exfxcxdxbxegedabagacad;
export HISTSIZE=10000
export HISEFILESIZE=10000
