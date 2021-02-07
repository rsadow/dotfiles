#!/bin/bash

DOTFILES="$HOME/.dotfiles"

success=`tput setaf 3`
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

run_cmd() {
    print $cmd "   > $1"
    if [ $DEBUG -eq 1 ]; then
        $@
    else
        $@ &> /dev/null
    fi
    if [ $? -ne 0 ]; then
        print "$error" "   > $1: failed"
        exit
    fi
}

install_cmd() {
    if ! command -v $1 &> /dev/null; then
        print $cmd " $1: installing"
        $2
    fi
    print $success " $1: installed"
}


print "$cmd" "+install programs"

initialize() {
    run_cmd "sudo -E apt -y update"
}

install_git() {
    run_cmd "sudo -E apt-get -y install git"
}

install_lazygit() {
    run_cmd "sudo -E add-apt-repository -y ppa:lazygit-team/release"
    run_cmd "sudo -E apt-get -y update"
    run_cmd "sudo -E apt-get -y install lazygit"
}

install_tmux() {
    VERSION=3.1c
    run_cmd "sudo -E apt install automake build-essential pkg-config libevent-dev libncurses-dev -y"
    run_cmd "wget https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz"
    run_cmd "tar xf tmux-${VERSION}.tar.gz"
    run_cmd "rm tmux-${VERSION}.tar.gz"
    run_cmd "cd tmux-${VERSION}"
    run_cmd "./configure"
    run_cmd "make -j$(nproc)"
    run_cmd "sudo make install"
    run_cmd "cd .."
    run_cmd "sudo rm -rf /usr/local/src/tmux-*"
    run_cmd "sudo mv tmux-${VERSION} /usr/local/src"

    # plugin manager
    run_cmd "git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm"

    # .tmux.conf symlink
    ln -sf "$DOTFILES"/tmux/tmux.conf "$HOME"/.tmux.conf
}

initialize

install_cmd "git" install_git
install_cmd "lazygit" install_lazygit
install_cmd "tmux" install_tmux

print "$cmd" "+setup symlinks"

#setup nvim
ln -sf "$DOTFILES"/nvim/init.vim "$HOME"/.config/nvim/init.vim
ln -sf "$DOTFILES"/nvim/coc-settings.json "$HOME"/.config/nvim/coc-settings.json
ln -sf "$DOTFILES"/nvim/config "$HOME"/.config/nvim/config


