source ~/.bashrc
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-fzf-history-search
    history-substring-search 
)

if [ ! -f "~/fzf" ]; then 
    git clone git@github.com:junegunn/fzf.git ~/fzf/
fi

source ~/fzf/shell/completion.zsh
source ~/fzf/shell/key-bindings.zsh
source $ZSH/oh-my-zsh.sh
