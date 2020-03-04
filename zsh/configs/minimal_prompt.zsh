# Minimal Prompt config

# this function cuts off 'cpp-rtp-' from hostname
# if present
function mnml_partial_hostname() {
    printf $HOST | sed s/'^cpp-rtp-*'//g
}

# The prompt:
# bld-35 configs λ ›
MNML_PROMPT=(mnml_partial_hostname mnml_pyenv 'mnml_cwd 1 0' mnml_status  mnml_keymap)
MNML_RPROMPT=()
#MNML_INFOLN=(mnml_err mnml_jobs mnml_uhp)
MNML_INFOLN=()
MNML_MAGICENTER=()

source ~/.zsh/plugins/minimal/minimal.zsh

