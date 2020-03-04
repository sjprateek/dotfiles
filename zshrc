# zmodload zsh/zprof

# for tmux to show colors properly
export TERM=xterm-256color

setopt beep notify
unsetopt autocd
bindkey -v

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit
done
compinit -C

#Paths
export USER_PATH="~/bin"

PATH=$HOME/bin:/$HOME/.local/bin:$HOME/.local/share/fonts/
export PATH=$PATH:/bin:/sbin:/usr/bin:/usr/local/bin
export PATH=$HOME/.cargo/bin:$PATH

source ~/.zsh/aliases_and_exports.zsh
source ~/.zsh/plugins/history.zsh
source ~/.zsh/plugins/key-bindings.zsh
source ~/.zsh/plugins/completion.zsh
source ~/.zsh/plugins/vi-mode.plugin.zsh
source ~/.zsh/plugins/mkc.plugin.zsh
source ~/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/configs/paste_fix.zsh
source ~/.zsh/configs/fzf_config.zsh
source ~/.zsh/configs/ls_config.zsh
# source ~/.zsh/configs/prompt.sh
source ~/.zsh/configs/minimal_prompt.zsh

#  zsh versions older than 5.4 does not properly support syntax highlighting
# source ~/.zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -f ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi

# zprof

