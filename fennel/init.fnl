; ----------------------------------------------------------------------------------------------------------------------
; Plugins
; ----------------------------------------------------------------------------------------------------------------------

((. vim.fn "plug#begin") (.. (vim.fn.stdpath "data") "/plugged"))

(vim.cmd "Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }")
(vim.cmd "Plug 'Yggdroot/indentLine'")                                ; show markers every 2 columns of leading whitespace
(vim.cmd "Plug 'godlygeek/tabular'")                                  ; align on words
(vim.cmd "Plug 'itchyny/lightline.vim'")                              ;
(vim.cmd "Plug 'junegunn/fzf.vim'")                                   ; fuzzy search source code, files, etc
(vim.cmd "Plug 'liuchengxu/vim-which-key'")                           ; thingy to tell me my own hotkeys (requires manual work)
(vim.cmd "Plug 'mengelbrecht/lightline-bufferline'")                  ;
(vim.cmd "Plug 'mhinz/vim-startify'")                                 ; startup screen
(vim.cmd "Plug 'neovim/nvim-lsp'")                                    ;
(vim.cmd "Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }")    ;
(vim.cmd "Plug 'nvim-lua/completion-nvim'")                           ;
(vim.cmd "Plug 'nvim-lua/lsp-status.nvim'")                           ;
(vim.cmd "Plug 'rhysd/git-messenger.vim'")                            ; git blame the line under the cursor
(vim.cmd "Plug 'romainl/vim-cool'")                                   ; automatically unhighlight when cursor moves
(vim.cmd "Plug 'romainl/vim-qf'")                                     ; vim quickfix improvements
(vim.cmd "Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }") ; show colored pips by #abcdef things
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

; Cool stuff in here but it defines way too many bindings for me and it
; doesn't seem easy to disable them all and customize the ones I do want
; Plug 'wellle/targets.vim'

((. vim.fn "plug#end"))

; ----------------------------------------------------------------------------------------------------------------------
; Options
; ----------------------------------------------------------------------------------------------------------------------

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

; ----------------------------------------------------------------------------------------------------------------------
; Mappings
; ----------------------------------------------------------------------------------------------------------------------

; local utils = require('utils')

(macro noremap [mode lhs rhs]
  `(vim.api.nvim_set_keymap ,mode ,lhs ,rhs { "noremap" true }))

(macro cnoremap [lhs rhs]
  `(noremap "c" ,lhs ,rhs))

(macro inoremap [lhs rhs]
  `(noremap "i" ,lhs ,rhs))

(macro nnoremap [lhs rhs]
  `(noremap "n" ,lhs ,rhs))

(macro onoremap [lhs rhs]
  `(noremap "o" ,lhs ,rhs))

(macro vnoremap [lhs rhs]
  `(noremap "v" ,lhs ,rhs))

