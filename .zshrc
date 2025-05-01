# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="gnzh"

CASE_SENSITIVE="true"

zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(git)

source $ZSH/oh-my-zsh.sh

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

export NVM_DIR="$HOME/.nvm"
[ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

source /opt/homebrew/share/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
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
  echo 'DB_NAME': $DB_NAME
  echo 'DB_HOST': $DB_HOST
}

function printDBEnv {
  echo 'DB_NAME': $DB_NAME
  echo 'DB_HOST': $DB_HOST
  echo 'DB_USER': $DB_USER
  echo 'DB_PASS': $DB_PASS
  echo 'DB_PORT': $DB_PORT
}

function printEMPEnv {
  echo 'DB__NAME': $DB__NAME
  echo 'DB__HOST': $DB__HOST
  echo 'DB__USER': $DB__USER
  echo 'DB__PASS': $DB__PASS
  echo 'DB__PORT': $DB__PORT
}

source <(fzf --zsh)
export PATH=$PATH:$HOME/go/bin
