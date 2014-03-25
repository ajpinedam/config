# Git Flow aliases (https://github.com/nvie/gitflow)
alias gff='git flow feature'
alias gfr='git flow release'
alias gfh='git flow hotfix'
alias gfs='git flow support'

alias gst='git status'
alias gco='git checkout'
alias gci="'C:/Program Files/TortoiseGit/bin/TortoiseGitProc.exe' /command:commit #/filepath:$(git rev-parse --show-toplevel)" #'git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gpl='git pull'
alias gpu='git push'
alias gad='git add -A'
alias gmt='git mergetool'
alias grwd='git reset --hard && git clean -f -d' # removes staged/working directory changes and untracked files
alias cdroot='cd "$(git rev-parse --show-toplevel)"'
alias glg="'C:/Program Files/TortoiseGit/bin/TortoiseGitProc.exe' /command:log /path:."
alias glg1='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# Switch between main branches
alias master='git checkout master'
alias stable='git checkout stable'
alias develop='git checkout develop'

# ls alias for color-mode
alias ls='ls -lhaG --color'

# lock computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# external ip
alias ip="curl -s http://wtfismyip.com/text | awk '{print $1}'"

# refresh shell
alias reload='source ~/.profile'

# TAB completion for aliases
__git_complete gco _git_checkout
__git_complete gbr _git_branch
__git_complete grb _git_rebase
__git_complete gpu _git_push
__git_complete gpl _git_pull

# Load git flow TAB completion
source ~/git-flow-completion.bash

# TAB completion options
set show-all-if-ambiguous on
set completion-ignore-case on
set completion-map-case on # insensitivity between hyphens and underscores

###############################
### ENVIRONMENTAL VARIABLES ###
###############################

# Add personal bin to PATH variable
export PATH=$PATH:/Users/Andreas/bin    # May be redundant; check ~/.bash_profile, /etc/profile, /etc/paths, /etc/bashrc

# Change prompt
PS1_OLD=${PS1}
export PS1='\[\033[1;34m\]\!\[\033[0m\] \[\033[1;35m\]\u\[\033[0m\]:\[\033[1;35m\]\W\[\033[0m\] \[\033[1;92m\]$(__git_ps1 "(%s)")\[\033[0m\]$ '
