
" toggle comments for selected lines

function! Add_Comments()
  s/^\(.*\)$/#\1/
endfunction

function! Remove_Comments()
  s/^\(\\s\)*#/\1/
endfunction


map <leader>c :call Add_Comments()<CR>
map <leader>uc :call Remove_Comments()<CR>

