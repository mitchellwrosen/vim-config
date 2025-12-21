; Make one Esc close the fzf window
(vim.keymap.set "t" "<Esc>" "<C-\\><C-N>:lua vim.api.nvim_buf_delete(0, { force = true })<CR>" { :buffer true :silent true })
