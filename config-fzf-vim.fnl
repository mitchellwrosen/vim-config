(import-macros { : string-join } "stdlibm")
(import-macros { : nmap } "nvim-stdlibm")

(fn []
  (local fzf-vim-buffers (. vim.fn "fzf#vim#buffers"))
  (local fzf-vim-files (. vim.fn "fzf#vim#files"))
  (local fzf-vim-grep (. vim.fn "fzf#vim#grep"))
  (local fzf-vim-gitfiles (. vim.fn "fzf#vim#gitfiles"))
  (local fzf-vim-with-preview (. vim.fn "fzf#vim#with_preview"))

  (local opts1 (fzf-vim-with-preview { :options [ "--info=inline" "--layout=reverse" ] } "down:60%"))

  ; If the buffer is already open in another tab or window, jump to it
  (set vim.g.fzf_buffers_jump 1)

  (local ripgrep
    (fn [args]
      (fzf-vim-grep
        (..
          "rg --column --line-number --no-heading --color=always -- "
          (vim.fn.shellescape (string-join args " "))
        )
        1
        opts1
        0
      )
    )
  )

  (vim.api.nvim_create_user_command
    "Rg"
    (fn [opts] (ripgrep opts.fargs))
    { :desc "ripgrep"
      :nargs "*"
    }
  )

  ; command! -nargs=* Rgu
  ;   \ call fzf#vim#grep(
  ;   \   'rg --line-number --multiline --multiline-dotall --no-heading --color=always -- '.shellescape(<q-args>),
  ;   \   0,
  ;   \   fzf#vim#with_preview({'options': ['--border', '--info=inline', '--layout=reverse']}, 'down:60%'),
  ;   \   0)

  ; Space-f ("find") the word under the cursor
  (nmap "<Space>f" (fn [] (ripgrep [ (vim.fn.expand "<cword>") ])))

  ; Space-k (because it's a home-row key) to fuzzy-search buffers
  ; I don't use this much, maybe I should delete it
  (nmap "<Space>k" (fn [] (fzf-vim-buffers opts1)))

  ; Space-o ("open") to fuzzy file search, both git- and everything-variants
  (nmap
    "<Space>o"
    ; just check if we're in a git repo once, not every <Space>-o, which seems fine because I don't cd
    (if
      (= 0 (os.execute "git rev-parse 2>/dev/null"))
      ; fzf#vim#gitfiles takes an undocumented first arg, but I peeked at the source - it's a string lol
      (fn [] (fzf-vim-gitfiles "" opts1))
      (fn [] (fzf-vim-files "." opts1))
    )
  )
)
