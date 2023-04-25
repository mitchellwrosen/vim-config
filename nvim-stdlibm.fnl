;; fennel-ls: macro-file

; position : { row : int, col : int } (1,0)-indexed
; region : { start : position, end : position }

; get a region of the current buffer
(fn get-current-buffer-region [region]
  `(do
     (local { :start { :row start-row# :col start-col# } :end { :row end-row# :col end-col# } } ,region)
     (vim.api.nvim_buf_get_text 0 (- start-row# 1) start-col# (- end-row# 1) (+ end-col# 1) {})
  )
)

; normal-mode mapping
(fn nmap [lhs rhs opts]
  `(vim.keymap.set "n" ,lhs ,rhs ,opts)
)

; set a region of the current buffer
(fn set-current-buffer-region [region lines]
  `(do
     (local { :start { :row start-row# :col start-col# } :end { :row end-row# :col end-col# } } ,region)
     (vim.api.nvim_buf_set_text 0 (- start-row# 1) start-col# (- end-row# 1) (+ end-col# 1) ,lines)
  )
)

{ : get-current-buffer-region
  : nmap
  : set-current-buffer-region
}
