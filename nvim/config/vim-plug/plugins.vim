if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin(expand('~/.config/nvim/plugged'))
    Plug 'Jorengarenar/vim-MvVis'                           " move visual selection
    Plug 'arcticicestudio/nord-vim'
    Plug 'bagrat/vim-buffet'
    Plug 'bfrg/vim-cpp-modern'
    Plug 'christoomey/vim-tmux-navigator'                   " seamless vim and tmux navigation
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'gregsexton/MatchTag'                              " highlight matching html tags
    Plug 'hzchirs/vim-material'                             " material color themes
    Plug 'jackguo380/vim-lsp-cxx-highlight'
    Plug 'joshdick/onedark.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }     " fzf itself
    Plug 'junegunn/fzf.vim'                                 " fuzzy search integration
    Plug 'justinmk/vim-sneak'
    Plug 'luochen1990/rainbow'                              " rainbow parenthesis
    Plug 'mcchrish/nnn.vim'
    Plug 'mg979/vim-visual-multi'
    Plug 'mhinz/vim-signify'
    Plug 'mhinz/vim-startify'                               " cool start up screen
    Plug 'morhetz/gruvbox'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}         " LSP and more
    Plug 'psliwka/vim-smoothie'                             " some very smooth ass scrolling
    Plug 'ryanoasis/vim-devicons'                           " pretty icons everywhere
    Plug 'tomasiser/vim-code-dark'
    Plug 'tpope/vim-commentary'                             " better commenting
    Plug 'vim-airline/vim-airline'                          " airline status bar
    Plug 'voldikss/vim-floaterm'
    Plug 'tpope/vim-fugitive'
call plug#end()
