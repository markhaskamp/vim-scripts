
function! Prompt_Example()
  let nl_central = ['Pick:', '1.chicago', '2.cincinnati', '3.houston', '4.milwaukee', '5.pittsburgh']

  let foo = input("type something: ")
  echo "foo: [" . foo . "]"

  let bar = input("type something or use the default: ", "default-text")
  echo "bar: [" . bar . "]"

  let baz = input("type something, with auto-complete: ", "", "file")
  echo "baz: [" . baz . "]"

  let n = inputlist(nl_central)
  echo "\nn: [" . n . ", " . nl_central[n]. "]"
endfunction

