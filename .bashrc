# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
alias clip=clip.exe
# alias vim=nvim
# alias vi=nvim
# alias python=/usr/bin/python3
alias python3=/usr/bin/python3
# alias python3=/home/linuxbrew/.linuxbrew/bin/python3
alias setprogress='echo -ne "\033]9;4;1;50\a"'
alias ghe="/home/linuxbrew/.linuxbrew/bin/gh copilot explain"
alias ghs="/home/linuxbrew/.linuxbrew/bin/gh copilot suggest"
alias lzgt="/home/linuxbrew/.linuxbrew/bin/lazygit"
alias lzd="/home/linuxbrew/.linuxbrew/bin/lazydocker"
alias clip='/home/linuxbrew/.linuxbrew/bin/xclip -selection clipboard'
alias cat='/home/linuxbrew/.linuxbrew/bin/bat'
alias ta='/usr/bin/tmux a'
alias tns='/usr/bin/tmux new -s'
PS1='[${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]]\\$ '

# Color variables
RED='\[\033[0;31m\]'
GREEN='\[\033[1;32m\]'
YELLOW='\[\033[0;33m\]'
BLUE='\[\033[1;34m\]'
PURPLE='\[\033[0;35m\]'
CYAN='\[\033[0;36m\]'
WHITE='\[\033[0;37m\]'
RESET='\[\033[0m\]'

# Set the prompt
PS1="${GREEN}┌──[${GREEN}\u@\h${GREEN}]─[${BLUE}\w${GREEN}]\n${GREEN}└─${RESET}$ "
export PATH="$HOME/.local/bin:$PATH"
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init --path)"

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# eval "$(fzf --bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
 export PATH="$PATH:$HOME/.asdf/bin"
# . "$HOME/.asdf/asdf.sh"
# . "$HOME/.asdf/completions/asdf.bash"

# /usr/bin/echo -ne "\033]9;4;1;50\a"
# . "$HOME/.cargo/env"

eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS='--preview "bat --style=numbers --color=always --line-range :500 {}"'
export _ZO_DOCTOR=0
eval "$(/home/johnian/.local/bin/zoxide init --cmd cd bash)"
eval "$(starship init bash)"

# pnpm
export PNPM_HOME="/home/johnian/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
#
# Pomotimer based on BashBunni's pomodoro https://github.com/bashbunni/dotfiles/blob/main/zsh/.zshrc
# pnpm end
notify-send() { wsl-notify-send.exe --category $WSL_DISTRO_NAME "${@}"; }
declare -A pomo_options
pomo_options["Work"]="30"
pomo_options["Break"]="5"

pomodoro () {
        date
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
  val=$1
  /usr/local/bin/rdm.py
  echo $val | lolcat
  timer ${pomo_options["$val"]}m
  notify-send "$val session done"
  paplay /usr/share/sounds/freedesktop/stereo/alarm-clock-elapsed.oga
  /usr/local/bin/rdm.py
  date
  fi
}

alias wo="pomodoro Work "
alias br="pomodoro Break"

export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="$PATH:/usr/share/dotnet"
source /etc/profile.d/bash_completion.sh

# Docker format options
export DFORMAT="ID\t{{.ID}}\nNAME\t{{.Names}}\nIMAGE\t{{.Image}}\nPORTS\t{{.Ports}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.CreatedAt}}\nSTATUS\t{{.Status}}\n"

# for exa
alias l="exa --sort Name --icons"
alias ll="exa --sort Name --long --icons"
alias la="exa --sort Name --long --all --icons"
alias lr="exa --sort Name --long --recurse --icons"
alias lra="exa --sort Name --long --recurse --all --icons"
alias lt="exa --sort Name --long --tree --icons"
alias lta="exa --sort Name --long --tree --all --icons"

alias ls="exa --sort Name --icons -1"
. "/home/johnian/.deno/env"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
