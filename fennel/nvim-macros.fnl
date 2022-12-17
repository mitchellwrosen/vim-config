(fn left-merge [x y]
  `(vim.tbl_extend "keep" ,x ,y))

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
 "left-merge" left-merge
 "map"  map
}
