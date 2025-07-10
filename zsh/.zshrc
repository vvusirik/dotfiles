source ~/.bashrc
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(
    git
    fzf
    zsh-autosuggestions
    zsh-syntax-highlighting
    # zsh-fzf-history-search
    history-substring-search 
)

if [[ ! -d ~/fzf ]]; then 
    git clone git@github.com:junegunn/fzf.git ~/fzf/
fi

# source ~/fzf/shell/completion.zsh
# source ~/fzf/shell/key-bindings.zsh
source $ZSH/oh-my-zsh.sh

export PATH="${PATH}:/home/vvusirik/.cargo/bin"
export EDITOR="/usr/bin/nvim"
export VISUAL="/usr/bin/nvim"

source ~/.secret_envs

# Added by LM Studio CLI (lms)
export PATH="$PATH:/home/vvusirik/.lmstudio/bin"
# End of LM Studio CLI section

# Add openai key
export OPENAI_API_KEY=$(cat ~/openai.key)
