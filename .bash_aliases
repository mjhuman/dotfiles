## -----------------------
## -- 2) Set up aliases --
## -----------------------

# 2.1) Safety
alias rmf="rm"
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"
set -o noclobber

# 2.2) Listing, directories, and motion
alias ll="ls -alrtF --color"
alias la="ls -A"
alias l="ls -CF"
alias dir='ls --color=auto --format=vertical'
alias vdir='ls --color=auto --format=long'
alias m='less'
alias ..='cd ..'
alias ...='cd ..;cd ..'
alias md='mkdir'
alias cl='clear'
alias du='du -ch --max-depth=1'
alias treeacl='tree -A -C -L 2'
alias fpy='cd ~/projects/python'
alias fcp='cd ~/projects/cpp'
alias fht='cd ~/projects/html'
alias fqt='cd ~/projects/qt'
# 2.3) Text and editor commands
alias em='emacs -nw'     # No X11 windows
alias eqq='emacs -nw -Q' # No config and no X11
alias ec='emacsclient -c -a ""'

