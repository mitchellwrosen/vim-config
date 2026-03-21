(import-macros { : nmap } "nvim-stdlibm")

;; disable some built-in plugins

(set vim.g.loaded_2html_plugin true)
(set vim.g.loaded_man true)
(set vim.g.loaded_tutor_mode_plugin true)
(set vim.g.loaded_zipPlugin true)

;; bootstrap lazy.nvim

(do
  (local lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim"))
  (when (not (vim.loop.fs_stat lazypath))
    (vim.fn.system
      [ "git"
        "clone"
        "--filter=blob:none"
        "https://github.com/folke/lazy.nvim"
        "--branch=v11.17.5"
        lazypath
      ]
    )
  )
  (vim.opt.rtp:prepend lazypath)
)

(local lazy (require "lazy"))

(lazy.setup
  [
    ; basic language syntax highlighting, indent, keywords, etc. (does treesitter kinda obviate these?)
    {
      :name "fennel"

      :commit "30b9beabad2c4f09b9b284caf5cd5666b6b4dc89"
      :config (fn [] nil)
      :ft "fennel"
      :url "https://github.com/bakpakin/fennel.vim"
    }
    {
      :name "haskell"

      :commit "f35d02204b4813d1dbe8b0e98cc39701a4b8e15e"
      :config (fn [] nil)
      :ft "haskell"
      :url "https://github.com/neovimhaskell/haskell-vim"
    }
    {
      :name "nix"

      :commit "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee"
      :config (fn [] nil)
      :ft "nix"
      :url "https://github.com/LnL7/vim-nix"
    }
    {
      :name "zig"

      :commit "366ef4855d22fd1377b81c382542466475b73a01"
      :config (fn [] nil)
      :ft "zig"
      :url "https://codeberg.org/ziglang/zig.vim"
    }

    ; better quickfix with preview
    {
      :name "bqf"

      :config (include "config-nvim-bqf")
      :ft "qf"
      :tag "v1.1.0"
      :url "https://github.com/kevinhwang91/nvim-bqf"
    }

    ; improved "ga" for information about the character under the cursor
    {
      :name "characterize"

      :commit "885a00a3c21dd52ca8f2fd7d62850134934179d9"
      :config (include "config-characterize")
      :keys [ [ "ga" ] ]
      :url "https://github.com/tpope/vim-characterize"
    }

    ; {
    ;   :name "cmp"

    ;   :commit "v0.0.2"
    ;   :config (include "config-nvim-cmp")
    ;   :dependencies [ "cmp-buffer" "cmp-lsp" ]
    ;   :event "InsertEnter"
    ;   :url "https://github.com/hrsh7th/nvim-cmp"
    ; }
    ; {
    ;   :name "cmp-buffer"

    ;   :commit "b74fab3656eea9de20a9b8116afa3cfc4ec09657" ; 2025-10-17
    ;   :lazy true
    ;   :url "https://github.com/hrsh7th/cmp-buffer"
    ; }
    ; {
    ;   :name "cmp-lsp"

    ;   :commit "bd5a7d6db125d4654b50eeae9f5217f24bb22fd3" ; 2025-10-17
    ;   :lazy true
    ;   :url "https://github.com/hrsh7th/cmp-nvim-lsp"
    ; }

    {
      :name "blink.cmp"

      :config (include "config-blink")
      :tag "v1.10.1"
      :url "https://github.com/saghen/blink.cmp"
    }

    ; quick (un-)commenting
    {
      :name "commentary"

      :commit "627308e30639be3e2d5402808ce18690557e8292"
      :config (fn [] nil)
      :event "VeryLazy"
      :url "https://github.com/tpope/vim-commentary"
    }

    ; automatically unhighlight when cursor moves
    {
      :name "cool"

      :commit "80536b9f2e23292708a64f2e7bcf5e596f9faf24"
      :config (fn [] nil)
      :event "VeryLazy"
      :url "https://github.com/romainl/vim-cool"
    }

    ; highlight colorcolumn in insert mode
    {
      :name "deadcolumn"

      :commit "8140fd7cface9592a44b3151203fc6ca95ad9598"
      :config (include "config-deadcolumn")
      :event "InsertEnter"
      :url "https://github.com/Bekaboo/deadcolumn.nvim"
    }

    ; :Git
    {
      :name "fugitive"

      :cmd "Git"
      :config (fn [] nil)
      :tag "v3.7"
      :url "https://github.com/tpope/vim-fugitive"
    }

    ; nice low-contrast fork of gruvbox color scheme [2023-05-08]
    ; the lazy.nvim readme recommends colorscheme plugins load first
    {
      :name "gruvbox-material"

      :commit "834dbf21836862300ced7444db4262b796330ab7" ; 2025-10-16
      :priority 1000
      :url "https://github.com/sainnhe/gruvbox-material"
    }

    ; fuzzy search source code, files, etc
    {
      :name "fzf"

      :commit "v0.70.0"
      :config (include "config-fzf")
      :event "VeryLazy"
      :url "https://github.com/junegunn/fzf"
    }
    {
      :name "fzf-vim"

      :commit "879db51d0965515cdaef9b7f6bdeb91c65d2829e" ; 2025-10-17
      :config (include "config-fzf-vim")
      :dependencies [ "fzf" ]
      :event "VeryLazy"
      :url "https://github.com/junegunn/fzf.vim"
    }

    ; Show markers every 2 columns of leading whitespace
    {
      :name "indent-blankline"

      :main "ibl"
      :opts {
        :indent {
          :char [ "│" "┊" ]
        }
      }
      :tag "v3.9.1"
      :url "https://github.com/lukas-reineke/indent-blankline.nvim"
    }

    ; use 's' to move far away
    {
      :name "leap"

      :commit "774c452da3521d4434f912b6ca6dd97318aca4b0" ; 2026-03-20
      :config (include "config-leap")
      :url "https://codeberg.org/andyg/leap.nvim"
    }

    ; remote text objects (e.g. cirw change inner remote word)
    {
      :name "spooky"

      :commit "b02df5a81ab22c9ede5caecc227f8b6cbe67940f"
      :config (include "config-spooky")
      :dependencies [ "leap" ]
      :event "VeryLazy"
      :url "https://github.com/ggandor/spooky.nvim"
    }

    ; show lsp error under cursor in virtual text block
    {
      :name "lsp-lines"

      :commit "a92c755f182b89ea91bd8a6a2227208026f27b4d"
      :config (include "config-lsp-lines")
      :event "LspAttach"
      :url "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
    }

    ; status line
    {
      :name "lualine"

      :commit "84ffb80e452d95e2c46fa29a98ea11a240f7843e"
      :config (include "config-lualine")
      :url "https://github.com/nvim-lualine/lualine.nvim"
    }

    ; surround
    {
      :name "mini-surround"

      :config (include "config-mini-surround")
      :event "VeryLazy"
      :tag "v0.17.0"
      :url "https://github.com/echasnovski/mini.surround"
    }

    ; fancy notifications
    {
      :name "notify"
      :url "https://github.com/rcarriga/nvim-notify"
      :tag "v3.15.0"
      :config (include "config-notify")
    }

    ; make "." repeat more things out of the box
    {
      :name "repeat"

      :commit "24afe922e6a05891756ecf331f39a1f6743d3d5a"
      :config (fn [] nil)
      :event "VeryLazy"
      :url "https://github.com/tpope/vim-repeat"
    }

    ; run :StartupTime to profile vim start time
    {
      :name "startuptime"

      :cmd "StartupTime"
      :config (fn [] nil)
      :tag "v4.4.0"
      :url "https://github.com/dstein64/vim-startuptime"
    }

    ; some surround helpers
    ; {
    ;   :name "surround"

    ;   :commit "aeb933272e72617f7c4d35e1f003be16836b948d"
    ;   :config (fn [] nil)
    ;   :event "VeryLazy"
    ;   :url "https://github.com/tpope/vim-surround"
    ; }

    ; treesitter [2023-05-08]
    {
      :name "treesitter"
      :url "https://github.com/nvim-treesitter/nvim-treesitter"
      :commit "v0.10.0"
      ; :commit "0ec48923e526d55892b7a1564a01b5111e5e9ba0"
      :build ":TSUpdate"
      :config (include "config-treesitter")
    }
    { :name "playground" :url "https://github.com/nvim-treesitter/playground" :commit "2b81a018a49f8e476341dfcb228b7b808baba68b" :cmd "TSPlaygroundToggle" :config (fn [] nil) }

    ; show key bindings after a short delay
    { :name "which-key" :url "https://github.com/folke/which-key.nvim" :tag "v1.4.0" :event "VeryLazy" :config (include "config-which-key") }
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
