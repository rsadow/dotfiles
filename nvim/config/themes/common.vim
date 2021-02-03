
function! s:SetCustomHi()
    let common_bg = ReturnHighlightTerm('Normal', 'guibg')
    call g:Hi('EndOfBuffer', common_bg, '', '')
    call g:Hi('VertSplit', '', common_bg, 'NONE')
endfunction

au ColorScheme * call s:SetCustomHi()
