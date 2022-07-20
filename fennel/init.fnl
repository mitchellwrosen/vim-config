(include "fennel/nvim")
(import-macros
  { "left-merge" left-merge
    "map" map
  }
  "fennel/nvim-macros"
)

; Some ggandor/lightspeed.nvim mappings. These need to come before the plugin is loaded, because that's how the plugin
; documentation says you are meant to override the defaults.
(map [ "o" ] "s" "<Plug>Lightspeed_s" {}) ; default = z (why?)
(map [ "o" ] "S" "<Plug>Lightspeed_S" {}) ; default = Z (why?)
; Workaround (documented in lightspeed readme) for the fact that when recording macros, we want normal fFtT, not
; lightspeed's fancy fFtT.
(map [ "n" "o" "v" ] "f" "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_f' : 'f'" { "expr" true })
(map [ "n" "o" "v" ] "F" "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_F' : 'F'" { "expr" true })
(map [ "n" "o" "v" ] "t" "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_t' : 't'" { "expr" true })
(map [ "n" "o" "v" ] "T" "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_T' : 'T'" { "expr" true })

; plugins
((. vim.fn "plug#begin") (.. (vim.fn.stdpath "data") "/plugged"))

; show markers every 2 columns of leading whitespace
(vim.cmd "Plug 'lukas-reineke/indent-blankline.nvim', { 'commit': '0f8df7e43f0cae4c44e0e8383436ad602f333419' }")

(vim.cmd "Plug 'bakpakin/fennel.vim', { 'commit': '30b9beabad2c4f09b9b284caf5cd5666b6b4dc89', 'for': 'fennel' }")

; open LSP diagnostics with :TroubleToggle
(vim.cmd "Plug 'folke/trouble.nvim', { 'commit': '20469be985143d024c460d95326ebeff9971d714' }")

; vim-sneak thingy for moving to a specific character from far away
(vim.cmd "Plug 'ggandor/lightspeed.nvim', { 'commit': 'cfde2b2fe0dafc5684780399961595357998f611' }")

; completion - 2022/01/09
(vim.cmd "Plug 'hrsh7th/cmp-buffer', { 'commit': 'f83773e2f433a923997c5faad7ea689ec24d1785' }")
(vim.cmd "Plug 'hrsh7th/cmp-nvim-lsp', { 'commit': 'b4251f0fca1daeb6db5d60a23ca81507acf858c2' }")
(vim.cmd "Plug 'hrsh7th/cmp-vsnip', { 'commit': '0abfa1860f5e095a07c477da940cfcb0d273b700' }")
(vim.cmd "Plug 'hrsh7th/vim-vsnip', { 'commit': '7fde9c0b6878a62bcc6d2d29f9a85a6616032f02' }")
; 22-04-30
(vim.cmd "Plug 'hrsh7th/nvim-cmp', { 'commit': 'f841fa6ced194aa930136a7671439e6bd4c51722' }")

; statusline
(vim.cmd "Plug 'itchyny/lightline.vim', { 'commit': 'a29b8331e1bb36b09bafa30c3aa77e89cdd832b2' }")
; fuzzy search source code, files, etc
(vim.cmd "Plug 'junegunn/fzf', { 'commit': '6dcf5c3d7d6c321b17e6a5673f1533d6e8350462' }")
(vim.cmd "Plug 'junegunn/fzf.vim', { 'commit': 'd5f1f8641b24c0fd5b10a299824362a2a1b20ae0' }")

(vim.cmd "Plug 'kevinhwang91/nvim-bqf', { 'commit': '46e6469fb1ef90d475fb43c56e0eeb81eacf08dd' }")
(vim.cmd "Plug 'mengelbrecht/lightline-bufferline'")

; startup screen
(vim.cmd "Plug 'mhinz/vim-startify', { 'commit': '81e36c352a8deea54df5ec1e2f4348685569bed2' }")

; lsp configs
(vim.cmd "Plug 'neovim/nvim-lsp', { 'commit': '2c70b7b0095b4bbe55aaf0dc27a2581d1cafe491' }")

(vim.cmd "Plug 'neovimhaskell/haskell-vim', { 'commit': 'f35d02204b4813d1dbe8b0e98cc39701a4b8e15e', 'for': 'haskell' }")
(vim.cmd "Plug 'nvim-lua/plenary.nvim', { 'commit': '8bae2c1fadc9ed5bfcfb5ecbd0c0c4d7d40cb974' }")
(vim.cmd "Plug 'nvim-lua/popup.nvim', { 'commit': '5e3bece7b4b4905f4ec89bee74c09cfd8172a16a' }")

