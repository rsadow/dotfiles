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
    call s:setHi(a:group, 'guifg', g:ReturnHighlightTerm(a:group, 'guifg'))
    call s:setHi(a:group, 'guibg', g:ReturnHighlightTerm(a:group, 'guibg'))
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
