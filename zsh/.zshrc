source "${HOME}/.zgen/zgen.zsh"

if ! zgen saved; then

    export ZGEN_PREZTO_LOAD_DEFAULT=0
    zgen prezto '*:*' color 'yes'
    zgen prezto autosuggestions color 'yes'
    zgen prezto prompt theme 'pure'
    zgen prezto history-substring-search:color found 'green'

    zgen prezto

    zgen prezto utility
    zgen prezto history
    zgen prezto completion
    zgen prezto syntax-highlighting
    zgen prezto history-substring-search
    zgen prezto directory
    zgen prezto environment
    zgen prezto terminal
    zgen prezto autosuggestions
    zgen prezto prompt

    # zgen load denysdovhan/spaceship-prompt spaceship

    zgen save
fi

#source $HOME/.config/antigen/antigen.zsh

#antigen bundle zsh-users/zsh-syntax-highlighting
#antigen bundle zsh-users/zsh-autosuggestions
#antigen bundle zsh-users/zsh-completions

#antigen theme denysdovhan/spaceship-prompt

#SPACESHIP_USER_SHOW=always

#antigen apply


#setopt AUTO_CD              # Auto changes to a directory without typing cd.
#setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
#setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
#setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.
#setopt PUSHD_TO_HOME        # Push to home directory when no argument is given.
#setopt CDABLE_VARS          # Change directory to a path stored in a variable.
#setopt MULTIOS              # Write to multiple descriptors.
#setopt EXTENDED_GLOB        # Use extended globbing syntax.
#unsetopt CLOBBER            # Do not overwrite existing files with > and >>.
#                            # Use >! and >>! to bypass.

##
## HISTORY
##
#setopt BANG_HIST                 # Treat the '!' character specially during expansion.
#setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
#setopt SHARE_HISTORY             # Share history between all sessions.
#setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
#setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
#setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
#setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
#setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
#setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
#setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

#HISTFILE="${HISTFILE:-${ZDOTDIR:-$HOME}/.zhistory}"  # The path to the history file.
#HISTSIZE=10000                   # The maximum number of events to save in the internal history.
#SAVEHIST=10000

#autoload -U colors && colors

#setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
#setopt ALWAYS_TO_END       # Move cursor to the end of a completed word.
#setopt PATH_DIRS           # Perform path search even on command names with slashes.
#setopt AUTO_MENU           # Show completion menu on a successive tab press.
#setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
#setopt AUTO_PARAM_SLASH    # If completed parameter is a directory, add a trailing slash.
#setopt EXTENDED_GLOB       # Needed for file modification glob modifiers with compinit
#unsetopt MENU_COMPLETE     # Do not autoselect the first completion entry.
#unsetopt FLOW_CONTROL      # Disable start/stop characters in shell editor.

#zstyle ':completion:*:*:*:*:*' menu select
#zstyle ':completion:*:matches' group 'yes'
#zstyle ':completion:*:options' description 'yes'
#zstyle ':completion:*:options' auto-description '%d'
#zstyle ':completion:*:corrections' format  ' %F{green}-- %d (errors: %e) --%f'
#zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
#zstyle ':completion:*:messages' format ' %F{purple}-- %d --%f'
#zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
#zstyle ':completion:*:default' list-prompt '%S%M matches%s'
#zstyle ':completion:*' format  '%F{yellow}-- %d --%f'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' verbose yes

#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
#zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
#zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
#zstyle ':completion:*' squeeze-slashes true

## autoload -U compinit
## zstyle ':completion:*' menu select
## compinit
## _comp_options+=(globdots)
#unset LS_COLORS
#if [[ -z "$LS_COLORS" ]]; then
#    export LS_COLORS='ow=35:di=35:or=31'
#fi

#if [[ -z "$LSCOLORS" ]]; then
#    export LSCOLORS='exfxcxdxbxGxDxabagacad'
#fi

alias ll='ls -lah'