(vim.cmd "Plug 'nvim-lua/lsp-status.nvim', { 'commit': '4073f766f1303fb602802075e558fe43e382cc92' }")

; (vim.cmd "Plug 'nvim-telescope/telescope.nvim', { 'commit': '5b597e7709eec08331ce71b45193117f6fb5626b' }")

; git blame the line under the cursor
(vim.cmd "Plug 'rhysd/git-messenger.vim', { 'commit': '2e67899355f3f631aad6845925e4c2c13546444d' }")

; automatically unhighlight when cursor moves
(vim.cmd "Plug 'romainl/vim-cool', { 'commit': '27ad4ecf7532b750fadca9f36e1c5498fc225af2' }")

; vim quickfix improvements
(vim.cmd "Plug 'romainl/vim-qf', { 'commit': '65f115c350934517382ae45198a74232a9069c2a' }")

; multiple cursors for quick and dirty renaming
(vim.cmd "Plug 'terryma/vim-multiple-cursors', { 'commit': '6456718e1d30b42c04b920c5413ca44f68f08759' }")

; swap the location of two selections
(vim.cmd "Plug 'tommcdo/vim-exchange', { 'commit': '784d63083ad7d613aa96f00021cd0dfb126a781a' }")

; improved "ga"
(vim.cmd "Plug 'tpope/vim-characterize', { 'commit': '885a00a3c21dd52ca8f2fd7d62850134934179d9' }")

; quick (un-)commenting
(vim.cmd "Plug 'tpope/vim-commentary', { 'commit': '627308e30639be3e2d5402808ce18690557e8292' }")

(vim.cmd "Plug 'tpope/vim-fugitive', { 'commit': 'bb4f9e660b0934f70af693c56c5b8a4c322e7a1f' }")

; make "." repeat more things out of the box
(vim.cmd "Plug 'tpope/vim-repeat', { 'commit': '24afe922e6a05891756ecf331f39a1f6743d3d5a' }")

; some surround helpers
(vim.cmd "Plug 'tpope/vim-surround', { 'commit': 'aeb933272e72617f7c4d35e1f003be16836b948d' }")

((. vim.fn "plug#end"))

; colorscheme settings
(set vim.g.gruvbox_inverse 1)
(set vim.g.gruvbox_contrast_dark "soft")
(set vim.g.gruvbox_improved_strings 1) ; extra-highlight strings
(set vim.g.gruvbox_invert_signs 1)
(vim.cmd "colorscheme gruvbox")

; folke/trouble.nvim
(let
  [trouble (require "trouble")]
  (trouble.setup {
    ; "auto_open" true
    ; "auto_close" true
    ; don't use some fancy icons that require a separate plugin
    "icons" false
    "position" "right"
  })
)

; completion - 2022/01/09
(do
  (local cmp (require "cmp"))
  (cmp.setup {
    "mapping" {
      "<CR>" (cmp.mapping.confirm { "select" false })
      "<Tab>" (cmp.mapping.select_next_item)
    }
    "snippet" {
      "expand" (fn [args] ((. vim.fn "vsnip#anonymous") args.body))
    }
    "sources"
      (cmp.config.sources [
        {"name" "nvim_lsp"}
        {"name" "buffer"}
      ])
  })
)

; mhinz/vim-startify
(set vim.g.startify_custom_footer [ "   [e]  empty buffer" "   [q]  quit" ])
(set vim.g.startify_custom_header {})
(set vim.g.startify_custom_indices
  ["a" "s" "d" "f" "l" "g" "h" "w" "r" "u" "o" "p" "t" "y" "z"
   "x" "c" "v" "m" "" "." "/" "b" "n" "1" "2" "3" "4" "5" "6"])
(set vim.g.startify_enable_special 0)
(set vim.g.startify_enable_unsafe 1) ; faster startup
(set vim.g.startify_change_to_dir 0) ; don't cd to where file is
(set vim.g.startify_files_number 30)
(set vim.g.startify_lists [{ "type" "files" }])
(set vim.g.startify_relative_path 1)

