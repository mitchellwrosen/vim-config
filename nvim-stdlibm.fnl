;; fennel-ls: macro-file

; position : { row : int, col : int } (1,0)-indexed
; region : { start : position, end : position }

(fn get-cursor []
  `(do
    (local [ row# col# ] (vim.api.nvim_win_get_cursor 0))
    { :row row# :col col# }
  )
)

; get a region of the current buffer
(fn get-region [region]
  `(do
     (local { :start { :row start-row# :col start-col# } :end { :row end-row# :col end-col# } } ,region)
     (vim.api.nvim_buf_get_text 0 (- start-row# 1) start-col# (- end-row# 1) (+ end-col# 1) {})
  )
)

(fn get-previous-yank []
  `(do
    (local [ start-row# start-col# ] (vim.api.nvim_buf_get_mark 0 "["))
    (local [ end-row# end-col# ] (vim.api.nvim_buf_get_mark 0 "]"))
    { :start { :row start-row# :col start-col# }
      :end { :row end-row# :col end-col# }
    }
  )
)

(fn get-visual-selection []
  `(do
    (local [ _bufnum# begin-row# begin-col# _off# ] (vim.fn.getpos "v"))
    (local begin-pos# { :row begin-row# :col (- begin-col# 1) })
    (local end-pos# ,(get-cursor))
    (if
      (or
        (< begin-pos#.row end-pos#.row)
        (and
          (= begin-pos#.row end-pos#.row)
          (<= begin-pos#.col end-pos#.col)
        )
      )
      { :start begin-pos# :end end-pos# }
      { :start end-pos# :end begin-pos# }
    )
  )
)

(fn in-normal-mode []
  `(= (. (vim.api.nvim_get_mode) :mode) "n")
)

; normal-mode mapping
(fn nmap [lhs rhs opts]
  `(vim.keymap.set "n" ,lhs ,rhs ,opts)
)

; set a region of the current buffer
(fn set-region [region lines]
  `(do
     (local { :start { :row start-row# :col start-col# } :end { :row end-row# :col end-col# } } ,region)
     (vim.api.nvim_buf_set_text 0 (- start-row# 1) start-col# (- end-row# 1) (+ end-col# 1) ,lines)
  )
)

(fn set-cursor [position]
  `(do
    (local { :row row# :col col# } ,position)
    (vim.api.nvim_win_set_cursor 0 [ row# col# ])
  )
)

{
  : get-cursor
  : get-previous-yank
  : get-region
  : get-visual-selection
  : in-normal-mode
  : nmap
  : set-cursor
  : set-region
}
