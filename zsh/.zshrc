source $HOME/.config/antigen/antigen.zsh

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions

antigen theme denysdovhan/spaceship-prompt

SPACESHIP_USER_SHOW=always

antigen apply

if [[ -z "$LSCOLORS" ]]; then
    export LSCOLORS='exfxcxdxbxGxDxabagacad'
fi
