; (local { "event" event } (include "fennel/nvim"))

(fn buf-map [modes lhs rhs opts]
  (assert (sequence? modes) "modes must be a sequence")
  (match (length modes)
    0 (assert false "modes must be non-empty")
    1 `(vim.api.nvim_buf_set_keymap 0 ,(. modes 1) ,lhs ,rhs ,opts)
    _ (let [out (list `do)]
        (each [_ mode (ipairs modes)]
          (table.insert out `(vim.api.nvim_buf_set_keymap 0 ,mode ,lhs ,rhs ,opts)))
        out)))

(fn left-merge [x y]
  ; (assert (table? x) "first argument must be a table")
  ; (assert (table? y) "second argument must be a table")
  `(let [x# ,x y# ,y] (vim.tbl_extend "keep" x# y#)))

(fn map [modes lhs rhs opts]
  (assert (sequence? modes) "modes must be a sequence")
  (match (length modes)
    0 (assert false "modes must be non-empty")
    1 `(vim.api.nvim_set_keymap ,(. modes 1) ,lhs ,rhs ,opts)
    _ (let [out (list `do)]
        (each [_ mode (ipairs modes)]
          (table.insert out `(vim.api.nvim_set_keymap ,mode ,lhs ,rhs ,opts)))
        out)))

{
 "buf-map" buf-map
 "left-merge" left-merge
 "map"  map
}
