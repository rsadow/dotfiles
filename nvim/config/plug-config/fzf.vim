let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.90, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'border': 'rounded' } }
let g:fzf_tags_command = 'ctags -R'
let g:fzf_preview_use_dev_icons = 1

let $FZF_DEFAULT_OPTS ="--layout=reverse --inline-info --preview-window=up:70% --prompt='∼ ' --pointer='▶' --marker='✓'
    \ --color='border:". g:terminal_color_0 . ",bg+:". g:rs_custom_bg . ",pointer:". g:terminal_color_9 ."'"
let $FZF_DEFAULT_COMMAND = "rg --files --hidden
            \ --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea'
            \ --glob '!.clangd/**' --glob '!**/cmake-build**/**' --glob '!bin/**'"

" == FUNCTIONS ====================================================

" advanced grep(faster with preview)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = "rg --column --line-number --no-heading --glob '!bin/**' --color=always --smart-case %s || true "
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command] }
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction


" == COMMANDS =====================================================

" fzf if passed argument is a folder
augroup folderarg
    " change working directory to passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'cd' fnameescape(argv()[0])  | endif

    " start startify (fallback if fzf is closed)
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | Startify  | endif

    " start fzf on passed directory
    autocmd VimEnter * if argc() != 0 && isdirectory(argv()[0]) | execute 'Files ' fnameescape(argv()[0]) | endif
augroup END


" files in fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" advanced grep
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)


" == MAPPINGS ======================================================

nnoremap <silent> <leader>f :Files<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>c :Commands<CR>
nmap <leader>/ :Rg<CR>
nmap <C-a> :Rg <C-R><C-W><CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>sh :History/<CR>

nmap <F1> <plug>(fzf-maps-n)
imap <F1> <plug>(fzf-maps-i)
vmap <F1> <plug>(fzf-maps-x)
