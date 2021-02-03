function! g:ReturnHighlightTerm(group, term)
   let output = execute('hi ' . a:group)

   return matchstr(output, a:term.'=\zs\S*')
endfunction

function! s:setHi(group, item, value)
    if a:value != ""
        exec "hi " . a:group . " " . a:item . "=" . a:value
    endif
endfunction

function! g:Hi(group, guifg, guibg, attr)
    " call s:setHi(a:group, 'guifg', g:ReturnHighlightTerm(a:group, 'guifg'))
    " call s:setHi(a:group, 'guibg', g:ReturnHighlightTerm(a:group, 'guibg'))
    if a:guifg != ""
        call s:setHi(a:group, 'guifg', a:guifg)
    endif
    if a:guibg != ""
        call s:setHi(a:group, 'guibg', a:guibg)
    endif
    if a:attr != ""
        call s:setHi(a:group, 'gui', a:attr)
    endif
endfunction


" check if last inserted char is a backspace (used by coc pmenu)
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use tab to navigate snippet placeholders
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use enter to accept snippet expansion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<CR>"
