" == SETTINGS ===============================================

let g:floaterm_gitcommit='floaterm'
let g:floaterm_autoinsert=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" == MAPPINGS ===============================================

nmap <leader>tg :FloatermNew lazygit<CR>
nmap <leader>tt :FloatermNew --wintype=normal --height=16<CR>
nnoremap <silent> <F8> :FloatermToggle<CR>
