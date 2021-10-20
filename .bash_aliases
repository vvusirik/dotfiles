# Reload bashrc
alias bashrc='source ~/.bashrc'

# open nvim with fzf
alias fvim='nvim -o `fzf`'

# "nvimdiff"
alias nvimdiff='nvim -d'

# activate vori env
alias vorienv='source ~/vori/env/bin/activate'

# Brave browser alias
alias brave='brave-browser'

# Launch my notes
alias nvim_notes='nvim -O ~/wiki/wiki/index.wiki ~/wiki/wiki/todo.wiki ~/wiki/wiki/diary/diary.wiki'

# git shortcuts
alias gst='git st'

# cheatsheet
alias cht='bash ~/scripts/chtsht.sh'
alias pycht='bash ~/scripts/chtsht.sh python'

# vori hosts
alias ssh_vori_1='ssh ubuntu@ec2-44-233-236-45.us-west-2.compute.amazonaws.com -i "~/Projects/vori/ssh_key.pem"'
alias ssh_vori_2='ssh ubuntu@ec2-52-12-205-97.us-west-2.compute.amazonaws.com -i "~/Projects/vori/ssh_key.pem"'

alias git_black='git st -sb | xargs -n1 echo | grep .py | xargs -I {} black -l 120 {}'
