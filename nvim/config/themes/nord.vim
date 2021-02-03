colorscheme nord
" let s:custom_bg = '#282d37'
let s:custom_bg =  ReturnHighlightTerm('Normal', 'guibg')

call g:Hi('EndOfBuffer', s:custom_bg, '', '')
call g:Hi('Comment', '', '', 'italic')
call g:Hi('SpellBad', 'NONE', '', 'bold,undercurl')
call g:Hi('Normal', '', s:custom_bg, 'NONE' )
call g:Hi('VertSplit', '', s:custom_bg, '')
call g:Hi('SignColumn', '', s:custom_bg, '')

silent! call g:Hi('LspCxxHlSymClass', g:terminal_color_4, '', 'bold')
silent! call g:Hi('LspCxxHlSymNamespace', g:terminal_color_14, '', '')
