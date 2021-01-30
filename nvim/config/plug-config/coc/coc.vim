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

" == FUNCTION ==========================================

" coc completion popup
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" show docs on things with K
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" == COMMANDS ===========================================

au CursorHold * silent call CocActionAsync('highlight') " highlight match on cursor hold

" format with available file format formatter
command! -nargs=0 Format :call CocAction('format')

" organize imports
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" close if coc-explorer is last buffer
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif

" == EXTENSIONS ===========================================================


" == MAPPINGS =============================================================

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

" clang jump beetwen heder/source
nmap <leader>jh :CocCommand clangd.switchSourceHeader<CR>

" other coc actions
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <leader>a :CocCommand actions.open<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

" coc-explorer
nnoremap <leader>e :CocCommand explorer<CR>