(macro buf-nnoremap-silent [lhs rhs]
  `(vim.api.nvim_buf_set_keymap 0 "n" ,lhs ,rhs { "noremap" true "silent" true }))

; Swap : and ;
(nnoremap ";" ":")
(nnoremap ":" ";")
(onoremap ";" ":")
(onoremap ":" ";")
(vnoremap ";" ":")
(vnoremap ":" ";")
(nnoremap "r;" "r:")
(nnoremap "r:" "r;")
(inoremap ";" ":")
(inoremap ":" ";")
(cnoremap ":" ";")
(cnoremap ";" ":")

; make ' jump back to mark's exact position, not just line
(nnoremap "'" "`")

; very magic mode search
(nnoremap "/" "/\\v")
(vnoremap "/" "/\\v")

; Don't highlight matches *and* jump at the same time; only highlight
(nnoremap "*" "*``")

; Wean myself off tab for now... hm, find a use for this.
(nnoremap "<Tab>" "<Nop>")

; Backspace to switch to the previously edited buffer
(nnoremap "<BS>" "<C-^>")

(local event (require "event"))
(local utils (require "utils"))

(macro autocmd [events pattern action]
  `(utils.autocmd "mitchellwrosen" ,events ,pattern ,action))

(autocmd [event.bufEnter event.focusGained event.insertLeave] "*" (lambda [] (set vim.wo.relativenumber true)))
(autocmd [event.bufLeave event.focusLost   event.insertEnter] "*" (lambda [] (set vim.wo.relativenumber false)))

(fn lsp-setup []
  (let
    [completion (require "completion")
    configs    (require "nvim_lsp/configs")
    lsp        (require "nvim_lsp")
    status     (require "lsp-status")]

    ; Uh, just kind of following https://github.com/nvim-lua/lsp-status.nvim here...
    (status.register_progress)

    (set
      configs.ghcide
      { "default_config"
        { "cmd" [ "ghcide-wrapper" "--lsp" ]
          "filetypes" [ "haskell" ]
          "root_dir" (lsp.util.root_pattern ".git" "cabal.project" "stack.yaml")
          "settings" {}
        }
      }
    )

    (let
      [ capabilities (lambda [config] (vim.tbl_extend "keep" (or config.capabilities {}) status.capabilities))
        on-attach
          (lambda [client]
            (buf-nnoremap-silent "<Space>lca" ":lua vim.lsp.buf.code_action()<CR>")
            (buf-nnoremap-silent "<Space>lcr" ":lua vim.lsp.buf.clear_references<CR>")
            (buf-nnoremap-silent "<Space>ldec" ":lua vim.lsp.buf.declaration()<CR>")
            (buf-nnoremap-silent "<Space>ldef" ":lua vim.lsp.buf.definition()<CR>")
            (buf-nnoremap-silent "<Space>lds" ":lua vim.lsp.buf.document_symbol()<CR>")
            (buf-nnoremap-silent "<Space>lh" ":lua vim.lsp.buf.hover()<CR>")
            (buf-nnoremap-silent "<Space>lic" ":lua vim.lsp.buf.incoming_calls()<CR>")
            (buf-nnoremap-silent "<Space>lim" ":lua vim.lsp.buf.implementation()<CR>")
            (buf-nnoremap-silent "<Space>lo" ":lua vim.lsp.buf.outgoing_calls()<CR>")
            (buf-nnoremap-silent "<Space>lref" ":lua vim.lsp.buf.references()<CR>")
            (buf-nnoremap-silent "<Space>lren" ":lua vim.lsp.buf.rename()<CR>")
            (buf-nnoremap-silent "<Space>lsh" ":lua vim.lsp.buf.signature_help()<CR>")
            (buf-nnoremap-silent "<Space>lsl" ":lua vim.lsp.util.show_line_diagnostics()<CR>")
            (buf-nnoremap-silent "<Space>lt" ":lua vim.lsp.buf.type_definition()<CR>")
            (buf-nnoremap-silent "<Space>lw" ":lua vim.lsp.buf.workspace_symbol()<CR>")
            (vim.cmd "setlocal omnifunc=v:lua.vim.lsp.omnifunc")
            (completion.on_attach client)
            (status.on_attach client))]
      (lsp.ghcide.setup
        { "capabilities" (capabilities lsp.ghcide)
          "on_attach" on-attach })
      (lsp.sumneko_lua.setup
        { "capabilities" (capabilities lsp.sumneko_lua)
          "on_attach" on-attach })
      (lsp.vimls.setup
        { "capabilities" (capabilities lsp.vimls)
          "on_attach" on-attach }))
      status.status))

(local lsp-status (lsp-setup))

(lambda lightline-status []
  (if (> (length (vim.lsp.buf_get_clients)) 0)
    (lsp-status)
    ""))

; Run the given command in a centered floating terminal.
(lambda run-floating [command]
  (let [buf (vim.api.nvim_create_buf false true)
        columns vim.o.columns
        lines vim.o.lines
        height (math.floor (+ (* lines 0.8) 0.5))
        row (math.floor (+ (/ (- lines height) 2) 0.5))
        width (math.floor (+ (* columns 0.8) 0.5))
        col (math.floor (+ (/ (- columns width) 2) 0.5))
        win (vim.api.nvim_open_win 
              buf 
              true 
              { "col" col 
                "height" height 
                "relative" "editor"
                "row" row
                "style" "minimal"
                "width" width })]
    (vim.fn.termopen command { "on_exit" (lambda [] (vim.cmd (.. "bw! " buf))) })
    ; Awkward, undo the remapping of <Esc> to <C-\><C-n> in init.vim
    (vim.api.nvim_buf_set_keymap buf "t" "<Esc>" "<Esc>" { "nowait" true "noremap" true "silent" true })
    win))

{ "lightline_status" lightline-status
  "run_floating" run-floating }
