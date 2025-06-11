set EDITOR "nvim"
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

fish_add_path ~/.go
fish_add_path ~/.go/bin

alias vim='nvim'

alias l='ls -1'
alias gs='git status'
alias ga='git add .'
alias gb='git switch -f (git branch | fzf | string trim)'
alias gp='git push'
alias gl='git pull'
alias gmt="git mergetool"
alias gdb='git branch --merged | egrep -v "(^\*|main|dev)" | xargs git branch -d'
alias grh='git reset --hard'
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

#alias pj='cd (find ~/workspace -type d -not -path "*/node_modules/*" -maxdepth 1 | fzf) && tn'

function pj
    # Use fzf to select a directory from ~/workspace excluding node_modules
    set dir (find ~/workspace -type d -not -path "*/node_modules/*" -maxdepth 1 | fzf)

    # Extract directory name as session name (for simplicity)
    set session_name (basename $dir)

    # Check if you are already inside a tmux session
    if test -n "$TMUX"
        # Inside tmux: check if session exists
        tmux has-session -t $session_name 2>/dev/null
        if test $status -eq 0
            # Switch to existing session if it exists
            tmux switch-client -t $session_name
        else
            # Create a new session within the current tmux server
            tmux new-session -d -s $session_name -c $dir
            tmux switch-client -t $session_name
        end
    else
        # Outside tmux: check if session exists
        tmux has-session -t $session_name 2>/dev/null
        if test $status -eq 0
            # Attach to existing session if it exists
            tmux attach-session -t $session_name
        else
            # Create new tmux session and start in the selected directory
            tmux new-session -s $session_name -c $dir
        end
    end
end

function trr-pj
    # Use fzf to select a directory from ~/workspace excluding node_modules
    set dir ~/workspace/trr-compose
    set name (find ~/workspace/trr-compose/apps -type d -not -path "*/node_modules/*" -maxdepth 1 | fzf)

    # Extract directory name as session name (for simplicity)
    set session_name (basename $name)

    # Check if you are already inside a tmux session
    if test -n "$TMUX"
        # Inside tmux: check if session exists
        tmux has-session -t $session_name 2>/dev/null
        if test $status -eq 0
            # Switch to existing session if it exists
            tmux switch-client -t $session_name
        else
            # Create a new session within the current tmux server
            tmux new-session -d -s $session_name -c $name
            tmux new-window -t $session_name: -c $dir 
            tmux switch-client -t $session_name
        end
    else
        # Outside tmux: check if session exists
        tmux has-session -t $session_name 2>/dev/null
        if test $status -eq 0
            # Attach to existing session if it exists
            tmux attach-session -t $session_name
        else
            # Create new tmux session and start in the selected directory
            tmux new-session -d -s $session_name -c $name
            tmux new-window -t $session_name: -c $dir 
        end
    end
end

function t
  tmux $argv
end

function gcm
  git commit -m "$argv"
end

function dc
  docker-compose -f docker-compose-arm64.yml $argv
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

function gsf
  git switch -f $argv
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

function mux
  tmuxinator $argv
end 

function remove_path
  if set -l index (contains -i "$argv" $fish_user_paths)
    set -e fish_user_paths[$index]
    echo "Removed $argv from the path"
  end
end

set -gx direnv_fish_mode disable_arrow

direnv hook fish | source

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /Users/david.sttivend/.ghcup/bin # ghcup-env

source /opt/homebrew/opt/asdf/libexec/asdf.fish

alias aws_trr_legacy="docker run --rm -v ~/.okta/config.legacy.properties:/root/.okta/config.properties -v ~/.aws:/root/.aws -it public.ecr.aws/e4w7r6f6/trr/okta-awscli-java withokta aws trr-legacy --version && export AWS_PROFILE=trr-legacy"
alias aws_trr_staging="docker run --rm -v ~/.okta/config.staging.properties:/root/.okta/config.properties -v ~/.aws:/root/.aws -it public.ecr.aws/e4w7r6f6/trr/okta-awscli-java withokta aws trr-staging --version && export AWS_PROFILE=trr-staging"
alias aws_trr_production='docker run --rm -v ~/.okta/config.production.properties:/root/.okta/config.properties -v ~/.aws:/root/.aws -it public.ecr.aws/e4w7r6f6/trr/okta-awscli-java withokta aws trr-production --version && export AWS_PROFILE=trr-production'
