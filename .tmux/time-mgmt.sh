#!/usr/bin/env sh
working_dir="/home/skelly/Dropbox/coursera/time_mgmt"
session_name="time-mgmt"
edit_files="notes.md build.sh"

tmux new-session -d -s ${session_name}  
tmux new-window -c ${working_dir} -t ${session_name} -n "edit" "vim ${edit_files}"
# ensure only default window is removed, leaving a sinlge window
tmux kill-window -t 0 # target is the window index
tmux split-window -c ${working_dir} -t ${session_name} -v -p 30
tmux selectw -t 'edit' 
tmux selectp -t 0
tmux -2 attach-session -d -t ${session_name}
