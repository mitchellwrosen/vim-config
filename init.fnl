(local { : file-exists } (require "stdlib"))
(import-macros { : nmap } "nvim-stdlibm")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Bootstrap lazy.nvim

(do
  (local lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim"))
  (when (not (vim.loop.fs_stat lazypath))
    (vim.fn.system
      [ "git"
        "clone"
        "--filter=blob:none"
        "https://github.com/folke/lazy.nvim"
        "--branch=v9.14.2"
        lazypath
      ]
    )
  )
  (vim.opt.rtp:prepend lazypath)
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Options

(set vim.o.autowriteall true)
; this would be nice, but unsuccessful search prompts to press enter
; https://github.com/neovim/neovim/issues/20380
; (set vim.o.cmdheight 0) ; don't waste a line on command
(set vim.o.grepprg "rg --vimgrep") ; use rg to grep
(set vim.o.hidden true) ; don't abandon out-of-sight buffers
(set vim.o.ignorecase true) ; case-insensitive searching
(set vim.o.inccommand "split") ; show live command substitutions
(set vim.o.joinspaces false) ; insert one space after ., ?, ! chars when joining
(set vim.o.lazyredraw true) ; don't draw during e.g. applying a macro
(set vim.o.mouse "") ; disable mouse
(set vim.o.report 0) ; always repeat the number of lines changed
(set vim.o.scrolloff 15) ; start scrolling before the cursor reaches the edge
(set vim.o.shiftround true) ; shift to multiple of shiftwidth
(set vim.o.shortmess "filnxtToOFIc")
; this is enabled by default, but:
;   - I don't really want to see the character preview (e.g. 'cw' does not need to briefly show 'c')
;   - I have the visual selection size duplicated in lualine
(set vim.o.showcmd false)
(set vim.o.showmode false) ; don't show mode, since statusline handles that
(set vim.o.showtabline 2) ; always show the tabline
(set vim.o.sidescrolloff 16) ; start scrolling before the cursor reaches the edge
(set vim.o.smartcase true) ; don't ignore case if search contains uppercase char
(set vim.o.startofline false) ; don't jump cursor to start of line when moving
(set vim.o.termguicolors true)
(set vim.o.timeoutlen 400) ; only wait this many ms for key sequence to complete
(set vim.o.title true) ; put filename in window title
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

(macro set-bo [name value]
  `(do
     (tset vim.bo ,name ,value)
     (tset vim.o ,name ,value)
  )
)

(set-bo "expandtab" true)   ; convert tabs to spaces
(set-bo "modeline" false)   ; disable modelines
(set-bo "smartindent" true) ; smart autoindenting when starting a new line
(set-bo "undofile" true)    ; persist undo history across buffer exits

(set-bo "shiftwidth" 2)
(set-bo "synmaxcol" 200) ; dont bother syntax-highlighting past this column
(set-bo "softtabstop" 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plugins

(do
  (local lazy (require "lazy"))
  (lazy.setup
    [
      ; fennel syntax highlighting
      { :url "https://github.com/bakpakin/fennel.vim"
        :commit "30b9beabad2c4f09b9b284caf5cd5666b6b4dc89"
	:ft "fennel"
      }

      ; highlight colorcolumn in insert mode
      { :url "https://github.com/Bekaboo/deadcolumn.nvim"
        :commit "8140fd7cface9592a44b3151203fc6ca95ad9598"
        :event "InsertEnter" ; defer loading until insert mode is entered
        :config
          (fn []
            (local deadcolumn (require "deadcolumn"))
            (deadcolumn.setup
              { :blending { :threshold 100 } ; start showing color column here
                :scope "visible" ; show color column per all visible lines
                :warning { :alpha 0.1 :hlgroup [ "ErrorMsg" "background" ] }
              }
            )
          )
      }

      ; use 's' to move far away
      { :url "https://github.com/ggandor/leap.nvim"
        :commit "f74473d23ebf60957e0db3ff8172349a82e5a442"
        :event "VeryLazy" ; defer loading until way after UI
        :config
          (fn []
            (local leap (require "leap"))
            (leap.add_default_mappings)
          )
      }

      ; autocompletion
      ; 22-04-30
      { :url "https://github.com/hrsh7th/nvim-cmp"
        :commit "f841fa6ced194aa930136a7671439e6bd4c51722"
        ; don't load these plugins until this one is loaded
        ; todo add cmp-path?
        :dependencies
          [
            { :url "https://github.com/hrsh7th/cmp-nvim-lsp"
              :commit "b4251f0fca1daeb6db5d60a23ca81507acf858c2"
            }
            { :url "https://github.com/hrsh7th/cmp-buffer"
              :commit "f83773e2f433a923997c5faad7ea689ec24d1785"
            }
          ]
        :event "InsertEnter" ; defer loading of this plugin until insert mode is entered
        :config
          (fn []
            (local cmp (require "cmp"))
            (cmp.setup
              { :mapping
                  { "<CR>" (cmp.mapping.confirm { "select" false })
                    "<Tab>" (cmp.mapping.select_next_item)
                  }
                :sources
                  (cmp.config.sources
                    [ {:name "nvim_lsp"}
                      {:name "buffer"}
                    ]
                  )
              }
            )
          )
      }

      ; better quickfix with preview
      { :url "https://github.com/kevinhwang91/nvim-bqf"
        :tag "v1.1.0"
        :ft "qf"
        :config
          (fn []
            (local bqf (require "bqf"))
            (bqf.setup)
          )
      }

      ; status line
      { :url "https://github.com/nvim-lualine/lualine.nvim"
        :commit "84ffb80e452d95e2c46fa29a98ea11a240f7843e"
        :config (require "config-lualine")
      }

      ; fuzzy search source code, files, etc
      { :url "https://github.com/junegunn/fzf"
        :commit "96670d5f16dcf23d590eb1d83d1de351b2e8fb15"
        :event "VeryLazy" ; defer loading until way after UI
        :config
          (fn []
            (set vim.g.fzf_layout { :window { :height 0.95 :width 0.95 } })
          )
      }
      { :url "https://github.com/junegunn/fzf.vim"
        :commit "d5f1f8641b24c0fd5b10a299824362a2a1b20ae0"
        :dependencies [ "fzf" ]
        :event "VeryLazy" ; defer loading until way after UI
        :config
          (fn []
            (local fzf-vim-buffers (. vim.fn "fzf#vim#buffers"))
            (local fzf-vim-files (. vim.fn "fzf#vim#files"))
            (local fzf-vim-gitfiles (. vim.fn "fzf#vim#gitfiles"))
            (local fzf-vim-with-preview (. vim.fn "fzf#vim#with_preview"))

            (local opts1 (fzf-vim-with-preview { :options [ "--info=inline" "--layout=reverse" ] } "down:60%"))

            ; If the buffer is already open in another tab or window, jump to it
            (set vim.g.fzf_buffers_jump 1)

            ; Space-f ("find") the word under the cursor
            (nmap "<Space>f" ":Rg <C-r><C-w><CR>")

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
      }

      ; nix syntax highlighting - 22-12-14
      { :url "https://github.com/LnL7/vim-nix"
        :commit "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee"
        :ft "nix"
      }

      ; Show markers every 2 columns of leading whitespace
      { :url "https://github.com/lukas-reineke/indent-blankline.nvim"
        :tag "v2.20.4"
        :config
          (fn []
            (local plugin (require "indent_blankline"))
            (plugin.setup { :show_current_context true })
          )
      }

      ; lsp configs
      ; TODO get rid of these, just configure myself
      { :url "https://github.com/neovim/nvim-lsp"
        :commit "2c70b7b0095b4bbe55aaf0dc27a2581d1cafe491"
      }

      ; Haskell syntax highlighting
      ; Does treesitter obviate this?
      { :url "https://github.com/neovimhaskell/haskell-vim"
        :commit "f35d02204b4813d1dbe8b0e98cc39701a4b8e15e"
        :ft "haskell"
      }

      ; :Git
      { :url "https://github.com/tpope/vim-fugitive"
        :tag "v3.7"
        :cmd "Git" ; don't load until we run :Git
        :config (fn [] nil)
      }

      { :url "https://github.com/nvim-lua/lsp-status.nvim"
        :commit "4073f766f1303fb602802075e558fe43e382cc92"
      }

      ; treesitter
      { :url "https://github.com/nvim-treesitter/nvim-treesitter"
        :tag "v0.8.5.2"
        :build ":TSUpdate"
        :config
          (fn []
            (local treesitter (require "nvim-treesitter.configs"))
            (treesitter.setup
              { :highlight { :enable true }
              }
            )
          )
      }

      ; fancy notifications (not sure if any of my plugins use this)
      ; we do want this loaded right away
      { :url "https://github.com/rcarriga/nvim-notify"
        :tag "v3.11.0"
        :config
          (fn []
            (local notify (require "notify"))
            (notify.setup
              { :stages "static" ; don't animate, it looks janky
              }
            )
            (set vim.notify notify)
          )
      }

      ; automatically unhighlight when cursor moves
      { :url "https://github.com/romainl/vim-cool"
        :commit "27ad4ecf7532b750fadca9f36e1c5498fc225af2"
        :event "VeryLazy" ; defer loading until way after UI
      }

      ; nice low-contrast fork of gruvbox color scheme
      { :url "https://github.com/sainnhe/gruvbox-material"
        :commit "a6c5f652788b36c6ff2a0fdbefa271cb46f8f5e7"
        ; the lazy.nvim readme recommends colorscheme plugins load first
        :priority 1000
      }

      ; swap the location of two selections
      { :url "https://github.com/tommcdo/vim-exchange"
        :commit "784d63083ad7d613aa96f00021cd0dfb126a781a"
        :config (fn [] nil)

      }

      ; improved "ga" for information about the character under the cursor
      { :url "https://github.com/tpope/vim-characterize"
        :commit "885a00a3c21dd52ca8f2fd7d62850134934179d9"
        :keys [ [ "ga" ] ] ; defer loading until I press ga
        :config
          (fn []
            (nmap "ga" "<Plug>(characterize)")
          )
      }

      ; quick (un-)commenting
      { :url "https://github.com/tpope/vim-commentary"
        :commit "627308e30639be3e2d5402808ce18690557e8292"
        :event "VeryLazy" ; defer loading until way after UI
        :config (fn [] nil)
      }

      ; make "." repeat more things out of the box
      { :url "https://github.com/tpope/vim-repeat"
        :commit "24afe922e6a05891756ecf331f39a1f6743d3d5a"
        :event "VeryLazy" ; defer loading until way after UI
      }

      ; some surround helpers
      { :url "https://github.com/tpope/vim-surround"
        :commit "aeb933272e72617f7c4d35e1f003be16836b948d"
        :event "VeryLazy" ; defer loading until way after UI
      }

      ; show lsp error under cursor in virtual text block
      { :url "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
        :commit "dcff567b3a2d730f31b6da229ca3bb40640ec5a6"
        :config
          (fn []
            (local lsp_lines (require "lsp_lines"))
            (lsp_lines.setup)
          )
      }

      { :url "https://github.com/dstein64/vim-startuptime"
        :tag "v4.4.0"
        :cmd "StartupTime" ; defer loading until I run :StartupTime
        :config (fn [] nil)
      }

      ; some lua utils that other plugins want:
      ;   - harpoon
      ; { :url "https://github.com/nvim-lua/plenary.nvim"
      ;   :tag "v0.1.3"
      ;   :config (fn [] nil)
      ;   :event "VeryLazy" ; defer loading until way after UI
      ; }

      ; { :url "https://github.com/ThePrimeagen/harpoon"
      ;   :commit "f7040fd0c44e7a4010369136547de5604b9c22a1"
      ;   :config
      ;     (fn []
      ;       (local harpoon (require "harpoon"))
      ;       (local harpoon-mark (require "harpoon.mark"))
      ;       (local harpoon-ui (require "harpoon.ui"))
      ;       (vim.keymap.set "n" "<Space>p" harpoon-mark.add_file)
      ;       (vim.keymap.set "n" "<Space>P" harpoon-ui.toggle_quick_menu)
      ;       (vim.keymap.set "n" "1" (fn [] (harpoon-ui.nav_file 1)))
      ;       (vim.keymap.set "n" "2" (fn [] (harpoon-ui.nav_file 2)))
      ;       (vim.keymap.set "n" "3" (fn [] (harpoon-ui.nav_file 3)))
      ;       (vim.keymap.set "n" "4" (fn [] (harpoon-ui.nav_file 4)))
      ;       (vim.keymap.set "n" "5" (fn [] (harpoon-ui.nav_file 5)))
      ;       (harpoon.setup
      ;         { :menu
      ;             { :width 80
      ;             }
      ;         }
      ;       )
      ;     )
      ;   :event "VeryLazy" ; defer loading until way after UI
      ; }
    ]
  )
)

; (vim.cmd "Plug 'nvim-lua/popup.nvim', { 'commit': '5e3bece7b4b4905f4ec89bee74c09cfd8172a16a' }")

; (vim.cmd "Plug 'nvim-telescope/telescope.nvim', { 'commit': '5b597e7709eec08331ce71b45193117f6fb5626b' }")

; git blame the line under the cursor
; (vim.cmd "Plug 'rhysd/git-messenger.vim', { 'commit': '2e67899355f3f631aad6845925e4c2c13546444d' }")

; vim quickfix improvements
; (vim.cmd "Plug 'romainl/vim-qf', { 'commit': '65f115c350934517382ae45198a74232a9069c2a' }")

; multiple cursors for quick and dirty renaming
; (vim.cmd "Plug 'terryma/vim-multiple-cursors', { 'commit': '6456718e1d30b42c04b920c5413ca44f68f08759' }")

; case-preserving search-and-replace with e.g. %Subvert/Foo/Bar/g (foo -> bar, FOO -> BAR, etc)
; 22-11-01
; (vim.cmd "Plug 'tpope/vim-abolish', { 'commit': '3f0c8faadf0c5b68bcf40785c1c42e3731bfa522' }")

; colorscheme settings
(set vim.g.gruvbox_material_background "soft") ; soft, medium, hard
(set vim.g.gruvbox_material_better_performance 1) ; what
; (set vim.g.gruvbox_material_enable_bold 1) ; this makes functions bold, which is kinda weird
(set vim.g.gruvbox_material_enable_italic 1)
(vim.cmd "colorscheme gruvbox-material")

; neovimhaskell/haskell-vim
(set vim.g.haskell_enable_backpack 1)
(set vim.g.haskell_enable_pattern_synonyms 1)
(set vim.g.haskell_enable_quantification 1)
(set vim.g.haskell_enable_recursivedo 1)
(set vim.g.haskell_enable_static_pointers 1)
(set vim.g.haskell_enable_typeroles 1)
(set vim.g.haskell_indent_disable 1)

; rhysd/git-messenger.vim
(set vim.g.git_messenger_always_into_popup true)
(set vim.g.git_messenger_extra_blame_args "-w")
(set vim.g.git_messenger_no_default_mappings true)
; blame the line under the cursor
(nmap "<Space>b" "<Plug>(git-messenger)")

; tommcdo/vim-exchange
(set vim.g.exchange_no_mappings 1) ; Don't make any key mappings
; x ("exchange") once to yank, x again to exchange with the first yank
(vim.keymap.set [ "n" "v" ] "x" "<Plug>(Exchange)")
; Manually make exhange replace 'w' with 'e', as vim does for e.g. 'c'
(nmap "xw" "<Plug>(Exchange)e")
(nmap "xW" "<Plug>(Exchange)E")
(nmap "xx" "m`<Plug>(ExchangeLine)``") ; exchange the entire line
(nmap "X" "<Plug>(Exchange)$") ; exchange from here to the end of line
(nmap "xc" "<Plug>(ExchangeClear)") ; clear the exchange highlight

; tpope/vim-commentary
(nmap "-" "m`<Plug>CommentaryLine``")
(vim.keymap.set "v" "-" "<Plug>Commentary")

; tpope/vim-surround
(set vim.g.surround_no_mappings 1) ; don't let surround map anything

(include "mappings")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Autocommands

(vim.api.nvim_create_augroup "mitchellwrosen" {})

(macro create-autocmd [events opts callback]
  (tset opts "callback" callback)
  (tset opts "group" "mitchellwrosen")
  `(vim.api.nvim_create_autocmd ,events ,opts)
)

; Restore cursor position on open
; Cribbed from https://github.com/neovim/neovim/issues/16339#issuecomment-1457394370
(create-autocmd
  "BufRead"
  {}
  (fn [opts]
    (create-autocmd
      "BufWinEnter"
      { :once true
        :buffer opts.buf
      }
      (fn []
        (local last_known_line (. (vim.api.nvim_buf_get_mark opts.buf "\"") 1))
        (when (and (> last_known_line 1) (<= last_known_line (vim.api.nvim_buf_line_count opts.buf)))
          (vim.api.nvim_feedkeys "g`\"" "x" false)
        )
      )
    )
  )
)

