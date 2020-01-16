source ~/git-completion.fish
set -x LC_ALL en_US.UTF-8
set ANDROID_HOME $HOME/Library/Android/sdk
set PATH $ANDROID_HOME/emulator $PATH
set PATH $ANDROID_HOME/tools $PATH
set PATH $ANDROID_HOME/tools/bin $PATH
set PATH $ANDROID_HOME/platform-tools $PATH

set SPACEFISH_USER_SHOW always
set SPACEFISH_PACKAGE_SHOW false	
set SPACEFISH_DIR_PREFIX ""
set SPACEFISH_PROMPT_SEPARATE_LINE false
set SPACEFISH_USER_COLOR ff5f5f
set SPACEFISH_GIT_BRANCH_COLOR af87ff
set SPACEFISH_NODE_SHOW false
set SPACEFISH_GIT_PREFIX ""

alias gs='git status'
alias ga='git add .'
alias gb='git branch'
alias gp='git push'
alias gl='git pull'
alias gdb='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'

alias ws='cd ~/workspace'
alias dps='docker ps -a'
alias di='docker images'
alias dip='docker image prune'

alias evimrc='vim ~/dotfiles/.vimrc'
alias ebash='vim ~/dotfiles/.bash_profile'
alias efish='vim ~/.config/fish/config.fish'

function gc
  git commit -m "$argv"
end

function dc
  docker-compose $argv
end

function drm
  docker rm $argv
end

function drmi
  docker rmi $argv
end

function gc
  git checkout $argv
end

