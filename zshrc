# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' format 'Completing %d:'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt '%SAt %p: Hit TAB for more, or the character to insert%s'
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 1
zstyle ':completion:*' use-compctl false
zstyle :compinstall filename '/home/kevin/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt autocd extendedglob notify
bindkey -v
# End of lines configured by zsh-newuser-install

# Lines added manually:
##prompt settings
#copied and modified from prompt_bigfade
setprompt() {
local fadebar='blue'
local userhost='white'
local date='white'
local cwd='yellow'
local vcs='white'

local -A schars
autoload -Uz prompt_special_chars
prompt_special_chars

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
#zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats "%B%F{$vcs}(%s)-[%a] %c%u "
zstyle ':vcs_info:*' formats       "%B%F{$vcs}(%s)-[%b] %c%u "
zstyle ':vcs_info:*' stagedstr     "%F{green}+%f"
zstyle ':vcs_info:*' unstagedstr   "%F{green}!%f"

#zstyle ':vcs_info:(sv[nk]|bzr):*' branchformat "%b:%r"
precmd() { vcs_info }

PS1="%B%F{$fadebar}$schars[333]$schars[262]$schars[261]$schars[260]%B%F{$userhost}%K{$fadebar}%n@%m%b%k%f%F{$fadebar}%K{black}$schars[260]$schars[261]$schars[262]$schars[333]%b%f%k%F{$fadebar}%K{black}$schars[333]$schars[262]$schars[261]$schars[260]%B%F{$date}%K{black} %D{%a %b %d} %D{%H:%M:%S} %B%F{$cwd}%K{black}%d%b%f%k "'${vcs_info_msg_0_}'"%b 
> "
PS2="%B%F{$fadebar}$schars[333]$schars[262]$schars[261]$schars[260]%b%F{$fadebar}%K{black}$schars[260]$schars[261]$schars[262]$schars[333]%F{$fadebar}%K{black}$schars[333]$schars[262]$schars[261]$schars[260]%B%F{$fadebar}>%b%f%k "

#prompt_opts=(cr subst percent)
}

setopt INC_APPEND_HISTORY PROMPT_SUBST HIST_IGNORE_ALL_DUPS
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

# some more ls aliases
alias ll='ls -lh'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -lhtr'
export EDITOR='vim'
alias g='git'
alias gst='git status'
alias glog='git log --oneline --decorate --color --graph'

zhistorysearch=$HOME/.dotfiles/zsh-history-substring-search/zsh-history-substring-search.zsh
zsyntaxhighlight=$HOME/.dotfiles/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#local settings from ~/.shell_local
[ -f $HOME/.shell_local ] && . $HOME/.shell_local

setprompt
source $zhistorysearch
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
source $zsyntaxhighlight
