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
