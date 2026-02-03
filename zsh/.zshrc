export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"

CASE_SENSITIVE="true"

zstyle ':omz:update' mode reminder  

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
eval "$(zoxide init zsh)"

# History settings
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# Bind keys
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Aliases
alias cd="z"
alias ls="eza --icons=always"
alias py="python"

# Functions
function venv {
  source venv/bin/activate
}

function exportEnv {
  export $(grep -v '^#' $1 | xargs)
}

source <(fzf --zsh)
export PATH=$PATH:$HOME/go/bin
