function exists { which $1 &> /dev/null }

if exists ipython; then
        alias py=ipython
else
        alias py=python3
fi

if exists pygmentize; then
        alias kat='pygmentize -g'
fi

if exists colordiff; then
  alias diff='colordiff'
fi

alias grep='grep --color=auto'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias be='bundle exec'
alias j=jump

eval $(thefuck --alias)
eval "$(hub alias -s)"

# _myos="$(uname)"
# case "$(uname)" in
#         Darwin)
#                 alias ll='ls -lahG'
#                 alias ls='ls -G'
#                 ;;
#         *)
#                 alias ll='ls -lah --color=auto'
#                 alias ls='ls --color=auto'
#                 if hash ack-grep 2>/dev/null; then
#                         alias ack='ack-grep'
#                 fi
#                 ;;
# esac
