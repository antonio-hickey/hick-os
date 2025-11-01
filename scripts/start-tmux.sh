#!/bin/bash

SESSION=$(echo "$$ $RANDOM" | md5sum | cut -c1-6)

# Only create session if it doesn't exist
tmux has-session -t $SESSION 2>/dev/null || {
    tmux new-session -d -s $SESSION

    # Create a big main left window, with 2 small 
    # vertical split windows to the right.
    #
    # +-----------+----+
    # |           |    | 
    # |           +----+
    # |           |    | 
    # +-----------+----+
    tmux split-window -h -p 25
    tmux select-pane -R -t $SESSION:0.0
    tmux split-window -v -p 50
    tmux select-pane -t 0
}

tmux attach -t $SESSION

