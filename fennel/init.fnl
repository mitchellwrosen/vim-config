(include "fennel/nvim")
(import-macros
  { :left-merge left-merge
    :map map
  }
  "fennel/nvim-macros"
)

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
        :event "InsertEnter" ; defer loading of this plugin until insert mode is entered
        :config
          (fn [_ _]
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
          (fn [_ _]
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
          (fn [_ _]
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

      ; status line
      { :url "https://github.com/nvim-lualine/lualine.nvim"
        :commit "84ffb80e452d95e2c46fa29a98ea11a240f7843e"
        :config
          (fn [_ _]
            (local lualine (require "lualine"))
            (lualine.setup
              { :component_separators ""
                :icons_enabled false
                :section_separators ""
                :sections
                  { :lualine_a [ "mode" ]
                    :lualine_b [ "branch" "diff" "diagnostics" ]
                    :lualine_c [ "filename" ]
                    :lualine_x [ "filetype" ]
                    :lualine_y [ "progress" ]
                    :lualine_z [ "location" ]
                  }
                :tabline
                  { :lualine_a
                       [ { 1 "buffers"
                           :show_filenames_only true
                         }
                       ]
                    :lualine_b [ ]
                    :lualine_c [ ]
                    :lualine_x [ ]
                    :lualine_y [ ]
                    :lualine_z [ ]
                  }
              }
            )
          )
      }

      ; fuzzy search source code, files, etc
      { :url "https://github.com/junegunn/fzf"
        :commit "6dcf5c3d7d6c321b17e6a5673f1533d6e8350462"
      }
      { :url "https://github.com/junegunn/fzf.vim"
        :commit "d5f1f8641b24c0fd5b10a299824362a2a1b20ae0"
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
          (fn [_ _]
            (local plugin (require "indent_blankline"))
            (plugin.setup { :show_current_context true })
          )
      }

      ; lsp configs
      { :url "https://github.com/neovim/nvim-lsp"
        :commit "2c70b7b0095b4bbe55aaf0dc27a2581d1cafe491"
      }

      ; Haskell syntax highlighting
      ; Does treesitter obviate this?
      { :url "https://github.com/neovimhaskell/haskell-vim"
        :commit "f35d02204b4813d1dbe8b0e98cc39701a4b8e15e"
        :ft "haskell"
      }

      { :url "https://github.com/nvim-lua/lsp-status.nvim"
        :commit "4073f766f1303fb602802075e558fe43e382cc92"
      }

      ; treesitter
      { :url "https://github.com/nvim-treesitter/nvim-treesitter"
        :tag "v0.8.5.2"
        :build ":TSUpdate"
        :config
          (fn [_ _]
            (local treesitter (require "nvim-treesitter.configs"))
            (treesitter.setup
              { :highlight { :enable true }
              }
            )
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
        :config (fn [_ _] nil)

      }

      ; improved "ga" for information about the character under the cursor
      { :url "https://github.com/tpope/vim-characterize"
        :commit "885a00a3c21dd52ca8f2fd7d62850134934179d9"
        :event "VeryLazy" ; defer loading until way after UI
      }

      ; quick (un-)commenting
      { :url "https://github.com/tpope/vim-commentary"
        :commit "627308e30639be3e2d5402808ce18690557e8292"
        :event "VeryLazy" ; defer loading until way after UI
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
          (fn [_ _]
            (local lsp_lines (require "lsp_lines"))
            (lsp_lines.setup)
          )
      }
    ]
  )
)

; (vim.cmd "Plug 'kevinhwang91/nvim-bqf', { 'commit': '46e6469fb1ef90d475fb43c56e0eeb81eacf08dd' }")

; (vim.cmd "Plug 'nvim-lua/plenary.nvim', { 'commit': '8bae2c1fadc9ed5bfcfb5ecbd0c0c4d7d40cb974' }")
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

; (vim.cmd "Plug 'tpope/vim-fugitive', { 'commit': 'bb4f9e660b0934f70af693c56c5b8a4c322e7a1f' }")

; ((. vim.fn "plug#end"))

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; lightline

; TODO move configs from vim

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
; this would be nice, but unsuccessful search prompts to press enter
; https://github.com/neovim/neovim/issues/20380
; (set vim.o.cmdheight 0) ; don't waste a line on command
(set vim.o.clipboard "unnamed,unnamedplus") ; yank also copies to both clipboards
(set vim.o.completeopt "menuone,noinsert,noselect") ; sane completion behavior...
(set vim.o.grepprg "rg --vimgrep") ; use rg to grep
(set vim.o.hidden true) ; don't abandon out-of-sight buffers
(set vim.o.ignorecase true) ; case-insensitive searching
(set vim.o.inccommand "split") ; show live command substitutions
(set vim.o.joinspaces false) ; insert one space after ., ?, ! chars when joining
(set vim.o.lazyredraw true) ; don't draw during e.g. applying a macro
(set vim.o.listchars "tab:> ,trail:·,nbsp:+") ; trailing whitespace markers
(set vim.o.mouse "") ; disable mouse
(set vim.o.report 0) ; always repeat the number of lines changed
(set vim.o.scrolloff 15) ; start scrolling before the cursor reaches the edge
(set vim.o.shiftround true) ; shift to multiple of shiftwidth
(set vim.o.shortmess "filnxtToOFIc")
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
(set vim.wo.colorcolumn "120")
(set vim.wo.cursorline true) ; higlight the current line
(set vim.wo.foldenable false) ; never fold
(set vim.wo.list true) ; show trailing whitespace, tabs, etc.
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
(set-bo "synmaxcol" 3000) ; dont bother syntax-highlighting past this column
(set-bo "softtabstop" 2)

(include "fennel/mappings")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Autocommands

(vim.api.nvim_create_augroup "mitchellwrosen" {})

; Restore cursor position on open
; Cribbed from https://github.com/neovim/neovim/issues/16339#issuecomment-1457394370
(vim.api.nvim_create_autocmd
  "BufRead"
  { :callback
      (fn [opts]
        (vim.api.nvim_create_autocmd
          "BufWinEnter"
          { :once true
            :buffer opts.buf
            :callback
              (fn []
                (local last_known_line (. (vim.api.nvim_buf_get_mark opts.buf "\"") 1))
                (when (and (> last_known_line 1) (<= last_known_line (vim.api.nvim_buf_line_count opts.buf)))
                  (vim.api.nvim_feedkeys "g`\"" "x" false)
                )
              )
          }
        )
      )
  }
)

; Disallow edits to read-only files
(vim.api.nvim_create_autocmd
  "BufReadPost"
  { :callback (fn [] (set vim.bo.modifiable (not vim.bo.readonly)))
    :group "mitchellwrosen"
  }
)

; Briefly highlight yanks
(vim.api.nvim_create_autocmd
  "TextYankPost"
  { :callback (fn [] (vim.highlight.on_yank { :higroup "IncSearch" :timeout 300 }))
    :group "mitchellwrosen"
  }
)

; on cursor hold or focus gained, read the buffer in case it has been modified externally
(vim.api.nvim_create_autocmd
  [ "CursorHold" "FocusGained" ]
  { :callback
      (fn []
        (when
          (= (vim.fn.getcmdwintype) "")
          (vim.cmd "checktime"))
      )
    :group "mitchellwrosen"
  }
)

; Save the buffer after changing it
(vim.api.nvim_create_autocmd
  [ "InsertLeave" "TextChanged" ]
  { :callback
      (fn []
        (when
          (and (= vim.o.buftype "") (not= (vim.api.nvim_buf_get_name 0) ""))
          (vim.cmd "silent! update")))
    :group "mitchellwrosen"
  }
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

(vim.api.nvim_create_autocmd
  "LspAttach"
  { :callback
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

        (vim.keymap.set "n" "<Space>a" vim.lsp.buf.code_action { :buffer buf :silent true })
        (vim.keymap.set "n" "gd" vim.lsp.buf.definition { :buffer buf :silent true })
        (vim.keymap.set "n" "<Space>d" vim.lsp.buf.format { :buffer buf :silent true })
        (vim.keymap.set "n" "<Enter>" vim.lsp.buf.hover { :buffer buf :silent true })
        (vim.keymap.set "n" "<Space>i" vim.lsp.buf.incoming_calls { :buffer buf :silent true })
        (vim.keymap.set "n" "<Space>u" vim.lsp.buf.outgoing_calls { :buffer buf :silent true })
        (vim.keymap.set "n" "<Space>r" vim.lsp.buf.references { :buffer buf :silent true })
        (vim.keymap.set "n" "<Space>e" vim.lsp.buf.rename { :buffer buf :silent true })
        (vim.keymap.set "n" "gt" vim.lsp.buf.type_definition { :buffer buf :silent true })
        ; float=false here means don't call vim.diagnostic.open_float once we land
        (vim.keymap.set "n" "<Up>" (fn [] (vim.diagnostic.goto_prev { :float false })) { :buffer buf :silent true })
        (vim.keymap.set "n" "<Down>" (fn [] (vim.diagnostic.goto_next { :float false })) { :buffer buf :silent true })

        (vim.api.nvim_create_autocmd
          "CursorMoved"
          {
            :buffer buf
            :callback
              (fn []
                (when (= (. (vim.api.nvim_get_mode) :mode) "n")
                  (local position (vim.lsp.util.make_position_params))
                  ; highlight other occurrences of the thing under the cursor
                  ; the colors are determined by LspReferenceText, etc. highlight groups
                  (when client.server_capabilities.documentHighlightProvider
                    (vim.lsp.buf.clear_references)
                    (vim.lsp.buf.document_highlight)
                  )
                  ; try to put a type sig in the virtual text area
                  (vim.lsp.buf_request buf "textDocument/hover" position
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
                            1 ; column (ignored unless we set :virt_text_pos to "overlay" below
                            { :virt_text [ [ (.. "∙ " line) "Comment" ] ]
                            }
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
      )
    :group "mitchellwrosen"
  }
)

; record macro with 1, replay macro with 9
(vim.api.nvim_create_autocmd
  [ "RecordingLeave" "VimEnter" ]
  { :callback (fn [] (vim.keymap.set "n" "1" "qz"))
    :group "mitchellwrosen"
  }
)
(vim.api.nvim_create_autocmd
  "RecordingEnter"
  { :callback (fn [] (vim.keymap.set "n" "1" "q"))
    :group "mitchellwrosen"
  }
)
(vim.keymap.set "n" "9" "@z")

; Start a git commit in insert mode
(vim.api.nvim_create_autocmd
  "FileType"
  { :command "startinsert"
    :group "mitchellwrosen"
    :pattern "gitcommit"
  }
)

; Start a terminal in insert mode
(vim.api.nvim_create_autocmd
  "TermOpen"
  { :command "startinsert"
    :group "mitchellwrosen"
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
      ; (local augroup-name (.. "mitchellwrosenLsp" buf))

      ; Format on save and on leaving insert mode
      ; commented out temporarily because it's a little bit slow on the unison codebase
      ; (autocmd augroup-name ["BufWritePre" "InsertLeave"] "<buffer>" (fn [] (vim.lsp.buf.formatting_sync nil 1000)))

      ; keymaps were here
      (set vim.bo.omnifunc "v:lua.vim.lsp.omnifunc")
    )
  )

  ; Uh, just kind of following https://github.com/nvim-lua/lsp-status.nvim here...
  (status.register_progress)

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
          (on-attach client buf))
    })

  (lsp.hls.setup
    { :capabilities (capabilities lsp.hls)
      :cmd ["haskell-language-server-wrapper" "--lsp"]
      ; :cmd ["haskell-language-server-wrapper" "--lsp" "--debug" "--logfile" "/home/mitchell/hls.txt"]
      :settings {
        :haskell {
          :formattingProvider "ormolu"
          :plugin {
            :hlint { :globalOn false }
            :stan { "globalOn" false }
          }
          ; max number of completions sent to client at one time
          ; :maxCompletions 20
        }
      }
      :on_attach on-attach })

  (lsp.sumneko_lua.setup
    { :capabilities (capabilities lsp.sumneko_lua)
      :on_attach on-attach
    }
  )
)

; Run the given command in a centered floating terminal.
(lambda run-floating [command]
  (let [buf (vim.api.nvim_create_buf false true)
        columns vim.o.columns
        lines vim.o.lines
        height (math.floor (+ (* lines 0.8) 0.5))
        row (math.floor (+ (/ (- lines height) 2) 0.5))
        width (math.floor (+ (* columns 0.8) 0.5))
        col (math.floor (+ (/ (- columns width) 2) 0.5))
        win
          (vim.api.nvim_open_win
            buf
            true
            { :col col
              :height height
              :relative "editor"
              :row row
              :style "minimal"
              :width width
            }
          )
        ]
    (vim.fn.termopen command { :on_exit (lambda [] (vim.cmd (.. "bw! " buf))) })
    ; Awkward, undo the remapping of <Esc> to <C-\><C-n> in init.vim
    (vim.api.nvim_buf_set_keymap buf "t" "<Esc>" "<Esc>" { :noremap true :nowait true :silent true })
    win))

{ :run_floating run-floating
  :virtual_hover virtual-hover
}
