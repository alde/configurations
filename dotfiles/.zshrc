source ~/.zsh/antigen.zsh

antigen use oh-my-zsh
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle jump

antigen theme https://github.com/halfo/lambda-mod-zsh-theme/ lambda-mod

antigen apply

bindkey "^[[6~" end-of-history # Page up
bindkey "^[[5~" insert-last-word # Page down

source ~/.zsh/alias.zsh

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export LESS=-R
export GOPATH=$HOME/git/gocode
export PATH=$HOME/.gem/ruby/2.0.0/bin:$HOME/bin:/usr/local/bin:$PATH:$GOPATH/bin:$HOME/.rvm/bin
export TERM=screen-256color

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -f /usr/bin/aws_zsh_completer.sh && source /usr/bin/aws_zsh_completer.sh
test -f /usr/local/bin/aws_zsh_completer.sh && source /usr/local/bin/aws_zsh_completer.sh
