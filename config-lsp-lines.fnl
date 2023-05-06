(import-macros { : nmap } "nvim-stdlibm")

(fn []
  (local lsp_lines (require "lsp_lines"))
  ; Cycle through [off, on current line, on all lines]
  (nmap
    "<Space>ll"
    (fn []
      (local value (. (vim.diagnostic.config) "virtual_lines"))
      (if
        (= value true)
        (do
          (vim.diagnostic.config { :virtual_lines { :only_current_line true } })
          (vim.notify "LSP diagnostics on (current line only)")
        )
        (do
          (vim.diagnostic.config { :virtual_lines true })
          (vim.notify "LSP diagnostics on")
        )
      )
    )
    { :desc "Toggle diagnostics" }
  )
  (lsp_lines.setup)
)