; Disallow edits to read-only files
(create-autocmd "BufReadPost" {} (fn [] (set vim.bo.modifiable (not vim.bo.readonly))))

; Briefly highlight yanks
(create-autocmd "TextYankPost" {} (fn [] (vim.highlight.on_yank { :higroup "IncSearch" :timeout 300 })))

; on cursor hold or focus gained, read the buffer in case it has been modified externally
(create-autocmd
  [ "CursorHold" "FocusGained" ]
  {}
  (fn [] (when (= (vim.fn.getcmdwintype) "") (vim.cmd.checktime)))
)

; Strip trailing whitespace and save the buffer after changing it
(create-autocmd
  [ "InsertLeave" "TextChanged" ]
  {}
  (fn []
    (when (and (= vim.o.buftype "") (not= (vim.api.nvim_buf_get_name 0) ""))
      (local view (vim.fn.winsaveview))
      (vim.cmd "keeppatterns silent! %s/\\s\\+$//e")
      (vim.cmd "silent! update")
      (vim.fn.winrestview view)
    )
  )
)

; try to extract the haskell type signature from the input string, which is assumed to look like:
;
; ```haskell
; runParser :: forall e s a.
; Parsec e s a -> String -> s -> Either (ParseErrorBundle s e) a
; ```
;
; *Defined in ‘Text.Megaparsec’* *(megaparsec-9.3.0)*\
;
;
; * * *
;
; ```haskell
; _ :: Parsec Void Text (Dump, Text)
; -> String
; -> Text
; -> Either (ParseErrorBundle Text Void) (Dump, Text)
; ```
(local extract-haskell-typesig-from-markdown
  (fn [str0]
    (var str str0)
    (var i nil)

    (set i (string.find str "```haskell\n"))
    (when i
      (set str (string.sub str (+ i 11)))
      (set i (string.find str "\n```"))
      (when i
        (set str (string.sub str 1 (- i 1)))
        (set i (string.find str ":: "))
        (when i
          (set str (string.sub str (+ i 3)))
          ; chop off leading forall, if any
          (set i (string.find str "forall"))
          (when (= i 1)
            (set i (string.find str "%.")) ; need to escape '.' in lua pattern
            (set str (string.sub str (+ i 2)))
          )
          ; render entire type on one line
          (set str (string.gsub str "\n" " "))
          ; throw away multiplicity markers (well, multiplicity-1)
          (set str (string.gsub str "%%1 %->" "->")) ; need to escape '%' and '-' in lua pattern
          str
        )
      )
    )
  )
)

