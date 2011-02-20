
" :map :rt :call Rake_This_Test()<CR>
"  cursor must be located on test name in its test file
function! Rake_This_Test()
  let word = Get_WORD_under_cursor()
  if Is_test_name(word)
    let test_name_suffix = ' -n ' .  word
  else
    let word = Find_previous_test_name()
    echo 'word: [' . word . ']'
"    if (word == 0)
"      let test_name_suffix = ''
"    else
      let test_name_suffix = ' -n ' . word
"    endif
  endif
  let rake_cmd =  '!clear; ruby -Ilib:test ' . @% . test_name_suffix
  " echo rake_cmd
  exec rake_cmd
endfunction

" :map :rf :call Rake_This_File()<CR>
" cursor must be in file
function! Rake_This_File()
  let rake_cmd =  '!clear; ruby -Ilib:test ' . @%
  exec rake_cmd
endfunction

function! Get_WORD_under_cursor()
  :normal lBvE"ay
  return @a
endfunction

function! Is_test_name(word)
  return (a:word =~ 'test_')
endfunction

function! Find_previous_test_name()
  let result = search('test_', 'beW')
  if (result > 0)
    return Get_WORD_under_cursor()
  else
    echo 'Find_previous_test_name. No test found'
    return 0
  endif
endfunction

map :rt :call Rake_This_Test()<CR>
map :rf :call Rake_This_File()<CR>
