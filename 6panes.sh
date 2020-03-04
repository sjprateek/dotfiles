#!/bin/bash
# Create 6 equally split panes in tmux

# Uncomment below line to create a new window first
# tmux new-window
# split vertically twice, the percentage 50 here does not matter as we will evenly space them later
tmux split-window -h -p 50
tmux split-window -h -p 50
# evenly space the 3 vertically split panes
tmux select-layout even-horizontal
# split each vertical pane into two horizontal ones, the 50% matters here
tmux select-pane -t 1
tmux split-window -v -p 50
tmux select-pane -t 3
tmux split-window -v -p 50
tmux select-pane -t 5
tmux split-window -v -p 50

# all done, going back to the first pane
tmux select-pane -t 1
