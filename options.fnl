(set vim.o.autowriteall true)
; this would be nice, but unsuccessful search prompts to press enter
; https://github.com/neovim/neovim/issues/20380
; (set vim.o.cmdheight 0) ; don't waste a line on command
(set vim.o.expandtab true) ; convert tabs to spaces
(set vim.o.grepprg "rg --vimgrep") ; use rg to grep
(set vim.o.hidden true) ; don't abandon out-of-sight buffers
(set vim.o.ignorecase true) ; case-insensitive searching
(set vim.o.inccommand "split") ; show live command substitutions
(set vim.o.joinspaces false) ; insert one space after ., ?, ! chars when joining
(set vim.o.lazyredraw true) ; don't draw during e.g. applying a macro
(set vim.o.modeline false) ; disable modelines
(set vim.o.mouse "") ; disable mouse
(set vim.o.report 0) ; always repeat the number of lines changed
(set vim.o.scrolloff 15) ; start scrolling before the cursor reaches the edge
(set vim.o.shiftround true) ; shift to multiple of shiftwidth
(set vim.o.shiftwidth 2)
(set vim.o.shortmess "filnxtToOFIc")
; this is enabled by default, but:
;   - I don't really want to see the character preview (e.g. 'cw' does not need to briefly show 'c')
;   - I have the visual selection size duplicated in lualine
(set vim.o.showcmd false)
(set vim.o.showmode false) ; don't show mode, since statusline handles that
(set vim.o.showtabline 2) ; always show the tabline
(set vim.o.sidescrolloff 16) ; start scrolling before the cursor reaches the edge
(set vim.o.smartcase true) ; don't ignore case if search contains uppercase char
(set vim.o.smartindent true) ; smart autoindenting when starting a new line
(set vim.o.softtabstop 2)
(set vim.o.startofline false) ; don't jump cursor to start of line when moving
(set vim.o.synmaxcol 200) ; dont bother syntax-highlighting past this column
(set vim.o.termguicolors true)
(set vim.o.timeoutlen 1000) ; only wait this many ms for key sequence to complete
(set vim.o.title true) ; put filename in window title
(set vim.o.undofile true) ; persist undo history across buffer exits
(set vim.o.updatetime 300) ; fire CursorHold after this many ms (default 4000ms)
(set vim.o.wildmenu true) ; complete commands with a little menu
(set vim.o.wildmode "list:longest,full") ; wild menu completion behavior
(set vim.o.wrap false) ; don't wrap long lines
(set vim.opt.clipboard [ "unnamed" "unnamedplus" ]) ; yank also copies to both clipboards
(set vim.opt.completeopt [ "menuone" "noinsert" "noselect" ]) ; sane completion behavior...
(set vim.opt.listchars { :nbsp "+" :tab "> " :trail "·"}) ; trailing whitespace markers
(set vim.wo.colorcolumn "120")
(set vim.wo.cursorline true) ; higlight the current line
(set vim.wo.foldenable false) ; never fold
(set vim.wo.list true) ; show trailing whitespace, tabs, etc.
(set vim.wo.number true) ; show line number gutter
(set vim.wo.signcolumn "yes") ; always draw signcolumn because it's jarring when it appears otherwise
