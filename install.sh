#!/bin/bash

DOTFILES="$HOME/.dotfiles"

success=`tput setaf 2`
error=`tput setaf 1`
cmd=`tput setaf 6`

DEBUG=0

while test $# -gt 0; do
    case "$1" in
        -d)
            DEBUG=1
            shift
            ;;
        *)
            break
            ;;
    esac
done


print() {
    echo "$1$2$(tput sgr0)"
}

install_cmd() {
    if ! command -v $1 &> /dev/null; then
        print $cmd "- $1: installing"
        for var in "${@:2}";do
            if [ $DEBUG -eq 1 ]; then
                $var > /dev/null
            else
                $var &> /dev/null
            fi
            if [ $? -ne 0 ]; then
                print $error "- $1: failed"
                exit
            fi
        done
    fi
    print $success "- $1: installed"
}


print "$cmd" "+ install programs"

install_cmd "lazygit" \
    "sudo -E add-apt-repository -y ppa:lazygit-team/release" \
    "sudo -E apt-get -y update" \
    "sudo -E apt-get -y install lazygit" \

install_cmd "tmux" \
    "sudo -E apt-get -y install tmux" \

print "$cmd" "+ setup symlinks"

#setup nvim
ln -sf "$DOTFILES"/nvim/init.vim "$HOME"/.config/nvim/init.vim
ln -sf "$DOTFILES"/nvim/coc-settings.json "$HOME"/.config/nvim/coc-settings.json
ln -sf "$DOTFILES"/nvim/config "$HOME"/.config/nvim/config
#setup tmux
ln -sf "$DOTFILES"/tmux/tmux.conf "$HOME"/.tmux.conf

