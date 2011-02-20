
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
    " echo 'Find_previous_test_name. No test found'
    return 0
  endif
endfunction

function! Show_test_list()
  let test_list = []
  let test_commands_list = ['']

  let word = Get_WORD_under_cursor()
  if Is_test_name(word)
    let test_list += [word]
    let test_commands_list += ['!clear; ruby -Ilib:test ' . @% . ' -n ' . word]
  else
    let word = Find_previous_test_name()
    if Is_test_name(word)
      let test_list += [word]
      let test_commands_list += ['!clear; ruby -Ilib:test ' . @% . ' -n ' . word]
    endif
  endif

  let test_list += [@%, 'test:units', 'test:functionals', 'test:integration', 'test']
  let test_commands_list += ['!clear; ruby -Ilib:test ' . @%]
  let test_commands_list += ['rake test:units']
  let test_commands_list += ['rake test:functionals']
  let test_commands_list += ['rake test:integration']
  let test_commands_list += ['rake test']

  let i = 1
  let display_list = ['0. which test?']
  for item in test_list
    let display_list += [' ' . i . '. ' . item]
    let i = i + 1
  endfor
    
  let t = inputlist(display_list)
  if t > 0 
    exec test_commands_list[t]
  endif
 
endfunction

map <leader>rt :call Show_test_list()<CR>
map :rt :call Rake_This_Test()<CR>
map :rf :call Rake_This_File()<CR>
