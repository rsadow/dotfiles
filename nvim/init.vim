"
"
" _____ __   _ _____ _______   _    _ _____ _______
"   |   | \  |   |      |       \  /    |   |  |  |
" __|__ |  \_| __|__    |    .   \/   __|__ |  |  |
"
"
"
sourc $HOME/.config/nvim/config/vim-plug/plugins.vim

sourc $HOME/.config/nvim/config/general/settings.vim
sourc $HOME/.config/nvim/config/general/functions.vim

sourc $HOME/.config/nvim/config/themes/common.vim
sourc $HOME/.config/nvim/config/themes/nord.vim

sourc $HOME/.config/nvim/config/plug-config/vim-airline.vim
sourc $HOME/.config/nvim/config/plug-config/vim-startify.vim
sourc $HOME/.config/nvim/config/plug-config/fzf.vim
sourc $HOME/.config/nvim/config/plug-config/vim-signify.vim

"" coc

" Navigate snippet placeholders using tab
let g:coc_snippet_next = '<Tab>'
let g:coc_snippet_prev = '<S-Tab>'

" list of the extensions to make sure are always installed
let g:coc_global_extensions = [
            \'coc-yank',
            \'coc-pairs',
            \'coc-json',
            \'coc-actions',
            \'coc-css',
            \'coc-html',
            \'coc-tsserver',
            \'coc-yaml',
            \'coc-lists',
            \'coc-snippets',
            \'coc-clangd',
            \'coc-prettier',
            \'coc-xml',
            \'coc-syntax',
            \'coc-marketplace',
            \'coc-highlight',
            \'coc-explorer',
            \'coc-pyright'
            \]


" tmux navigator
let g:tmux_navigator_no_mappings = 1


" nnn
let g:nnn#layout = { 'window': { 'width': 0.3, 'height': 0.7 } }



let g:cpp_attributes_highlight = 1
let g:cpp_member_highlight = 1
let g:cpp_simple_highlight = 1


"}}}

" ======================== Commands ============================= "{{{

au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving
au CursorHold * silent call CocActionAsync('highlight') " highlight match on cursor hold

" enable spell only if file type is normal text
let spellable = ['markdown', 'gitcommit', 'txt', 'text', 'liquid', 'rst']
autocmd BufEnter * if index(spellable, &ft) < 0 | set nospell | else | set spell | endif


" coc completion popup
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" startify if no passed argument or all buffers are closed
augroup noargs
    " startify when there is no open buffer left
    autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

    " open startify on start if no argument was passed
    autocmd VimEnter * if argc() == 0 | Startify | endif
augroup END

" fzf if passed argument is a folder
augroup folderarg
    " change working directory to passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0])  | endif

    " start startify (fallback if fzf is closed)
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | Startify  | endif

    " start fzf on passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'Files ' fnameescape(argv()[0]) | endif
augroup END

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

" format with available file format formatter
command! -nargs=0 Format :call CocAction('format')

" organize imports
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')


"}}}

" ================== Custom Functions ===================== "{{{


" startify file icons
function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction

" check if last inserted char is a backspace (used by coc pmenu)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

"}}}

" ======================== Custom Mappings ====================== "{{{

"" the essentials
let mapleader="\<Space>"
nnoremap ; :
nmap \ <leader>q
map <F6> :Startify <CR>
nmap <leader>r :so ~/.config/nvim/init.vim<CR>
nmap <leader>q :bd<CR>
nmap <leader>w :w<CR>
map <leader>s :Format<CR>
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>
noremap <leader>n :PlugInstall<CR>
noremap <C-q> :q<CR>

" new line in normal mode and back
map <Enter> o<ESC>
map <S-Enter> O<ESC>

" use a different register for delete and paste
nnoremap d "_d
vnoremap d "_d
vnoremap p "_dP
nnoremap x "_x

" emulate windows copy, cut behavior
vnoremap <LeftRelease> "+y<LeftRelease>
vnoremap <C-c> "+y<CR>
vnoremap <C-x> "+d<CR>

" switch between splits using ctrl + {h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" disable hl with 2 esc
noremap <silent><esc> <esc>:noh<CR><esc>

" trim white spaces
nnoremap <F2> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" markdown preview
au FileType markdown nmap <leader>m :MarkdownPreview<CR>

"" FZF
nnoremap <silent> <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>c :Commands<CR>
" nmap <leader>t :BTags<CR>
nmap <leader>/ :Rg<CR>
nmap <C-a> :Rg <C-R><C-W><CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>sh :History/<CR>

" show mapping on all modes with F1
nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)

"" coc

" use tab to navigate snippet placeholders
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"

" multi cursor shortcuts
" nmap <silent> <C-a> <Plug>(coc-cursors-word)
" xmap <silent> <C-a> <Plug>(coc-cursors-range)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" other stuff
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>o :OR <CR>

" jump stuff
nmap <leader>jd <Plug>(coc-definition)
nmap <leader>jy <Plug>(coc-type-definition)
nmap <leader>ji <Plug>(coc-implementation)
nmap <leader>jr <Plug>(coc-references)

nmap <leader>jh :CocCommand clangd.switchSourceHeader<CR>

" other coc actions
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <leader>a :CocCommand actions.open<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>


" fugitive mappings
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>gb :Gblame<CR>

" tmux navigator
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>

" nnn mappings
nnoremap <leader>e :CocCommand explorer<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>

function! s:MpcPrev(a)
endfunction

command! -bang -nargs=* SVNBlame
            \ call fzf#run(fzf#wrap('svnblame',
            \ {'source':'svn blame ' . expand('%:p'),
            \ 'sink': function('s:MpcPrev')}, 0))

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

nmap <leader>tg :FloatermNew lazygit<CR>
nmap <leader>tt :FloatermNew --wintype=normal --height=16<CR>
nnoremap <silent> <F8> :FloatermToggle<CR>


let g:sneak#label = 1
let g:sneak#prompt = '❯ '
highlight! link Sneak Search
highlight! link SneakScope WarningMsg

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

autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
"}}}

