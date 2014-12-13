HISTFILE=~/.local/share/zsh/histfile
if  [[ ! -e $HISTFILE ]]; then
        mkdir -p ~/.local/share/zsh
        touch ~/.local/share/zsh/histfile
fi
HISTSIZE=5000
SAVEHIST=10000

zstyle ':chpwd:profiles:/home/dybeck/git/work(|/|/*)'       profile work
zstyle ':chpwd:profiles:/home/dybeck/git/private(|/|/*)'    profile private
zstyle ':chpwd:profiles:/home/dybeck/git/external(|/|/*)'    profile private

# configuration for profile 'private':
chpwd_profile_private()
{
  [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1

  export GIT_AUTHOR_EMAIL="r.dybeck@gmail.com"
  export GIT_COMMITTER_EMAIL="r.dybeck@gmail.com"

  print "chpwd(): Switching to profile: $profile ($GIT_AUTHOR_EMAIL)"
}

# configuration for profile 'work':
chpwd_profile_work()
{
  [[ ${profile} == ${CHPWD_PROFILE} ]] && return 1

  export GIT_AUTHOR_EMAIL="rickard.dybeck@klarna.com"
  export GIT_COMMITTER_EMAIL="rickard.dybeck@klarna.com"

  print "chpwd(): Switching to profile: $profile ($GIT_AUTHOR_EMAIL)"
}

CHPWD_PROFILE='work'
function chpwd_profiles() {
    local -x profile

    zstyle -s ":chpwd:profiles:${PWD}" profile profile || profile='work'
    if (( ${+functions[chpwd_profile_$profile]} )) ; then
        chpwd_profile_${profile}
    fi

    CHPWD_PROFILE="${profile}"
    return 0
}
chpwd_functions=( ${chpwd_functions} chpwd_profiles )
chpwd_profile_work


e() { nohup emacsclient --alternate-editor="emacs" "$@" > /dev/null 2>&1 & }

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
#eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
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

autoload -U compinit promptinit
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
PROMPT="%{$fg[red]%}╭─${path_p}%{$fg[red]%} ─ ${op}${username}${host}${cp}
%{$fg[red]%}╰─${op}%T${cp}%{$fg[blue]%}»%{$reset_color%} "
### Right prompt
RPS1='%{$reset_color%}%F{red}[%F{yellow}${CHPWD_PROFILE}%F{red}] %{$reset_color%}${vcs_info_msg_0_}'

bindkey "^[[6~" end-of-history # Page up
bindkey "^[[5~" insert-last-word # Page down

export PATH=$HOME/bin:$PATH
export UZBL_DOWNLOAD_DIR=$HOME/Downloads
export GREP_OPTIONS='--color=auto'
export LESS=-R
export STATICU=rickard.dybeck
export CRACKLIB_DICTPATH="/usr/lib/cracklib_dict"

_myos="$(uname)"
case "$(uname)" in
    Darwin)
        alias ll='ls -lahG'
        alias ls='ls -G'
        ;;
    *)
        alias ll='ls -lah --color=auto'
        alias ls='ls --color=auto'
        alias ack='ack-grep'
        ;;
esac

alias diff='colordiff'
alias s='sublime'
alias cs='phpcs --standard=PEAR'
alias yum='sudo yum -y'
alias ta='tmux attach -t'
alias tn='tmux new -s'
alias make='make -j16 -s'
alias ..="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias be='bundle exec'


if [[ "$TERM" != emacs ]]; then
[[ -z "$terminfo[kdch1]" ]] || bindkey -M emacs "$terminfo[kdch1]" delete-char
[[ -z "$terminfo[khome]" ]] || bindkey -M emacs "$terminfo[khome]" beginning-of-line
[[ -z "$terminfo[kend]" ]] || bindkey -M emacs "$terminfo[kend]" end-of-line
[[ -z "$terminfo[kich1]" ]] || bindkey -M emacs "$terminfo[kich1]" overwrite-mode
[[ -z "$terminfo[kdch1]" ]] || bindkey -M vicmd "$terminfo[kdch1]" vi-delete-char
[[ -z "$terminfo[khome]" ]] || bindkey -M vicmd "$terminfo[khome]" vi-beginning-of-line
[[ -z "$terminfo[kend]" ]] || bindkey -M vicmd "$terminfo[kend]" vi-end-of-line
[[ -z "$terminfo[kich1]" ]] || bindkey -M vicmd "$terminfo[kich1]" overwrite-mode

[[ -z "$terminfo[cuu1]" ]] || bindkey -M viins "$terminfo[cuu1]" vi-up-line-or-history
[[ -z "$terminfo[cuf1]" ]] || bindkey -M viins "$terminfo[cuf1]" vi-forward-char
[[ -z "$terminfo[kcuu1]" ]] || bindkey -M viins "$terminfo[kcuu1]" vi-up-line-or-history
[[ -z "$terminfo[kcud1]" ]] || bindkey -M viins "$terminfo[kcud1]" vi-down-line-or-history
[[ -z "$terminfo[kcuf1]" ]] || bindkey -M viins "$terminfo[kcuf1]" vi-forward-char
[[ -z "$terminfo[kcub1]" ]] || bindkey -M viins "$terminfo[kcub1]" vi-backward-char

# ncurses fogyatekos
[[ "$terminfo[kcuu1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcuu1]/O/[}" vi-up-line-or-history
[[ "$terminfo[kcud1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcud1]/O/[}" vi-down-line-or-history
[[ "$terminfo[kcuf1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcuf1]/O/[}" vi-forward-char
[[ "$terminfo[kcub1]" == "^[O"* ]] && bindkey -M viins "${terminfo[kcub1]/O/[}" vi-backward-char
[[ "$terminfo[khome]" == "^[O"* ]] && bindkey -M viins "${terminfo[khome]/O/[}" beginning-of-line
[[ "$terminfo[kend]" == "^[O"* ]] && bindkey -M viins "${terminfo[kend]/O/[}" end-of-line
[[ "$terminfo[khome]" == "^[O"* ]] && bindkey -M emacs "${terminfo[khome]/O/[}" beginning-of-line
[[ "$terminfo[kend]" == "^[O"* ]] && bindkey -M emacs "${terminfo[kend]/O/[}" end-of-line
fi

function swap()
{
    tmpfile=$(mktemp $(dirname "$1")/XXXXXX)
    mv "$1" "$tmpfile" && mv "$2" "$1" &&  mv "$tmpfile" "$2"
}

export PATH=$HOME/git/orchid/bin:/usr/local/bin:$PATH:$HOME/.rvm/bin:$HOME/.gem/ruby/2.0.0/bin # Add RVM to PATH for scripting
source ~/.profile