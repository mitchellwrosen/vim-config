; Unmap Esc quitting terminal mode, so fzf handles it (result: one Esc closes fzf)
(vim.keymap.del "t" "<Esc>" { :buffer true })
