# Exports

export EDITOR=vim
export VISUAL=vim
export HISTCONTROL=ignoredups

if [ "$(uname)" == "Darwin" ]; then
    alias ls='ls -G'
    alias ll="ls -lhA -G"
    alias l.="ls -d .*"
else
    alias ls='ls --color=always'
    alias ll="ls -lhA --color=always"
    alias l.="ls -d .* --color=auto"
fi

alias ssh="ssh -X"
alias vi="vim -p"
alias v="vim -p"
alias l=ll
alias csd="cscope -d -p8"
alias vnc='vncserver -randr 1920x1080,3840x2030,1080x1800,3360x1760'
alias work='xrandr -s 1'
alias mac='xrandr -s 0'
alias sidescreen='xrandr -s 2'
alias 6p="$HOME/bin/6panes.sh"
alias 3p="$HOME/bin/3panes.sh"

# disabled grep.zsh execution in oh-my-zsh.sh coz it eventually creates
# the following alias for grep
alias grep="grep  --color=auto --exclude-dir={.bzr,CVS,.git,.hg,.svn}"


