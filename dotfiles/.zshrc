HISTFILE=~/.local/share/zsh/histfile
if  [[ ! -e $HISTFILE ]]; then
        mkdir -p ~/.local/share/zsh
        touch ~/.local/share/zsh/histfile
fi
HISTSIZE=5000
SAVEHIST=10000

bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line

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
setopt promptsubst

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' stagedstr "+"
zstyle ':vcs_info:*' unstagedstr "!"
zstyle ':vcs_info:*' actionformats '%F{5}(%f%s%F{5})%F{3}-%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats       '%c%u%F{4}( %F{2}%b%f%F{4} ) %f%F{3}( %f%12.12i%F{3} )%f'

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*' special-dirs true
zstyle ':completion:*:*:git:*' user-commands fixup:'Create a fixup commit'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

autoload -Uz compinit && compinit -i
autoload -U promptinit
autoload -U colors
autoload -Uz vcs_info
compinit
promptinit


autoload colors zsh/terminfo
if [[ "$terminfo[colors]" -ge 8 ]]; then
        colors
fi
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE; do
        eval PR_$color='{%$terminfo[bold]$fg[${(L)color}]%}'
        eval PR_LIGHT_$color='{%$fg[${(L)color}]%}'
        (( count = $count + 1 ))
done
PR_NO_COLOR="{%$terminfo[sgr0]%}"

precmd() { vcs_info }

local op="%{$fg[red]%}( %{$reset_color%}"
local cp="%{$fg[red]%} )%{$reset_color%}"
local path_p="${op}%{$fg[cyan]%}%~${cp}"
local username="%{$fg[green]%}%n%{$reset_color%}"
local host="@%{$fg[yellow]%}%m${reset_color%}"
PROMPT='%{$fg[red]%}╭─${op}%T${cp} %{$fg[red]%}${op}${username}${host}${cp} %{$reset_color%}${vcs_info_msg_0_}
%{$fg[red]%}╰─${path_p}%{$fg[red]%} %{$fg[blue]%}»%{$reset_color%} '

bindkey "^[[6~" end-of-history # Page up
bindkey "^[[5~" insert-last-word # Page down

_myos="$(uname)"
case "$(uname)" in
        Darwin)
                alias ll='ls -lahG'
                alias ls='ls -G'
                ;;
        *)
                alias ll='ls -lah --color=auto'
                alias ls='ls --color=auto'
                if hash ack-grep 2>/dev/null; then
                        alias ack='ack-grep'
                fi
                ;;
esac

alias grep='grep --color=auto'
alias diff='colordiff'
alias s='reattach-to-user-namespace sublime'
alias yum='sudo yum -y'
alias dnf='sudo dnf -y'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias be='bundle exec'
alias j=jump

function exists { which $1 &> /dev/null }

if exists ipython; then
        alias py=ipython
else
        alias py=python3
fi

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export SCALA_HOME=/opt/scala-2.12.0-M1
export LESS=-R
export GOPATH=$HOME/git/gocode
export PATH=$HOME/.gem/ruby/2.0.0/bin:$HOME/bin:/usr/local/bin::$SCALA_HOME/bin:$PATH
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export TERM=screen-256color

source ~/.profile

test -f /usr/bin/aws_zsh_completer.sh && source /usr/bin/aws_zsh_completer.sh
test -f /usr/local/bin/aws_zsh_completer.sh && source /usr/local/bin/aws_zsh_completer.sh

source $HOME/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $HOME/lib/jump.plugin.zsh

fpath=(/usr/local/share/zsh-completions $fpath)
fpath=(~/.zsh/completion $fpath)
