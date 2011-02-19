function! Get_List()
  return ['Pick:', '1.chicago', '2.cincinnati', '3.houston', '4.milwaukee', '5.pittsburgh']
endfunction

function! CustomFunc(A,L,P)
  return "crooked tree\nkings island\ngreen crest\nsharon woods\nblue ash\reeves\ncalifornia\nglenview"
endfunction

function! Input_Examples()

  let t = input("type something: ")
  echo "\n\tt: [" . t . "]"

  let t = input("type something or use the default: ", "default-text")
  echo "\n\tt: [" . t . "]"

  let t = input("type something, with auto-complete = file: ", "", "file")
  echo "\n\tt: [" . t . "]"

  let t = input("type something, with auto-complete = custom: ", "", "custom,CustomFunc")
  echo "\n\tt: [" . t . "]"

  echo "inputlist where list is a variable."
  let nl_central = Get_List()
  let t = inputlist(nl_central)
  echo "\n\tt: [" . t . ", " . nl_central[t]. "]"

  echo "inputlist where list is a function."
  let t = inputlist(Get_List())
  echo "\n\tt: [" . t . ", " . Get_List()[t] . "]"
endfunction

