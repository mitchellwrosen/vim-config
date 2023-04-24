;; fennel-ls: macro-file

; get a region of the current buffer. region is a tuple of (1,0)-indexed (row, col) tuples, inclusive.
(fn get-current-buffer-region [region]
  ; (local [[row0 col0] [row1 col1]] region)
  `(do
     (local [[row0# col0#] [row1# col1#]] ,region)
     (vim.api.nvim_buf_get_text 0 (- row0# 1) col0# (- row1# 1) (+ col1# 1) {})
   )
)

; normal-mode mapping
(fn nmap [lhs rhs opts]
  `(vim.keymap.set "n" ,lhs ,rhs ,opts)
)

; set a region of the current buffer. region is a tuple of (1,0)-indexed (row, col) tuples, inclusive.
(fn set-current-buffer-region [region lines]
  `(do
     (local [[row0# col0#] [row1# col1#]] ,region)
     (vim.api.nvim_buf_set_text 0 (- row0# 1) col0# (- row1# 1) (+ col1# 1) ,lines)
  )
)

{ : get-current-buffer-region
  : nmap
  : set-current-buffer-region
}
