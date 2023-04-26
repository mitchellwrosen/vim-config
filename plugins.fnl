(import-macros { : nmap } "nvim-stdlibm")

;; bootstrap lazy.nvim

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

    { :url "https://github.com/folke/which-key.nvim"
      :tag "v1.4.0"
      :event "VeryLazy" ; defer loading until way after UI
      :config
        (fn []
          (local which-key (require "which-key"))

          (which-key.setup
            { :icons
                { :separator ""
                }
              :plugins
                { :marks true
                  :presets
                    { :g false
                      :motions false
                      :nav false
                      :operators false
                      :text_objects false
                      :windows false
                      :z false
                    }
                  :registers true
                  :spelling { :enabled false }
                }
              :window
                { :border "single"
                  :margin [ 0 0 0 0 ]
                  :padding [ 0 0 0 0 ]
                }
            }
          )

          (which-key.register
            { :mode [ "n" "v" ]
              "<Space>l" { :name "+LSP" }
            }
          )

          ; this has to go *after* setup because which-key sucks ass and overwrites mappings
          ; setting "marks = false" doesn't work; it just disables the mark feature entirely
          (nmap "'" (fn [] (which-key.show "`" { :auto true :mode "n" })))
        )
    }

    { :url "https://github.com/ziglang/zig.vim"
      :commit "a0d9adedafeb1a33a0159d16ddcdf194b7cea881"
      :ft "zig"
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

; tpope/vim-commentary
(nmap "-" "m`<Plug>CommentaryLine``")
(vim.keymap.set "v" "-" "<Plug>Commentary")

; tpope/vim-surround
(set vim.g.surround_no_mappings 1) ; don't let surround map anything
