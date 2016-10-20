# check for existing running agent info
if [[ -e $HOME/.gpg-agent-info ]]; then
    source $HOME/.gpg-agent-info
    export GPG_AGENT_INFO SSH_AUTH_SOCK SSH_AGENT_PID
fi

# test existing agent, remove info file if not working
ssh-add -L 2>/dev/null >/dev/null || rm -f $HOME/.gpg-agent-info

# if no info file, start up potentially-new, working agent
if [[ ! -e $HOME/.gpg-agent-info ]]; then
    if which gpg-agent 2>&1 >/dev/null ; then
        gpg-agent \
            --enable-ssh-support \
            --daemon \
            --write-env-file \
            --use-standard-socket \
            --pinentry-program $(brew --prefix)/bin/pinentry-mac \
            2>&1 >/dev/null
    fi
fi

# load up new agent info
if [[ -e $HOME/.gpg-agent-info ]]; then
    source $HOME/.gpg-agent-info
    export GPG_AGENT_INFO SSH_AUTH_SOCK SSH_AGENT_PID
fi
