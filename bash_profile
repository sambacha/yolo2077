#bash_profile
git_branch () { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'; }
HOST='\033[02;36m\]\h'; HOST=' '$HOST
TIME='\033[01;31m\]\t \033[01;32m\]'
LOCATION=' \033[01;34m\]`pwd | sed "s#\(/[^/]\{1,\}/[^/]\{1,\}/[^/]\{1,\}/\).*\(/[^/]\{1,\}/[^/]\{1,\}\)/\{0,1\}#\1_\2#g"`'
BRANCH=' \033[00;33m\]$(git_branch)\[\033[00m\]\n\$ '
PS1=$TIME$USER$HOST$LOCATION$BRANCH
PS2='\[\033[01;36m\]>'

ForegroundColour=#A0A0A0
BackgroundColour=#1B1D1E
CursorColour=#A0A0A0
Black=#1B1D1E
Red=#F92672
Green=#82B414
Yellow=#FD971F
Blue=#268BD2
Magenta=#8C54FE
Cyan=#56C2D6
White=#CCCCC6
BoldRed=#FF5995
BoldBlack=#505354
BoldGreen=#B7EB46
BoldYellow=#FEED6C
BoldBlue=#62ADE3
BoldMagenta=#BFA0FE
BoldCyan=#94D8E5
BoldWhite=#F8F8F2

alias ll="ls -l"
alias la="ls -A"
alias l="ls -CF"

if [ -x /usr/bin/dircolors ]; then
    eval "$(dircolors -b)"
    alias ls="ls --color=auto"
    alias dir="dir --color=auto"
    alias vdir="vdir --color=auto"
    alias grep="grep --color=auto"
    alias fgrep="fgrep --color=auto"
    alias egrep="egrep --color=auto"

fi