; overwrite default hover handler with the same one, but with rounded borders
(tset vim.lsp.handlers "textDocument/hover" (vim.lsp.with vim.lsp.handlers.hover { :border "rounded" }))

(local hover-namespace (vim.api.nvim_create_namespace "hover"))

(create-autocmd
  "LspAttach"
  {}
  (fn [args]
    (local buf args.buf)
    (local client (vim.lsp.get_client_by_id args.data.client_id))

    ; make an autocommand group named e.g. "mitchellwrosenLsp3" for just this buffer, so we can clear it whenever it
    ; gets deleted and re-opend
    (local augroup-name (.. "mitchellwrosenLsp" buf))
    (vim.api.nvim_create_augroup augroup-name {})

    (vim.cmd "highlight LspReference guifg=NONE guibg=#665c54 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59")
    (vim.cmd "highlight! link LspReferenceText LspReference")
    (vim.cmd "highlight! link LspReferenceRead LspReference")
    (vim.cmd "highlight! link LspReferenceWrite LspReference")

    (nmap "<Space>a" vim.lsp.buf.code_action { :buffer buf :silent true })
    (nmap "gd" vim.lsp.buf.definition { :buffer buf :silent true })
    (nmap "<Space>d" vim.lsp.buf.format { :buffer buf :silent true })
    (nmap "<Enter>" vim.lsp.buf.hover { :buffer buf :silent true })
    (nmap "<Space>i" vim.lsp.buf.incoming_calls { :buffer buf :silent true })
    (nmap "<Space>u" vim.lsp.buf.outgoing_calls { :buffer buf :silent true })
    (nmap "<Space>r" vim.lsp.buf.references { :buffer buf :silent true })
    (nmap "<Space>e" vim.lsp.buf.rename { :buffer buf :silent true })
    (nmap "gt" vim.lsp.buf.type_definition { :buffer buf :silent true })
    ; float=false here means don't call vim.diagnostic.open_float once we land
    (nmap "<Up>" (fn [] (vim.diagnostic.goto_prev { :float false })) { :buffer buf :silent true })
    (nmap "<Down>" (fn [] (vim.diagnostic.goto_next { :float false })) { :buffer buf :silent true })

    (vim.api.nvim_create_autocmd
      "CursorMoved"
      {
        :buffer buf
        :callback
          (fn []
            (when (= (. (vim.api.nvim_get_mode) :mode) "n")
              (when (not= (vim.api.nvim_get_current_line) "")
                ; highlight other occurrences of the thing under the cursor
                ; the colors are determined by LspReferenceText, etc. highlight groups
                (when client.server_capabilities.documentHighlightProvider
                  (vim.lsp.buf.clear_references)
                  (vim.lsp.buf.document_highlight)
                )
                ; try to put a type sig in the virtual text area
                (local position (vim.lsp.util.make_position_params))
                (vim.lsp.buf_request
                  buf
                  "textDocument/hover"
                  position
                  (fn [_err result _ctx _config]
                    (local contents (?. result :contents))
                    (when (and (not (= contents nil)) (= (type contents) "table") (= "markdown" contents.kind))
                      (local line (extract-haskell-typesig-from-markdown contents.value))
                      (vim.api.nvim_buf_clear_namespace buf hover-namespace 0 -1)
                      (when line
                        (vim.api.nvim_buf_set_extmark
                          buf
                          hover-namespace
                          position.position.line
                          0 ; column (ignored unless we set :virt_text_pos to "overlay" below
                          { :virt_text [ [ line "Comment" ] ]
                          }
                        )
                      )
                    )
                  )
                )
              )
            )
          )
        :group augroup-name
      }
    )

    (set vim.bo.omnifunc "v:lua.vim.lsp.omnifunc")
  )
)

; record macro with !, replay macro with 9
(create-autocmd [ "RecordingLeave" "VimEnter" ] {} (fn [] (nmap "!" "qz")))
(create-autocmd "RecordingEnter" {} (fn [] (nmap "!" "q")))
(nmap "9" "@z")

; Start a git commit in insert mode
(create-autocmd "FileType" { :pattern "gitcommit" } (fn [] (vim.cmd.startinsert)))

; neovim's progress handler seems like a bit of a work-in-progress, and I don't think it's a good idea to just
; overwrite it. it currently appends messages to an internal struct, emits a User LspStatusUpdate autocmd, and you can
; react to this by calling vim.lsp.util.get_client_messages, which returns a list of unseen messages
;
; that's all rather weird, so we just hook in here to do our thing (vim.notify progress updates) before passing along
; to the default handler
(do
  (local default-progress-handler (. vim.lsp.handlers "$/progress"))

  ; notifications : map client-id (map token { id : notification-id, start-ms : number, title : string })
  ;
  ; we track the notification-id for each progress update so we can update notifications in-place
  (var notifications {})

  (fn my-progress-handler [err result context config]
    (local client-id context.client_id)
    (local client (vim.lsp.get_client_by_id client-id))
    (if client
      (do
        (local token result.token)
        (local value result.value)
        (var start-ms nil)
        (case value.kind
          "begin"
            (do
              (set start-ms (vim.loop.now))
              (when (not (. notifications client-id)) (tset notifications client-id {}))
              (local
                notification-id
                (vim.notify
                  (..
                    "        | "
                    client.name
                    ":"
                    (if value.title (.. " " value.title) "")
                    (if value.message (.. " " value.message) "")
                  )
                  vim.log.levels.INFO
                  { :render "minimal"
                    :timeout false
                  }
                )
              )
              (tset notifications client-id token { :id notification-id :start-ms start-ms :title value.title })
            )
          "report"
            (do
              (local { :id old-notification-id :title title } (. notifications client-id token))
              (local
                new-notification-id
                (vim.notify
                  (..
                    "        | "
                    client.name
                    ":"
                    (if title (.. " " title) "")
                    (if value.message (.. " " value.message) "")
                  )
                  vim.log.levels.INFO
                  { :replace old-notification-id })
              )
              (tset notifications client-id token :id new-notification-id)
            )
          "end"
            (do
              (local stop-ms (vim.loop.now))
              (local { :id notification-id :start-ms start-ms :title title } (. notifications client-id token))
              (vim.notify
                (..
                  (string.format "%6.2fs" (/ (- stop-ms start-ms) 1000))
                  " | "
                  client.name
                  ":"
                  (if title (.. " " title) "")
                  (if value.message (.. " " value.message) "")
                )
                vim.log.levels.INFO
                { :replace notification-id
                  :timeout (if (< (- stop-ms start-ms) 100) 0 3000)
                }
              )
              (tset notifications client-id token nil)
            )
        )
      )
      ; TODO
      (print "client died")
    )

    (default-progress-handler err result context config)
  )
  (tset vim.lsp.handlers "$/progress" my-progress-handler)
)

; lsp capabilities: defaults plus whatever cmp_nvim_lsp wants to say it can do
(local lsp-capabilities
  (do
    (local cmp-nvim-lsp (require "cmp_nvim_lsp"))
    (cmp-nvim-lsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))
  )
)

