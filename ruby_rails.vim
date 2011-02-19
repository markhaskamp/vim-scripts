
" :map :rt :call Rake_This_Test()<CR>
"  cursor must be located on test name in its test file
function! Rake_This_Test()
  :normal lBvE"ay
  let rake_cmd =  '!clear; ruby -Ilib:test ' . @% . ' -n ' . @a
  exec rake_cmd
endfunction

" :map :rf :call Rake_This_File()<CR>
" cursor must be in file
function! Rake_This_File()
  " :normal lBvE"ay
  let rake_cmd =  '!clear; ruby -Ilib:test ' . @%
  exec rake_cmd
endfunction
