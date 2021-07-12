((. vim.fn "plug#begin") (.. (vim.fn.stdpath "data") "/plugged"))

(vim.cmd "Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }")
(vim.cmd "Plug 'Yggdroot/indentLine'")                                ; show markers every 2 columns of leading whitespace
(vim.cmd "Plug 'godlygeek/tabular'")                                  ; align on words
(vim.cmd "Plug 'itchyny/lightline.vim'")                              ;
(vim.cmd "Plug 'junegunn/fzf.vim'")                                   ; fuzzy search source code, files, etc
(vim.cmd "Plug 'mengelbrecht/lightline-bufferline'")                  ;
(vim.cmd "Plug 'mhinz/vim-startify'")                                 ; startup screen
(vim.cmd "Plug 'neovim/nvim-lsp'")                                    ;
(vim.cmd "Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }")    ;
(vim.cmd "Plug 'nvim-lua/completion-nvim'")                           ;
(vim.cmd "Plug 'nvim-lua/lsp-status.nvim'")                           ;
(vim.cmd "Plug 'rhysd/git-messenger.vim'")                            ; git blame the line under the cursor
(vim.cmd "Plug 'romainl/vim-cool'")                                   ; automatically unhighlight when cursor moves
(vim.cmd "Plug 'romainl/vim-qf'")                                     ; vim quickfix improvements
(vim.cmd "Plug 'rrethy/vim-illuminate'")                              ; highlight occurrences of the word under the cursor
(vim.cmd "Plug 'sdiehl/vim-ormolu', { 'for': 'haskell' }")            ;
(vim.cmd "Plug 'terryma/vim-multiple-cursors'")                       ; multiple cursors for quick and dirty renaming
(vim.cmd "Plug 'tommcdo/vim-exchange'")                               ; swap the location of two selections
(vim.cmd "Plug 'tpope/vim-characterize'")                             ; improved "ga"
(vim.cmd "Plug 'tpope/vim-commentary'")                               ; quick (un-)commenting
(vim.cmd "Plug 'tpope/vim-fugitive'")                                 ;
(vim.cmd "Plug 'tpope/vim-repeat'")                                   ; make "." repeat more things out of the box
(vim.cmd "Plug 'tpope/vim-surround'")                                 ; some surround helpers
(vim.cmd "Plug 'unblevable/quick-scope'")                             ; highlight characters for f, F, t, T

; (vim.cmd "Plug 'nvim-lua/plenary.nvim'")
; (vim.cmd "Plug 'nvim-lua/popup.nvim'")

; Cool stuff in here but it defines way too many bindings for me and it
; doesn't seem easy to disable them all and customize the ones I do want
; Plug 'wellle/targets.vim'

((. vim.fn "plug#end"))
