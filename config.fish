source ~/workspace/Dot-Files/git-completion.fish

set EDITOR "vim"

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
set SPACEFISH_GIT_BRANCH_COLOR af87ff
set SPACEFISH_DOCKER_SHOW false
set SPACEFISH_GIT_PREFIX ""

# Prompt Colors
set SPACEFISH_USER_COLOR F37F97
set SPACEFISH_DIR_COLOR 79E6F3
set SPACEFISH_GIT_STATUS_COLOR F37F97

alias l='ls -1'
alias gs='git status'
alias ga='git add .'
alias gb='git branch'
alias gp='git push'
alias gl='git pull'
alias gdb='git branch --merged | egrep -v "(^\*|master|dev)" | xargs git branch -d'
alias tls='tmux ls'
alias cl='clear'

alias ws='cd ~/workspace'
alias dotfiles='cd ~/dotfiles'
alias dps='docker ps -a'
alias di='docker images'
alias dip='docker image prune'

function t
  tmux $argv
end

function gcm
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

function __nvm_use_on_cd --on-variable PWD --description 'Use Node.js version specified by project'
    if test -e .nvmrc
       nvm use
       return
    end
    
    if test -e .node-version
       nvm use (cat .node-version)
       return
    end
end

