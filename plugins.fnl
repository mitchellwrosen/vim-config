(import-macros { : nmap } "nvim-stdlibm")

;; disable some built-in plugins

(set vim.g.loaded_2html_plugin true)
(set vim.g.loaded_man true)
(set vim.g.loaded_netrwPlugin true)
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
    ; basic language syntax highlighting, indent, keywords, etc. (does treesitter kinda obviate these?)
    { :name "fennel" :url "https://github.com/bakpakin/fennel.vim" :commit "30b9beabad2c4f09b9b284caf5cd5666b6b4dc89" :ft "fennel" :config (fn [] nil) }
    { :name "haskell" :url "https://github.com/neovimhaskell/haskell-vim" :commit "f35d02204b4813d1dbe8b0e98cc39701a4b8e15e" :ft "haskell" :config (fn [] nil) }
    { :name "nix" :url "https://github.com/LnL7/vim-nix" :commit "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee" :ft "nix" :config (fn [] nil) }
    { :name "zig" :url "https://github.com/ziglang/zig.vim" :commit "a0d9adedafeb1a33a0159d16ddcdf194b7cea881" :ft "zig" :config (fn [] nil) }

    ; better quickfix with preview
    { :name "bqf" :url "https://github.com/kevinhwang91/nvim-bqf" :tag "v1.1.0" :ft "qf" :config (include "config-nvim-bqf") }

    ; improved "ga" for information about the character under the cursor
    { :name "characterize" :url "https://github.com/tpope/vim-characterize" :commit "885a00a3c21dd52ca8f2fd7d62850134934179d9" :keys [ [ "ga" ] ] :config (include "config-characterize") }

    ; autocompletion (22-04-30)
    { :name "cmp" :url "https://github.com/hrsh7th/nvim-cmp" :commit "f841fa6ced194aa930136a7671439e6bd4c51722" :dependencies [ "cmp-buffer" "cmp-lsp" ] :event "InsertEnter" :config (include "config-nvim-cmp") }
    { :name "cmp-buffer" :url "https://github.com/hrsh7th/cmp-buffer" :commit "f83773e2f433a923997c5faad7ea689ec24d1785" :lazy true }
    { :name "cmp-lsp" :url "https://github.com/hrsh7th/cmp-nvim-lsp" :commit "b4251f0fca1daeb6db5d60a23ca81507acf858c2" :lazy true }

    ; quick (un-)commenting
    { :name "commentary" :url "https://github.com/tpope/vim-commentary" :commit "627308e30639be3e2d5402808ce18690557e8292" :event "VeryLazy" :config (fn [] nil) }

    ; automatically unhighlight when cursor moves
    { :name "cool" :url "https://github.com/romainl/vim-cool" :commit "27ad4ecf7532b750fadca9f36e1c5498fc225af2" :event "VeryLazy" :config (fn [] nil) }

    ; highlight colorcolumn in insert mode
    { :name "deadcolumn" :url "https://github.com/Bekaboo/deadcolumn.nvim" :commit "8140fd7cface9592a44b3151203fc6ca95ad9598" :event "InsertEnter" :config (include "config-deadcolumn") }

    ; :Git
    { :name "fugitive" :url "https://github.com/tpope/vim-fugitive" :tag "v3.7" :cmd "Git" :config (fn [] nil) }

    ; nice low-contrast fork of gruvbox color scheme [2023-05-08]
    ; the lazy.nvim readme recommends colorscheme plugins load first
    { :name "gruvbox-material" :url "https://github.com/sainnhe/gruvbox-material" :commit "3fff63b0d6a425ad1076a260cd4f6da61d1632b1" :priority 1000 }

    ; fuzzy search source code, files, etc
    { :name "fzf" :url "https://github.com/junegunn/fzf" :commit "96670d5f16dcf23d590eb1d83d1de351b2e8fb15" :event "VeryLazy" :config (include "config-fzf") }
    { :name "fzf-vim" :url "https://github.com/junegunn/fzf.vim" :commit "d5f1f8641b24c0fd5b10a299824362a2a1b20ae0" :dependencies [ "fzf" ] :event "VeryLazy" :config (include "config-fzf-vim") }

    ; Show markers every 2 columns of leading whitespace
    { :name "indent-blankline" :url "https://github.com/lukas-reineke/indent-blankline.nvim" :tag "v2.20.4" :config (include "config-indent-blankline") }

    ; use 's' to move far away
    { :name "leap" :url "https://github.com/ggandor/leap.nvim" :commit "f74473d23ebf60957e0db3ff8172349a82e5a442" :event "VeryLazy" :config (include "config-leap") }

    ; [rR]emote and [mM]agnetic text objects (e.g. cirw change inner remote word)
    { :name "leap-spooky" :url "https://github.com/ggandor/leap-spooky.nvim" :commit "3e940464b1728b22052dd565accc949c0b02b025" :event "VeryLazy" :config (include "config-leap-spooky") :dependencies [ "leap" ] }

    ; show lsp error under cursor in virtual text block
    { :name "lsp-lines" :url "https://git.sr.ht/~whynothugo/lsp_lines.nvim" :commit "dcff567b3a2d730f31b6da229ca3bb40640ec5a6" :event "LspAttach" :config (include "config-lsp-lines") }

    ; status line
    { :name "lualine" :url "https://github.com/nvim-lualine/lualine.nvim" :commit "84ffb80e452d95e2c46fa29a98ea11a240f7843e" :config (include "config-lualine") }

    ; surround
    { :name "mini-surround" :url "https://github.com/echasnovski/mini.surround" :commit "ea2e9c4cdbddc826dc6eeac69b035f8220f65de5" :event "VeryLazy" :config (include "config-mini-surround") }

    ; fancy notifications
    { :name "notify" :url "https://github.com/rcarriga/nvim-notify" :tag "v3.11.0" :config (include "config-notify") }

    ; make "." repeat more things out of the box
    { :name "repeat" :url "https://github.com/tpope/vim-repeat" :commit "24afe922e6a05891756ecf331f39a1f6743d3d5a" :event "VeryLazy" :config (fn [] nil) }

    ; { :name "spider" :url "https://github.com/chrisgrieser/nvim-spider" :commit "1aa7054a1b8b7c3605839603c6015c8c7446d8a2" :event "VeryLazy" :config (include "config-spider") }

    ; run :StartupTime to profile vim start time
    { :name "startuptime" :url "https://github.com/dstein64/vim-startuptime" :tag "v4.4.0" :cmd "StartupTime" :config (fn [] nil) }

    ; some surround helpers
    { :name "surround" :url "https://github.com/tpope/vim-surround" :commit "aeb933272e72617f7c4d35e1f003be16836b948d" :event "VeryLazy" :config (fn [] nil) }

    ; treesitter [2023-05-08]
    { :name "treesitter" :url "https://github.com/nvim-treesitter/nvim-treesitter" :commit "0ec48923e526d55892b7a1564a01b5111e5e9ba0" :build ":TSUpdate" :config (include "config-treesitter") }
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
