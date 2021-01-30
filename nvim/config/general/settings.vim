set termguicolors                                       " Opaque Background
set mouse=a                                             " enable mouse scrolling
set clipboard+=unnamedplus                              " use system clipboard by default
set tabstop=4 softtabstop=4 shiftwidth=4 autoindent     " tab width
set expandtab smarttab                                  " tab key actions
set incsearch ignorecase smartcase hlsearch             " highlight text while searching
set list listchars=trail:»,tab:»-                       " use tab to navigate in list mode
set fillchars+=vert:\▏                                  " requires a patched nerd font (try FiraCode)
set wrap breakindent                                    " wrap long lines to the width set by tw
set encoding=utf-8                                      " text encoding
set number                                              " enable numbers on the left
set title                                               " tab title as file name
set noshowmode                                          " dont show current mode below statusline
set noshowcmd                                           " to get rid of display of last command
set conceallevel=2                                      " set this so we wont break indentation plugin
set splitright                                          " open vertical split to the right
set splitbelow                                          " open horizontal split to the bottom
set tw=120                                              " auto wrap lines that are longer than that
set emoji                                               " enable emojis
set history=1000                                        " history limit
set backspace=indent,eol,start                          " sensible backspacing
set undofile                                            " enable persistent undo
set undodir=/tmp                                        " undo temp file directory
set foldlevel=0                                         " open all folds by default
set inccommand=nosplit                                  " visual feedback while substituting
set showtabline=2                                       " always show tabline
set grepprg=rg\ --vimgrep                               " use rg as default grepper
set noswapfile

" performance tweaks
set nocursorline
set nocursorcolumn
set scrolljump=5
set lazyredraw
set redrawtime=10000
set synmaxcol=180
set re=1

" required by coc
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set updatetime=300
set shortmess+=c
set signcolumn=yes


"" built in plugins
let loaded_netrw = 0                                    " diable netew
let g:omni_sql_no_default_maps = 1                      " disable sql omni completion
let g:loaded_python_provider = 0
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0
let g:python3_host_prog = !empty($CUSTOM_PYTHON3) ? expand($CUSTOM_PYTHON3) : expand('/usr/bin/python3')


" COMMANDS

let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
au BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif
au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
au BufReadPost *                                        " Return to last edit position when opening files
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif



" == TEMP =============================================

" nnn
let g:nnn#layout = { 'window': { 'width': 0.3, 'height': 0.7 } }


" markdown preview
au FileType markdown nmap <leader>m :MarkdownPreview<CR>

" which-key
" nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
" let g:which_key_use_floating_win = 0
" " let g:which_key_disable_default_offset = 1

" highlight default link WhichKey          Number
" highlight default link WhichKeySeperator String
" highlight default link WhichKeyGroup     Identifier
" highlight default link WhichKeyDesc      Function

" " autocmd! FileType which_key
" " autocmd  FileType which_key set laststatus=0 noshowmode noruler
" "   \| autocmd BufLeave <buffer> set laststatus=2 noshowmode rule
" let g:which_key_map =  {}
" let g:which_key_sep = '→'
" set timeoutlen=500
