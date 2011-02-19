function! Get_List()
  return ['Pick:', '1.chicago', '2.cincinnati', '3.houston', '4.milwaukee', '5.pittsburgh']
endfunction

function! CustomListFunc(A,L,P)
  return ['crooked tree', 'kings island', 'green crest']
endfunction

function! Prompt_Example()

  let foo = input("type something: ")
  echo "\n\tfoo: [" . foo . "]"

  let bar = input("type something or use the default: ", "default-text")
  echo "\n\tbar: [" . bar . "]"

  let baz = input("type something, with auto-complete = file: ", "", "file")
  echo "\n\tbaz: [" . baz . "]"

  let m = input("type something, with auto-complete = customlist: ", "", "customlist,CustomListFunc")
  echo "\n\tm: [" . m . "]"

  echo "inputlist where list is a variable."
  let nl_central = Get_List()
  let m = inputlist(nl_central)
  echo "\n\tm: [" . m . ", " . nl_central[m]. "]"

  echo "inputlist where list is a function."
  let m = inputlist(Get_List())
  echo "\n\tm: [" . m . ", " . Get_List()[m] . "]"
endfunction

