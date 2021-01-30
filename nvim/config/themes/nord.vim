colorscheme nord

call g:Hi('Comment', '', '', 'italic')
call g:Hi('SpellBad', 'NONE', '', 'bold,undercurl')
call g:Hi('EndOfBuffer', g:rs_custom_bg, '', '')
call g:Hi('Normal', '', g:rs_custom_bg, 'NONE' )
call g:Hi('FoldColumn', '', g:rs_custom_bg, '')
call g:Hi('SignColumn', '', g:rs_custom_bg, '')
call g:Hi('VertSplit', '', g:rs_custom_bg, '')

silent! call g:Hi('LspCxxHlSymClass', g:terminal_color_4, '', 'bold')
silent! call g:Hi('LspCxxHlSymNamespace', g:terminal_color_14, '', '')
