" let g:airline_theme='onedar '
let g:airline_skip_empty_sections = 1
let g:airline_section_warning = ''
let g:airline_section_x=''
let g:airline_section_c='[%{pathshorten(getcwd())}] %t'
let g:airline_section_z = airline#section#create(['%3p%% ', 'linenr', ':%c'])
let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 0
let g:airline#extensions#tabline#fnamemod = ':t'        " show only file name on tabs
let airline#extensions#coc#error_symbol = '✘:'
let airline#extensions#coc#warning_symbol = '⚠:'
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.dirty= ''

function! CondensedPath() abort
    if expand(':h') == '/'
        return '/' . expand('%:t')
    else
        return pathshorten(expand('%:h')) . '/' . expand('%:t')
    endif
endfunction
