; (local { "event" event } (include "fennel/nvim"))

; (fn map [modes lhs rhs]
;   `(each [_# mode# (ipairs ,modes)]
;      (let 
;       [short-mode# 
;        (match mode#
;          "command" "c"
;          "insert" "i"
;          "normal" "n"
;          "operator-pending" "o"
;          "visual" "v")]
;       (vim.api.nvim_set_keymap short-mode# ,lhs ,rhs { "noremap" true }))))

; { "map"  map }
