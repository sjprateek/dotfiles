# Generic $dotdir/bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
        . ~/.bashrc
fi

# User specific environment and startup programs
[ -z " $HOSTNAME" ] && HOSTNAME=`uname -n`
keychain -q ~/.ssh/id_rsa
. ~/.ssh-agent-${HOSTNAME}


export PATH="/ws/prateesh-rtp/rust/rust_installation_dir/cargo//bin:$PATH"
