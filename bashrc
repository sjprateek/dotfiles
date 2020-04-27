##
# Things the user might wish to set.
export USER_PATH="~/bin"         # Extra paths.
export EDITOR=vim                # Preferred editor.

##
# Should the full environment be set up even for non-interactive shells?
# Probably not but here is a variable to control it.
export FULLENV=false             # 'true' or 'false'

##
# Should all paths (even NFS, which might hang) be set up at login?
# The alias "fullpath" is available to setup your full path.  It can
# also be used to change your path by changing USER_PATH above.
export FULLPATH=true             # 'true' or 'false'

###########################################################################
# Everything above this line helps configure the environment.

# This line should not be removed.
dotdir=~/.files; [ -f $dotdir/sys_bashrc ] && . $dotdir/sys_bashrc
[ $FULLENV != "true" ] && [ -z "$PS1" ] && return

###########################################################################
# Everything below this line is run for interactive shells.
# If you wish the full environment even in non-interactive
# shells set FULLENV above to 'true'.

umask 022                        # no write by group or other
export autologout=0              # disable autologout
export FIGNORE=".o"              # don't complete .o files
export HISTFILE=~/.bash_history  # history file
export HISTFILESIZE=500          # history file size
export HISTSIZE=128              # save last 128 commands
export ignoreeof=10              # disable ^D for logout (up to 10)
set -C                           # disable redirect overwrite
set -b                           # enable immediate job notify
export PS1="\h:\W > "            # shell prompt format

# #Paths
# PATH=$HOME/bin:/$HOME/.local/bin:$HOME/.local/share/fonts/
# export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/local/bin
# export PATH=$HOME/.cargo/bin:$PATH
# PATH=$PATH:/usr/atria/bin:/router/bin:/usr/cisco/bin
# PATH=$PATH:/auto/binos-tools/bin:/auto/cpp-tools/bin:/auto/edatools/bin:/auto/edatools/oicad/tools/bin/
# export PATH=/ws/prateesh-rtp/myapps/rust/cargo/bin:$PATH

#Paths
PATH=$HOME/bin:/usr/atria/bin:/router/bin:/$HOME/.local/bin:/usr/cisco/bin:$HOME/.local/share/fonts/
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/local/bin:/auto/binos-tools/bin:/auto/cpp-tools/bin:/auto/edatools/bin:/auto/edatools/oicad/tools/bin/
export PATH=$HOME/.cargo/bin:$PATH
export PATH=/ws/prateesh-rtp/myapps/rust/cargo/bin:$PATH
export PATH=$PATH:$HOME/.local/bin/

# Exports
export TAGS_TYPE=ctags
export VISUAL=vim
export EDITOR=vim
export HISTCONTROL=ignoredups

if [ "$(uname)" == "Darwin" ]; then
    export MORE=R
fi

# Aliases
if [ "$(uname)" == "Darwin" ]; then
    alias ls='ls -G'
    alias ll="ls -lhA -G"
else
    alias ls='ls --color=always'
    alias ll="ls -lhA --color=always"
fi
alias ssh="ssh -X"
alias h=history
alias vi="vim"
alias l=ll
alias csd="cscope -d -p8"
alias vnc='vncserver -randr 1920x1080,3840x2030,1080x1800,3360x1760'
alias work='xrandr -s 1'
alias mac='xrandr -s 0'
alias sidescreen='xrandr -s 2'
alias 6p="$HOME/bin/6panes.sh"
alias 3p="$HOME/bin/3panes.sh"

#
force_color_prompt=yes

if [ `echo $HOSTNAME | grep kvm` ] ; then
    export LIBVIRT_DEFAULT_URI="qemu:///system"
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.bash_ls_colors ] && source ~/.bash_ls_colors

if [ -f ~/.bashrc_local ]; then
        source ~/.bashrc_local
fi
