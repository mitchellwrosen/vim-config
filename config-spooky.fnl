(import-macros { : create-autocmd } "nvim-stdlibm")

(fn []
  (local spooky (require "spooky"))
  (spooky.setup {})

  (create-autocmd
    "User"
    { :pattern "SpookyOperationDone" }
    (fn [event]
      (local op vim.v.operator)
      ; Jump back after operation
      (event.data.restore_cursor)
      ; Auto-paste remote yanks
      (when (and (= op "y") (= event.data.register "+"))
        (vim.cmd "normal! p")
      )
    )
  )
)
