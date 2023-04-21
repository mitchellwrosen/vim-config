; normal-mode mapping
(fn nmap [lhs rhs opts]
  `(vim.keymap.set "n" ,lhs ,rhs ,opts)
)

{ : nmap }
