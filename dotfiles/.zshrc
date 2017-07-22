HISTFILE=~/.local/share/zsh/histfile
if  [[ ! -e $HISTFILE  ]]; then
        mkdir -p ~/.local/share/zsh
        touch ~/.local/share/zsh/histfile
fi
HISTSIZE=5000
SAVEHIST=10000

source ~/.zsh/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle jump
antigen bundle emacs

antigen apply

antigen theme https://gist.github.com/alde/cd137ce887d81505f574706850164de1 alde


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

source ~/.zsh/alias.zsh
source ~/.zsh/rainbow.zsh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LESS=-R
export GOPATH=$HOME/git/gocode
export PATH=$HOME/.gem/ruby/2.0.0/bin:$HOME/bin:/usr/local/bin:$PATH:$GOPATH/bin:$HOME/.rvm/bin:/usr/local/go/bin
export TERM=xterm-256color
export REQUESTS_CA_BUNDLE=/usr/local/etc/openssl/cert.pem
export PATH=$PATH:$HOME/.minimesos/bin



[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