; neovimhaskell/haskell-vim
(set vim.g.haskell_enable_backpack 1)
(set vim.g.haskell_enable_pattern_synonyms 1)
(set vim.g.haskell_enable_quantification 1)
(set vim.g.haskell_enable_recursivedo 1)
(set vim.g.haskell_enable_static_pointers 1)
(set vim.g.haskell_enable_typeroles 1)
(set vim.g.haskell_indent_disable 1)

; nvim-telescope/telescope.nvim
; (let
;   [telescope (require "telescope")
;    actions (require "telescope.actions")
;   ]
;   (telescope.setup {
;     "defaults" {
;       "mappings" {
;         "i" {
;           ; Change <C-n>/<C-p> movement to <C-j>/<C-k>
;           "<C-n>" false
;           "<C-p>" false
;           "<C-j>" actions.move_selection_next
;           "<C-k>" actions.move_selection_previous
;
;           "<Esc>" actions.close
;         }
;       }
;     }
;   })
; )

; rhysd/git-messenger.vim
(set vim.g.git_messenger_always_into_popup true)
(set vim.g.git_messenger_extra_blame_args "-w")
(set vim.g.git_messenger_no_default_mappings true)
; blame the line under the cursor
(vim.api.nvim_set_keymap "n" "<Space>b" "<Plug>(git-messenger)" {})

; tommcdo/vim-exchange
(set vim.g.exchange_no_mappings 1) ; Don't make any key mappings
; x ("exchange") once to yank, x again to exchange with the first yank
(map [ "n" "v" ] "x" "<Plug>(Exchange)" {})
; Manually make exhange replace 'w' with 'e', as vim does for e.g. 'c'
(map [ "n" ] "xw" "<Plug>(Exchange)e" {})
(map [ "n" ] "xW" "<Plug>(Exchange)E" {})
(map [ "n" ] "xx" "m`<Plug>(ExchangeLine)``" {}) ; exchange the entire line
(map [ "n" ] "X" "<Plug>(Exchange)$" {}) ; exchange from here to the end of line
(map [ "n" ] "xc" "<Plug>(ExchangeClear)" {}) ; clear the exchange highlight

; tpope/vim-commentary
(map [ "n" ] "-" "m`<Plug>CommentaryLine``" {})
(map [ "v" ] "-" "<Plug>Commentary" {})

; tpope/vim-surround
(set vim.g.surround_no_mappings 1) ; don't let surround map anything

(set vim.o.autowriteall true)
(set vim.o.hidden true) ; don't abandon out-of-sight buffers
(set vim.o.ignorecase true) ; case-insensitive searching
(set vim.o.lazyredraw true) ; don't draw during e.g. applying a macro
(set vim.o.joinspaces false) ; insert one space after ., ?, ! chars when joining
(set vim.o.showmode false) ; don't show mode, since lightline handle that
(set vim.o.startofline false) ; don't jump cursor to start of line when moving
(set vim.o.shiftround true) ; shift to multiple of shiftwidth
(set vim.o.shortmess "filnxtToOFIc")
(set vim.o.smartcase true) ; don't ignore case if search contains uppercase char
(set vim.o.termguicolors true)
(set vim.o.title true) ; put filename in window title
(set vim.o.wildmenu true) ; complete commands with a little menu
(set vim.o.report 0) ; always repeat the number of lines changed
(set vim.o.scrolloff 10) ; start scrolling before the cursor reaches the edge
(set vim.o.sidescrolloff 16) ; start scrolling before the cursor reaches the edge
(set vim.o.showtabline 2) ; always show the tabline
(set vim.o.timeoutlen 400) ; only wait this many ms for key sequence to complete
(set vim.o.updatetime 300) ; fire CursorHold after this many ms (default 4000ms)
(set vim.o.clipboard "unnamed,unnamedplus") ; yank also copies to both clipboards
(set vim.o.completeopt "menuone,noinsert,noselect") ; sane completion behavior...
(set vim.o.grepprg "rg --vimgrep") ; use rg to grep
(set vim.o.inccommand "split") ; show live command substitutions
(set vim.o.listchars "tab:> ,trail:·,nbsp:+") ; trailing whitespace markers
(set vim.o.wildmode "list:longest,full") ; wild menu completion behavior
(set vim.wo.cursorline true) ; higlight the current line
(set vim.wo.linebreak true) ; wrap lines in a more visually pleasing way
(set vim.wo.list true) ; show trailing whitespace, tabs, etc.
(set vim.wo.foldenable false) ; never fold
(set vim.wo.number true) ; show line number gutter
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

