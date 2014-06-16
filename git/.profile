# Git Flow aliases (https://github.com/nvie/gitflow)
alias gff='git flow feature'
alias gfr='git flow release'
alias gfh='git flow hotfix'
alias gfs='git flow support'

alias gst='git status'
alias gco='git checkout'
alias gci="'C:/Program Files/TortoiseGit/bin/TortoiseGitProc.exe' /command:commit #/filepath:$(git rev-parse --show-toplevel)" #'git commit'
alias gcia='git commit --amend'
alias gcip='git commit -p' # Partial commit, stage hunks interactively
alias gcm=commitWithMessage
alias grb='git rebase'
alias gbr='git branch'
alias gpl='git pull'
alias gpu='git push'
alias gad='git add -A'
alias gmt='git mergetool'
alias grwd='git reset --hard && git clean -f -d' # removes staged/working directory changes and untracked files
alias root='cd "$(git rev-parse --show-toplevel)"'
alias glg="'C:/Program Files/TortoiseGit/bin/TortoiseGitProc.exe' /command:log /path:."
alias gls='git log --color --decorate --graph --pretty=format:"%C(auto)%h%C(reset) -%C(auto)%d%C(reset) %s %C(green)(%cr) %C(red)<%an>%C(reset)" --abbrev-commit'
alias gla='git log --color --graph --all --date-order --pretty=format:"%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(green)(%cr) %C(cyan)<%an>%C(reset)" --abbrev-commit'
alias glt='git tag -n5'
alias glf=findCommitByMessage
alias glfa=findCommitByMessageInAllBranches
alias gcp='git cherry-pick'
alias backport='git cherry-pick -x'
alias prev='git checkout -'
alias gru='git remote update -p'
alias gsu='git submodule update --init'

# Switch between main branches
alias master='git checkout master'
alias stable='git checkout stable'
alias develop='git checkout develop'

# ls alias for color-mode
alias ls='ls -lhaG --color'

# Lock computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# Up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# External ip
alias ip="curl -s http://wtfismyip.com/text | awk '{print $1}'"

# Refresh shell
alias reload='source ~/.profile'

# External tools
findCommitByMessage() {
    git log -i --grep="$1"
}
findCommitByMessageInAllBranches() {
    git log -i --all --grep="$1"
}
commitWithMessage() {
    git commit -m "$1"
}
launchGrepwin() {
    searchfor=$1
    filemask=$2
    winpwd=$PWD
    winpwd=${winpwd//\//\\}
    winpwd=${winpwd/\\c\\/C:\\}
    winpwd=${winpwd/\\usr\\/C:\\Program Files (x86)\\Git\\}
    winpwd=${winpwd/\\/\\\\}
    start sh -c "'C:\Program Files\grepWin\grepWin.exe' /execute /searchpath:'$winpwd' /searchfor:'$searchfor'"
    # /filemask:'$filemask'"    
}
alias grepwin=launchGrepwin

# TAB completion for aliases
__git_complete gco _git_checkout
__git_complete gbr _git_branch
__git_complete grb _git_rebase
__git_complete gpu _git_push
__git_complete gpl _git_pull
__git_complete gcp _git_cherry_pick
__git_complete backport _git_cherry_pick
__git_complete gls _git_log
__git_complete gla _git_log

# Load git flow TAB completion
# Loaded automatically from bash_completion.d folder 
#source ~/git-flow-completion.bash

# TAB completion options
set show-all-if-ambiguous on
set completion-ignore-case on
set completion-map-case on # insensitivity between hyphens and underscores

###############################
### ENVIRONMENTAL VARIABLES ###
###############################

# Add personal bin to PATH variable
PATH=$PATH:/Users/Andreas/bin
PATH=$PATH:"/c/Program Files/nodejs"
PATH=$PATH:"/c/users/Andreas/AppData/Roaming/npm/node_modules/pullr/bin"
export PATH

# Change prompt
PS1_OLD=${PS1}
export PS1='\[\033[1;34m\]\!\[\033[0m\] \[\033[1;35m\]\u\[\033[0m\]:\[\033[1;35m\]\W\[\033[0m\] \[\033[1;92m\]$(__git_ps1 "(%s)")\[\033[0m\]$ '