; seems-like-haskell-project returns true if there's a "cabal.project", "stack.yaml", or "*.cabal" file here
(macro seems-like-haskell-project []
  `(accumulate [acc# false name# typ# (vim.fs.dir ".") &until acc#]
    (or
      (and
        (= typ# "file")
        (or
          (= name# "cabal.project")
          (= name# "stack.yaml")
          (string.match name# "%.cabal$")
        )
      )
      acc#
    )
  )
)
(create-autocmd
  "FileType"
  { :pattern "haskell" }
  (fn []
    (when (seems-like-haskell-project)
      (var initialize-notification-id nil)
      (var start-ms nil)
      (vim.lsp.start
        { :before_init
            (fn [_ _]
              (set start-ms (vim.loop.now))
              (set
                initialize-notification-id
                (vim.notify
                  "        | hls: Initializing"
                  vim.log.levels.INFO
                  { :render "minimal"
                    :timeout false
                  }
                )
              )
            )
          :capabilities lsp-capabilities
          :cmd ["haskell-language-server-wrapper" "--lsp"]
          ; :cmd ["haskell-language-server-wrapper" "--lsp" "--debug" "--logfile" "/home/mitchell/hls.txt"]
          :name "hls"
          :on_init
            (fn [_ _]
              (local stop-ms (vim.loop.now))
              (vim.notify
                (.. (string.format "%6.2fs" (/ (- stop-ms start-ms) 1000)) " | hls: Initialized")
                vim.log.levels.INFO
                { :replace initialize-notification-id
                  :timeout 3000
                }
              )
            )
          :root_dir "."
          :settings
            { :haskell
                { :formattingProvider "ormolu"
                  :plugin
                    { :hlint { :globalOn false }
                      :stan { :globalOn false } ; FUCK stan. all my homies HATE stan
                    }
                }
            }
        }
      )
    )
  )
)

(create-autocmd
  "TermOpen"
  {}
  (fn []
    ; Esc to get into normal mode from a terminal
    (vim.keymap.set "t" "<Esc>" "<C-\\><C-n>" { :buffer true })
    ; Even in normal mode, send Ctrl+c to the terminal
    (nmap "<C-c>" "i<C-c>" { :buffer true })

    ; Start in insert mode
    (vim.cmd.startinsert)
  )
)

; restore Session.vim it it exists and and no args were provided to vim
; resources to look at later and make this better:
;   https://vim.fandom.com/wiki/Go_away_and_come_back
;   https://stackoverflow.com/questions/9281438/syntax-highlighting-doesnt-work-after-restore-a-previous-vim-session
;   https://github.com/Shatur/neovim-session-manager/blob/master/lua/session_manager/utils.lua
(create-autocmd
  "VimEnter"
  { :nested true ; fire more autocomands triggered by loading the session, like BufEnter etc
  }
  (fn []
    (when
      (and
        (= (vim.fn.argc) 0)
        (file-exists "Session.vim")
      )
      (vim.cmd { :cmd "source" :args [ "Session.vim" ] :mods { :silent true } })
    )
  )
)

(do
  (local lsp (require "lspconfig"))
  (local status (require "lsp-status"))

  (local capabilities
    (lambda [config]
      (local cmp-nvim-lsp (require "cmp_nvim_lsp"))
      (cmp-nvim-lsp.update_capabilities
        (vim.tbl_extend
          "keep"
          (or config.capabilities {})
          status.capabilities
        )
      )
    )
  )

  (vim.diagnostic.config
    { :float
        { ; require cursor to be over diagnostic in order to open a float window of it
          :scope "cursor"
          ; remove the default "Diagnostics:" header
          :header ""
        }
      ; only underline errors
      :underline { "severity" vim.diagnostic.severity.ERROR }
      ; the lsp_lines plugin seems to want to configure itself by making up a new `virtual_lines` key in
      ; `vim.diagnostic.config`. seems stupid as hell but here we are.
      :virtual_lines { :only_current_line true }
      ; don't put diagnostics inline
      :virtual_text false
    }
  )

  (lsp.elmls.setup
    { :capabilities (capabilities lsp.elmls)
      :on_attach
        (lambda [client buf]
          ; https://github.com/elm-tooling/elm-language-server/issues/503
          (when client.config.flags (set client.config.flags.allow_incremental_sync true))
        )
    }
  )

  (lsp.sumneko_lua.setup
    { :capabilities (capabilities lsp.sumneko_lua)
    }
  )
)
