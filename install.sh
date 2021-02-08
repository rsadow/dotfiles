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

    if [ $# -eq 3 ]; then
        print $cmd " $1: post-install"
        $3
    fi
}

symlink_cmd() {
    if [ ! -L $2 ]; then
        ln -sf $1 $2
        print $cmd "   > $2"
    else
        print $success " $2: installed"
    fi
}


print "$cmd" "+install programs"

initialize() {
    run_cmd "sudo -E apt -y update"
}

install_zsh() {
    run_cmd "sudo -E apt-get -y install zsh"

    if [ ! -d $HOME/.zgen/.git ]; then
        run_cmd "git clone https://github.com/tarjoilija/zgen.git ${HOME}/.zgen"
    fi
}

install_git() {
    run_cmd "sudo -E apt-get -y install git"
}

install_lazygit() {
    run_cmd "sudo -E add-apt-repository -y ppa:lazygit-team/release"
    run_cmd "sudo -E apt-get -y update"
    run_cmd "sudo -E apt-get -y install lazygit"
}

install_neovim() {
    run_cmd "sudo -E add-apt-repository -y ppa:neovim-ppa/stable"
    run_cmd "sudo -E apt-get -y update"
    run_cmd "sudo -E apt-get -y install neovim"
}

post_install_neovim() {
    NEOVIM_CONFIG="$HOME/.config/nvim"
    if [ ! -e $NEOVIM_CONFIG ]; then
        run_cmd "mkdir -p $NEOVIM_CONFIG"
    fi

    symlink_cmd "$DOTFILES"/nvim/init.vim "$HOME"/.config/nvim/init.vim
    symlink_cmd "$DOTFILES"/nvim/coc-settings.json "$HOME"/.config/nvim/coc-settings.json
    symlink_cmd "$DOTFILES"/nvim/config "$HOME"/.config/nvim/config
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

}


# initialize

install_cmd "zsh" install_zsh
install_cmd "git" install_git
install_cmd "lazygit" install_lazygit
install_cmd "tmux" install_tmux
install_cmd "nvim" install_neovim post_install_neovim

print "$cmd" "+setup symlinks"

#setup zsh
symlink_cmd "$DOTFILES"/zsh/.zshrc "$HOME"/.zshrc

# .tmux.conf symlink
symlink_cmd "$DOTFILES"/tmux/tmux.conf "$HOME"/.tmux.conf
