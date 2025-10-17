; Make one Esc close the fzf window
(vim.keymap.set "t" "<Esc>" "<C-\\><C-N>:norm q<CR>" { :buffer true :silent true })
