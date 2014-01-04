alias gst='git status'
alias gco='git checkout'
alias gci="'C:/Program Files/TortoiseGit/bin/TortoiseGitProc.exe' /command:commit /path:$(git rev-parse --show-toplevel)" #'git commit'
alias grb='git rebase'
alias gbr='git branch'
alias gpl='git pull'
alias gpu='git push'
alias gad='git add -A'
alias gmt='git mergetool'
alias bdf='git diff'
alias grwd='git reset --hard && git clean -f -d' # removes staged/working directory changes and untracked files
alias master='git checkout master'
alias cdroot='cd "$(git rev-parse --show-toplevel)"'
alias glg="'C:/Program Files/TortoiseGit/bin/TortoiseGitProc.exe' /command:log /path:."
#alias glg='git log --date-order --all --graph --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'
alias glg2='git log --date-order --all --graph --name-status --format="%C(green)%h%Creset %C(yellow)%an%Creset %C(blue bold)%ar%Creset %C(red bold)%d%Creset%s"'

# ls alias for color-mode
alias ls='ls -lhaG'

# lock computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'

# up 'n' folders
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# simple ip
alias ip='ifconfig | grep "inet " | grep -v 127.0.0.1 | cut -d\ -f2'
# more details
alias ip1="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
# external ip
alias ip2="curl -s http://www.showmyip.com/simple/ | awk '{print $1}'"

# grep with color
#alias grep='grep --color=auto'

# proxy tunnel
#alias proxy='ssh -D XXXX -p XXXX USER@DOMAIN'
# ssh home
#alias sshome='ssh -p XXXX USER@DOMAIN'

# processes
#alias ps='ps -ax'

# refresh shell
alias reload='source ~/.profile'

###############################
### ENVIRONMENTAL VARIABLES ###
###############################

# Add personal bin to PATH variable
export PATH=$PATH:/Users/Andreas/bin    # May be redundant; check ~/.bash_profile, /etc/profile, /etc/paths, /etc/bashrc

# Change prompt
PS1_OLD=${PS1}
export PS1='\[\033[1;34m\]\!\[\033[0m\] \[\033[1;35m\]\u\[\033[0m\]:\[\033[1;35m\]\W\[\033[0m\] \[\033[1;92m\]$(__git_ps1 "(%s)")\[\033[0m\]$ '