(include "fennel/mappings")

; autocommands

(vim.api.nvim_create_augroup "mitchellwrosen" {})

; Disallow edits to read-only files
(vim.api.nvim_create_autocmd
  ["BufReadPost"]
  {
    "callback" (fn [] (set vim.bo.modifiable (not vim.bo.readonly)))
    "group" "mitchellwrosen"
  }
)

; Briefly highlight yanks
(vim.api.nvim_create_autocmd
  ["TextYankPost"]
  {
    "callback" (fn [] (vim.highlight.on_yank { "higroup" "Visual" "timeout" 600 }))
    "group" "mitchellwrosen"
  }
)

; on cursor hold or focus gained, read the buffer in case it has been modified externally
(vim.api.nvim_create_autocmd
  ["CursorHold" "FocusGained"]
  {
    "callback"
      (fn []
        (when
          (= (vim.fn.getcmdwintype) "")
          (vim.cmd "checktime"))
      )
    "group" "mitchellwrosen"
  }
)

; Save the buffer after changing it
(vim.api.nvim_create_autocmd
  ["InsertLeave" "TextChanged"]
  {
    "callback"
      (fn []
        (when
          (and (= vim.o.buftype "") (not= (vim.api.nvim_buf_get_name 0) ""))
          (vim.cmd "silent! update")))
    "group" "mitchellwrosen"
  }
)

