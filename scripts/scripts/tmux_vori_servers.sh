#!/bin/sh

tmux new-session -d -s 'vori'
tmux new-window -n 'code'
tmux new-window -n 'wing_vol_servers'

# Prepare code work environment
tmux select-window -t vori:1
tmux send-keys 'vorienv' C-m
tmux send-keys 'cd ~/Projects/vori/algos/servers' C-m

# Prepare servers
tmux select-window -t vori:2
tmux split-window -h 
tmux split-window -v
tmux split-window -h 
tmux split-window -v 
tmux split-window -h
tmux split-window -v 
tmux split-window -h 
tmux split-window -v
tmux split-window -h
tmux select-layout tiled

tmux setw synchronize-panes
tmux send-keys 'vorienv' C-m
tmux send-keys 'cd ~/Projects/vori/algos/servers' C-m
tmux setw synchronize-panes

tmux select-pane -t 0
tmux send-keys 'python ibkr_position_server.py'

tmux select-pane -t 1
tmux send-keys 'python und_price_server.py -u SPY FB'

tmux select-pane -t 2
tmux send-keys 'python vol_curve_server.py -u SPY FB'

tmux select-pane -t 3
tmux send-keys 'python risk_server.py'

tmux select-pane -t 4
tmux send-keys 'python wing_vol_theo_server.py -t SPY FB'

tmux select-pane -t 5
tmux send-keys 'python wing_vol_order_server.py -t FB'

tmux select-pane -t 6
tmux send-keys 'python wing_vol_log_server.py'

tmux select-pane -t 7
tmux send-keys 'python ../delta_hedger.py'

tmux select-pane -t 8
tmux send-keys 'cd ~/Projects/vori/web/' C-m
tmux send-keys 'python manage.py runserver'

tmux attach-session -t vori
