#!/bin/bash

AGENT_ENV="$HOME/.ssh/ssh-agent-env"

if [ -f "$AGENT_ENV" ]; then
    source "$AGENT_ENV" > /dev/null
fi

if ! pgrep -u "$USER" ssh-agent > /dev/null 2>&1; then
    eval "$(ssh-agent -s)" > "$AGENT_ENV"
    source "$AGENT_ENV"
fi

ssh-add -l &>/dev/null || ssh-add ~/.ssh/id_ed25519