(do
  (local lsp (require "lspconfig"))
  (local status (require "lsp-status"))

  (local capabilities
    (lambda [config]
      (local cmp-nvim-lsp (require "cmp_nvim_lsp"))
      (cmp-nvim-lsp.update_capabilities
        (left-merge
          (or config.capabilities {})
          status.capabilities
        )
      )
    )
  )

  (local on-attach
    (lambda [client buf]
      ; make an autocommand group named e.g. "mitchellwrosenLsp3" for just this buffer, so we can clear it whenever it
      ; gets deleted and re-opend
      (local augroup-name (.. "mitchellwrosenLsp" buf))
      (vim.api.nvim_create_augroup augroup-name {})

      ; Format on save and on leaving insert mode
      ; commented out temporarily because it's a little bit slow on the unison codebase
      ; (autocmd augroup-name ["BufWritePre" "InsertLeave"] "<buffer>" (fn [] (vim.lsp.buf.formatting_sync nil 1000)))

      (vim.cmd "highlight LspReference guifg=NONE guibg=#665c54 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59")
      (vim.cmd "highlight! link LspReferenceText LspReference")
      (vim.cmd "highlight! link LspReferenceRead LspReference")
      (vim.cmd "highlight! link LspReferenceWrite LspReference")

      (vim.api.nvim_buf_set_keymap buf "n" "<Space>a" ":lua vim.lsp.buf.code_action()<CR>" { "noremap" true "silent" true })
      (vim.api.nvim_buf_set_keymap buf "n" "gd" ":lua vim.lsp.buf.definition()<CR>" { "noremap" true "silent" true })
      (vim.api.nvim_buf_set_keymap buf "n" "<Space>d" ":lua vim.lsp.buf.formatting()<CR>" { "noremap" true "silent" true })
      (vim.api.nvim_buf_set_keymap buf "n" "<Enter>" ":lua vim.lsp.buf.hover()<CR>" { "noremap" true "silent" true })
      (vim.api.nvim_buf_set_keymap buf "n" "<Space>r" ":lua vim.lsp.buf.references()<CR>" { "noremap" true "silent" true })
      ; float=false here means don't call vim.diagnostic.open_float once we land, because we already do on CursorHold.
      ; if float=true, the second vim.diagnostic.open_float jumps *into* the diagnostic window, which suuux (so glad I
      ; finally fixed this)
      (vim.api.nvim_buf_set_keymap buf "n" "<Up>" ":lua vim.diagnostic.goto_prev({float=false})<CR>" { "noremap" true "silent" true })
      (vim.api.nvim_buf_set_keymap buf "n" "<Down>" ":lua vim.diagnostic.goto_next({float=false})<CR>" { "noremap" true "silent" true })
      (set vim.bo.omnifunc "v:lua.vim.lsp.omnifunc")

      ; extract the "meaningful head" of a list of (markdown) strings, where "meaningful" means not the empty
      ; string, and not beginning with ```
      (local meaningful-head
        (fn [lines]
          (var ret "")
          (var i 1)
          (while (<= i (length lines))
            (let [l (. lines i)]
              (if
                (or (= l "") (= 0 (vim.fn.match l "^```")))
                (set i (+ i 1))
                (do
                  (set i (+ (length lines) 1))
                  (set ret l)))))
          ret))

      ; filter : string -> string
      ;
      ; Per the current buffer's filetype, return a function that mutates a line to set as virtual text, where
      ; the empty string means "don't annotate".
      ;
      ; For example, in Haskell we only care about lines that contain "::" (type signatures), because
      ; otherwise we'd end up annotating types with their own names on hover (for whatever reason,
      ; haskell-language-server currently returns "Bool" as the first line of a hover request, rather than
      ; something like "Bool :: Type")
      (local filter
        (match vim.bo.filetype
          "haskell"
            (fn [line] (if (= -1 (vim.fn.match line "::")) "" line))
          _ (fn [line] line)))

      (vim.api.nvim_create_autocmd
        ["CursorHold"]
        {
          "buffer" buf
          ; open diagnostics underneath the cursor
          "callback" (fn [] (vim.diagnostic.open_float))
          "group" augroup-name
        }
      )

      (vim.api.nvim_create_autocmd
        ["CursorMoved"]
        {
          "buffer" buf
          "callback"
            (fn []
              (when (= (. (vim.api.nvim_get_mode) "mode") "n")
                (local position (vim.lsp.util.make_position_params))
                ; highlight other occurrences of the thing under the cursor
                ; the colors are determined by LspReferenceText, etc. highlight groups
                (when client.resolved_capabilities.document_highlight
                  (vim.lsp.buf.clear_references)
                  (vim.lsp.buf.document_highlight))
                ; try to put a type sig in the virtual text area
                (vim.lsp.buf_request 0 "textDocument/hover" position
                  (fn [_err result _ctx _config]
                    (when (and (not (= result nil)) (= (type result) "table"))
                      (local namespace (vim.api.nvim_create_namespace "hover"))
                      (local line (meaningful-head (vim.lsp.util.convert_input_to_markdown_lines result.contents)))
                      (vim.api.nvim_buf_clear_namespace 0 namespace 0 -1)
                      (when (not (= (filter line) ""))
                        (vim.api.nvim_buf_set_virtual_text
                          0
                          namespace
                          position.position.line
                          [ [ (.. "∙ " line) "Comment" ] ] {})))))
              ))
          "group" augroup-name
        }
      )
    )
  )

  ; Uh, just kind of following https://github.com/nvim-lua/lsp-status.nvim here...
  (status.register_progress)

  (vim.diagnostic.config {
    "float" {
      ; require cursor to be over diagnostic in order to open a float window of it
      "scope" "cursor"
      ; remove the default "Diagnostics:" header
      "header" ""
    }
    ; only underline errors
    "underline" { "severity" vim.diagnostic.severity.ERROR }
    ; don't put diagnostics inline
    "virtual_text" false

  })

  (lsp.elmls.setup
    { "capabilities" (capabilities lsp.elmls)
      "on_attach"
        (lambda [client buf]
          ; https://github.com/elm-tooling/elm-language-server/issues/503
          (when client.config.flags (set client.config.flags.allow_incremental_sync true))
          (on-attach client buf))
    })

  (lsp.hls.setup
    { "capabilities" (capabilities lsp.hls)
      "cmd" ["haskell-language-server-wrapper" "--lsp"]
      ; "cmd" ["haskell-language-server-wrapper" "--lsp" "--debug" "--logfile" "/home/mitchell/hls.txt"]
      "settings" {
        "haskell" {
          "formattingProvider" "ormolu"
          "plugin" {
            "hlint" {
              "globalOn" false
            }
          }
          ; max number of completions sent to client at one time
          ; "maxCompletions" 20
        }
      }
      "on_attach" on-attach })

  (lsp.sumneko_lua.setup
    { "capabilities" (capabilities lsp.sumneko_lua)
      "on_attach" on-attach })
)

(lambda lightline-status []
  (if (> (length (vim.lsp.buf_get_clients)) 0)
    ((. (require "lsp-status") "status"))
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
    (vim.api.nvim_buf_set_keymap buf "t" "<Esc>" "<Esc>" { "noremap" true "nowait" true "silent" true })
    win))

{ "lightline_status" lightline-status
  "run_floating" run-floating
  "virtual_hover" virtual-hover }
