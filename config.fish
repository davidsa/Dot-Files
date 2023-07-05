source ~/workspace/Dot-Files/git-completion.fish
source /usr/local/opt/asdf/libexec/asdf.fish

set EDITOR "vim"
set -U fish_greeting

set -x LC_ALL en_US.UTF-8
set ANDROID_HOME $HOME/Library/Android/sdk
set PATH $ANDROID_HOME/emulator $PATH
set PATH $ANDROID_HOME/tools $PATH
set PATH $ANDROID_HOME/tools/bin $PATH
set PATH $ANDROID_HOME/platform-tools $PATH

set SPACEFISH_TIME_SHOW false
set SPACEFISH_USER_SHOW always
set SPACEFISH_PACKAGE_SHOW false	
set SPACEFISH_DIR_PREFIX ""
set SPACEFISH_PROMPT_SEPARATE_LINE false
set SPACEFISH_GIT_BRANCH_COLOR af87ff
set SPACEFISH_DOCKER_SHOW false
set SPACEFISH_GIT_PREFIX ""
set SPACEFISH_DOCKER_SHOW false

# Prompt Colors
set SPACEFISH_USER_COLOR F37F97
set SPACEFISH_DIR_COLOR 79E6F3
set SPACEFISH_GIT_STATUS_COLOR F37F97

# The Real Real
set -x VAULT_ADDR https://vault.therealreal.com
set -x VAULT_SKIP_VERIFY true

set -x GOPATH ~/.go

alias vim='nvim'

alias l='ls -1'
alias gs='git status'
alias ga='git add .'
alias gb='git branch'
alias gp='git push'
alias gl='git pull'
alias gdb='git branch --merged | egrep -v "(^\*|main|dev)" | xargs git branch -d'
alias tls='tmux ls'
alias tn='tmux new -s (basename "$PWD")'
alias cl='clear'

alias tn='tmux new -s (basename "$PWD")'

alias ws='cd ~/workspace'
alias dotfiles='cd ~/workspace/Dot-Files'
alias dps='docker ps -a'
alias dcps='docker-compose ps'
alias di='docker images'
alias dip='docker image prune'

alias flushdns="sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder"

alias pj='cd (find ~/workspace -type d -not -path "*/node_modules/*" -maxdepth 1 | fzf)'

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

function dex
  docker exec -it $argv bash
end

function killport
  lsof -t -i :$argv | xargs kill -9
end

function cdwhich
  cd (dirname (which $argv))
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

set -gx direnv_fish_mode disable_arrow

direnv hook fish | source

source /usr/local/opt/asdf/libexec/asdf.fish

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/david.sttivend/.ghcup/bin # ghcup-env
