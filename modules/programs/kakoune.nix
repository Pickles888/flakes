''
  # visual
  colorscheme gruvbox-dark
  add-highlighter global/ number-lines -hlcursor -relative -separator "  "
  add-highlighter global/ show-matching

  # settings
  set-option global tabstop 2 # tab length
  set-option global indentwidth 2 
  set-option global scrolloff 8,3 # see cursor at all times

  # mappings
  map global normal <esc> ";," # unhighlight on esc
  map global normal <c-v> ":comment-line<ret>" # comment lines on control-v

  map -docstring "close current buffer" global user b ": db<ret>"
  map -docstring "goto previous buffer" global user n ": bp<ret>"
  map -docstring "goto next buffer" global user m ": bn<ret>"

  # LSP
  eval %sh{kak-lsp}
  lsp-enable

  # LSP Mappings
  map global user l ':enter-user-mode lsp<ret>' -docstring 'LSP mode'

  map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'

  map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
  map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
  map global object f '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
  map global object t '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
  map global object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
  map global object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'
''

