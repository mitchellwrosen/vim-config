(local event
  { "bufEnter" "BufEnter"
    "bufLeave" "BufLeave"
    "focusGained" "FocusGained"
    "focusLost" "FocusLost"
    "insertEnter" "InsertEnter"
    "insertLeave" "InsertLeave"
  })

(local mode
  { "command" "command"
    "insert" "insert"
    "normal" "normal"
    "operator-pending" "operator-pending"
    "visual" "visual"
  })

(var n 0)
(var lambdas {})
(lambda register-lambda [f]
  (let [name (.. "f" (tostring n))]
    (tset lambdas name f)
    (set n (+ n 1))
    name))

(lambda autocmd [group events pattern f]
  (let [name (register-lambda f)]
    (vim.cmd
      (..
        "autocmd "
        group
        " "
        (table.concat events ",")
        " "
        pattern
        " lua require('fennel/nvim').lambdas."
        name
        "()"))))

(lambda buf-map-fn [modes lhs f opts]
  (let [name (register-lambda f)]
    (each [_ mode (ipairs modes)]
      (vim.api.nvim_buf_set_keymap 0 (. modes 1) lhs (.. ":lua require('fennel/nvim').lambdas." name "()<CR>") opts))))

(lambda overwrite-buffer [lines]
  (if vim.bo.modifiable
    (let [w (vim.fn.winsaveview)]
      (vim.api.nvim_buf_set_lines 0 0 -1 false lines)
      (vim.fn.winrestview w))
    (print "Cannot write to non-modifiable buffer")))

(lambda sys-format-buffer [program]
  (let [output (vim.fn.system (.. program " " (vim.api.nvim_buf_get_name 0)))]
    (when (= vim.v.shell_error 0)
      (overwrite-buffer (vim.fn.split output "\n"))
      (vim.cmd "update"))))

{ "autocmd" autocmd
  "buf-map-fn" buf-map-fn
  "event" event
  "lambdas" lambdas
  "mode" mode
  "sys-format-buffer" sys-format-buffer
}
