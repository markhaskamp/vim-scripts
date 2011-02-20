
"  cursor must be located in the test block
function! Rake_This_Test()
  let word = Get_WORD_under_cursor()
  if Is_test_name(word)
    let test_name_suffix = ' -n ' .  word
  else
    let word = Find_previous_test_name()
    if Is_test_name(word)
      let test_name_suffix = ' -n ' . word
    else
      let test_name_suffix = ''
    endif
  endif
  let rake_cmd =  '!clear; ruby -Ilib:test ' . @% . test_name_suffix
  " echo rake_cmd
  exec rake_cmd
endfunction

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
  " echo 'Is_test_name. word: [' . a:word . ']'
  if (a:word =~ 'test_')
    " echo 'Is_test_name. return 1'
    return 1
  else
    " echo 'Is_test_name. return 0'
    return 0
  endif
endfunction

function! Find_previous_test_name()
  let result = search('\stest_', 'beW')
  " echo 'Find_previous_test_name. result: [' . result . ']'
  if (result > 0)
    return Get_WORD_under_cursor()
  else
    echo 'Find_previous_test_name. No test found'
    return 0
  endif
endfunction

map :rt :call Rake_This_Test()<CR>
map :rf :call Rake_This_File()<CR>
