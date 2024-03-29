# Reload bashrc
alias bashrc='source ~/.bashrc'

# file / directory encryption
# encrypt_dir [output.gpg] [dir]
alias encrypt_dir='gpgtar --encrypt --symmetric --output'

# decrypt_dir [target_dir] [input.gpg]
alias decrypt_dir='gpgtar --decrypt --directory'

# open nvim with fzf
alias fvim='nvim -o `fzf`'

# "nvimdiff"
alias nvimdiff='nvim -d'

# Brave browser alias
alias brave='brave-browser'

# Launch my notes
alias nvim_notes='nvim -O ~/wiki/wiki/index.wiki ~/wiki/wiki/todo.wiki ~/wiki/wiki/diary/diary.wiki'

# git shortcuts
alias git_cleanup='source ~/scripts/git_cleanup.sh'
alias git_black='git st -sb | xargs -n1 echo | grep .py | xargs -I {} black -l 120 {}'
alias git_sync='git co master && git pull upstream master && git push origin master'
alias gs='git status'
alias gg='git graph'
alias gc='git commit'
alias ga='git amend'
alias gp='git submit'
alias gb='git branch'
alias gco='git checkout'
alias gc_tmp='git add . && git ci -m "tmp commit"'
alias gr_tmp='git reset --soft HEAD~ && git restore --staged .'

# Python
alias pyprof='python -m cProfile'

# Vori
alias vori='cd ~/vori/ && source ~/vori/env/bin/activate'

# activate vori env
alias vorienv='source ~/vori/env/bin/activate'

# vori hosts
alias ssh_vori_1='ssh ubuntu@ec2-44-233-236-45.us-west-2.compute.amazonaws.com -i "~/Projects/vori/ssh_key.pem"'
alias ssh_vori_2='ssh ubuntu@ec2-52-12-205-97.us-west-2.compute.amazonaws.com -i "~/Projects/vori/ssh_key.pem"'

# chronos
alias run_pipeline='python ~/vori/chronos/api/run.py'

# Vori tmux server layout
alias vori_servers='source ~/scripts/tmux_vori_servers.sh'

# lazy git
alias lg='lazygit'
