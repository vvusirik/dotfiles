# Editor
export EDITOR=nvim
export VISUAL=nvim

# PATH (idempotent helpers — safe across re-sources)
path_prepend() { case ":$PATH:" in *":$1:"*) ;; *) PATH="$1:$PATH";; esac; }
path_append()  { case ":$PATH:" in *":$1:"*) ;; *) PATH="$PATH:$1";; esac; }

path_prepend "$HOME/.local/bin"
path_append  "$HOME/.cargo/bin"
path_append  "$HOME/.lmstudio/bin"
path_append  "$HOME/.opencode/bin"
export PATH

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Secrets
[ -f ~/.secret_envs ] && source ~/.secret_envs

# fzf — clone once if missing; bash bindings only when running bash
# (zsh gets fzf via the oh-my-zsh fzf plugin)
[ ! -d ~/fzf ] && git clone https://github.com/junegunn/fzf.git ~/fzf
if [ -n "$BASH_VERSION" ]; then
    [ -f ~/fzf/shell/completion.bash ]   && source ~/fzf/shell/completion.bash
    [ -f ~/fzf/shell/key-bindings.bash ] && source ~/fzf/shell/key-bindings.bash
fi

# Aliases
source ~/.bash_aliases
. "$HOME/.cargo/env"
