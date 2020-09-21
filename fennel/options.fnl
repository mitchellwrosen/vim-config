(set vim.o.autowriteall true)   ;
(set vim.o.hidden true)         ; don't abandon out-of-sight buffers
(set vim.o.ignorecase true)     ; case-insensitive searching
(set vim.o.lazyredraw true)     ; don't draw during e.g. applying a macro
(set vim.o.joinspaces false)    ; insert one space after ., ?, ! chars when joining
(set vim.o.showmode false)      ; don't show mode, since lightline handle that
(set vim.o.startofline false)   ; don't jump cursor to start of line when moving
(set vim.o.shiftround true)     ; shift to multiple of shiftwidth
(set vim.o.smartcase true)      ; don't ignore case if search contains uppercase char
(set vim.o.termguicolors true)  ;
(set vim.o.title true)          ; put filename in window title
(set vim.o.wildmenu true)       ; complete commands with a little menu

(set vim.o.report 0)         ; always repeat the number of lines changed
(set vim.o.scrolloff 10)     ; start scrolling before the cursor reaches the edge
(set vim.o.sidescrolloff 16) ; start scrolling before the cursor reaches the edge
(set vim.o.showtabline 2)    ; always show the tabline
(set vim.o.timeoutlen 400)   ; only wait this many ms for key sequence to complete
(set vim.o.updatetime 300)   ; fire CursorHold after this many ms (default 4000ms)

(set vim.o.clipboard "unnamed,unnamedplus")         ; yank also copies to both clipboards
(set vim.o.completeopt "menuone,noinsert,noselect") ; sane completion behavior...
(set vim.o.grepprg "rg --vimgrep")                  ; use rg to grep
(set vim.o.inccommand "split")                      ; show live command substitutions
(set vim.o.listchars "tab:> ,trail:·,nbsp:+")       ; trailing whitespace markers
(set vim.o.wildmode "list:longest,full")            ; wild menu completion behavior

(set vim.wo.cursorline true)    ; higlight the current line
(set vim.wo.linebreak true)     ; wrap lines in a more visually pleasing way
(set vim.wo.list true)          ; show trailing whitespace, tabs, etc.
(set vim.wo.foldenable false)   ; never fold
(set vim.wo.number true)        ; show line number gutter

(set vim.wo.signcolumn "yes") ; always draw signcolumn because it's jarring when it appears otherwise

(macro set-bo [name value]
  `(do
     (tset vim.bo ,name ,value)
     (tset vim.o ,name ,value)))

(set-bo "expandtab" true)   ; convert tabs to spaces
(set-bo "modeline" false)   ; disable modelines
(set-bo "smartindent" true) ; smart autoindenting when starting a new line
(set-bo "undofile" true)    ; persist undo history across buffer exits

(set-bo "shiftwidth" 2)
(set-bo "synmaxcol" 180) ; dont bother syntax-highlighting past this column
(set-bo "softtabstop" 2)
