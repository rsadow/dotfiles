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
            \ --glob '!.clangd/**' --glob '!**/cmake-build**/**' --glob '!**/bin/**'"

" advanced grep(faster with preview)
function! RipgrepFzf(query, fullscreen)
    let command_fmt = "rg --column --line-number --no-heading --color=always --smart-case %s || true "
    let initial_command = printf(command_fmt, shellescape(a:query))
    let reload_command = printf(command_fmt, '{q}')
    let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command] }
    call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

" files in fzf
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--inline-info']}), <bang>0)

" advanced grep
command! -nargs=* -bang Rg call RipgrepFzf(<q-args>, <bang>0)

