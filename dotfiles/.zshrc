HISTFILE=${HOME}/.local/share/zsh/histfile
if  [[ ! -e $HISTFILE  ]]; then
        mkdir -p ${HOME}/.local/share/zsh
        touch ${HOME}/.local/share/zsh/histfile
fi
HISTSIZE=5000
SAVEHIST=10000

source ${HOME}/.zsh/antigen.zsh

antigen use oh-my-zsh
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jump
antigen apply

fpath=(${HOME}/.zsh/completion $fpath)
autoload -Uz compinit && compinit -i

setopt append_history
setopt inc_append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt hist_no_functions
setopt no_hist_beep
setopt hist_save_no_dups
setopt no_share_history


bindkey "^[[6~" end-of-history # Page up
bindkey "^[[5~" insert-last-word # Page down

source ${HOME}/.zsh/z.zsh

export PYENV_ROOT="$HOME/.pyenv"
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESS=-R
export GOPATH=$HOME/git/gocode
export PATH=$HOME/bin:/usr/local/bin:$GOPATH/bin:/usr/local/go/bin:$PATH
export TERM=xterm-256color
export REQUESTS_CA_BUNDLE=/usr/local/etc/openssl/cert.pem
export GROOVY_HOME=/usr/local/opt/groovy/libexec

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/opt/google-cloud-sdk/path.zsh.inc" ]; then source "$HOME/opt/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/opt/google-cloud-sdk/completion.zsh.inc" ]; then source "$HOME/opt/google-cloud-sdk/completion.zsh.inc"; fi

if [ -f "${HOME}/.zsh/powerlevel9k/powerlevel9k.zsh-theme" ]; then source "${HOME}/.zsh/powerlevel9k/powerlevel9k.zsh-theme"; fi

if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if command -v hub 1>/dev/null 2>&1; then
  eval "$(hub alias -s)"
fi

if command -v colordiff 1>/dev/null 2>&1; then
  alias diff='colordiff'
fi

alias grep='grep --color=auto'
alias ta='tmux attach -t'
alias tn='tmux new -s'
