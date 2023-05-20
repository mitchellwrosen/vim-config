vim.loader.enable()
local _local_1_ = require("stdlib")
local file_exists = _local_1_["file-exists"]
package.preload["options"] = package.preload["options"] or function(...)
  vim.o.autowriteall = true
  vim.o.expandtab = true
  vim.o.grepprg = "rg --vimgrep"
  vim.o.hidden = true
  vim.o.ignorecase = true
  vim.o.inccommand = "split"
  vim.o.joinspaces = false
  vim.o.lazyredraw = true
  vim.o.modeline = false
  vim.o.mouse = ""
  vim.o.report = 0
  vim.o.scrolloff = 15
  vim.o.shiftround = true
  vim.o.shiftwidth = 2
  vim.o.shortmess = "filnxtToOFIc"
  vim.o.showcmd = false
  vim.o.showmode = false
  vim.o.showtabline = 2
  vim.o.sidescrolloff = 16
  vim.o.smartcase = true
  vim.o.smartindent = true
  vim.o.softtabstop = 2
  vim.o.startofline = false
  vim.o.synmaxcol = 200
  vim.o.termguicolors = true
  vim.o.timeoutlen = 1000
  vim.o.title = true
  vim.o.undofile = true
  vim.o.updatetime = 300
  vim.o.wildmenu = true
  vim.o.wildmode = "list:longest,full"
  vim.o.wrap = false
  vim.opt.clipboard = {"unnamed", "unnamedplus"}
  vim.opt.completeopt = {"menuone", "noinsert", "noselect"}
  vim.opt.listchars = {nbsp = "+", tab = "> ", trail = "\194\183"}
  vim.wo.colorcolumn = "120"
  vim.wo.cursorline = true
  vim.wo.foldenable = false
  vim.wo.list = true
  vim.wo.number = true
  vim.wo.signcolumn = "yes"
  return nil
end
require("options")
package.preload["plugins"] = package.preload["plugins"] or function(...)
  vim.g.loaded_2html_plugin = true
  vim.g.loaded_man = true
  vim.g.loaded_netrwPlugin = true
  vim.g.loaded_tutor_mode_plugin = true
  vim.g.loaded_zipPlugin = true
  do
    local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim", "--branch=v9.14.2", lazypath})
    else
    end
    do end (vim.opt.rtp):prepend(lazypath)
  end
  local lazy = require("lazy")
  local function _3_()
    return nil
  end
  local function _4_()
    return nil
  end
  local function _5_()
    return nil
  end
  local function _6_()
    return nil
  end
  local function _10_()
    return nil
  end
  local function _11_()
    return nil
  end
  local function _13_()
    return nil
  end
  local function _37_()
    return nil
  end
  local function _38_()
    return nil
  end
  local function _39_()
    return nil
  end
  local function _41_()
    return nil
  end
  lazy.setup({{name = "fennel", url = "https://github.com/bakpakin/fennel.vim", commit = "30b9beabad2c4f09b9b284caf5cd5666b6b4dc89", ft = "fennel", config = _3_}, {name = "haskell", url = "https://github.com/neovimhaskell/haskell-vim", commit = "f35d02204b4813d1dbe8b0e98cc39701a4b8e15e", ft = "haskell", config = _4_}, {name = "nix", url = "https://github.com/LnL7/vim-nix", commit = "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee", ft = "nix", config = _5_}, {name = "zig", url = "https://github.com/ziglang/zig.vim", commit = "a0d9adedafeb1a33a0159d16ddcdf194b7cea881", ft = "zig", config = _6_}, {name = "bqf", url = "https://github.com/kevinhwang91/nvim-bqf", tag = "v1.1.0", ft = "qf", config = require("config-nvim-bqf")}, {name = "characterize", url = "https://github.com/tpope/vim-characterize", commit = "885a00a3c21dd52ca8f2fd7d62850134934179d9", keys = {{"ga"}}, config = require("config-characterize")}, {name = "cmp", url = "https://github.com/hrsh7th/nvim-cmp", commit = "f841fa6ced194aa930136a7671439e6bd4c51722", dependencies = {"cmp-buffer", "cmp-lsp"}, event = "InsertEnter", config = require("config-nvim-cmp")}, {name = "cmp-buffer", url = "https://github.com/hrsh7th/cmp-buffer", commit = "f83773e2f433a923997c5faad7ea689ec24d1785", lazy = true}, {name = "cmp-lsp", url = "https://github.com/hrsh7th/cmp-nvim-lsp", commit = "b4251f0fca1daeb6db5d60a23ca81507acf858c2", lazy = true}, {name = "commentary", url = "https://github.com/tpope/vim-commentary", commit = "627308e30639be3e2d5402808ce18690557e8292", event = "VeryLazy", config = _10_}, {name = "cool", url = "https://github.com/romainl/vim-cool", commit = "27ad4ecf7532b750fadca9f36e1c5498fc225af2", event = "VeryLazy", config = _11_}, {name = "deadcolumn", url = "https://github.com/Bekaboo/deadcolumn.nvim", commit = "8140fd7cface9592a44b3151203fc6ca95ad9598", event = "InsertEnter", config = require("config-deadcolumn")}, {name = "fugitive", url = "https://github.com/tpope/vim-fugitive", tag = "v3.7", cmd = "Git", config = _13_}, {name = "gruvbox-material", url = "https://github.com/sainnhe/gruvbox-material", commit = "3fff63b0d6a425ad1076a260cd4f6da61d1632b1", priority = 1000}, {name = "fzf", url = "https://github.com/junegunn/fzf", commit = "96670d5f16dcf23d590eb1d83d1de351b2e8fb15", event = "VeryLazy", config = require("config-fzf")}, {name = "fzf-vim", url = "https://github.com/junegunn/fzf.vim", commit = "d5f1f8641b24c0fd5b10a299824362a2a1b20ae0", dependencies = {"fzf"}, event = "VeryLazy", config = require("config-fzf-vim")}, {name = "indent-blankline", url = "https://github.com/lukas-reineke/indent-blankline.nvim", tag = "v2.20.4", config = require("config-indent-blankline")}, {name = "leap", url = "https://github.com/ggandor/leap.nvim", commit = "f74473d23ebf60957e0db3ff8172349a82e5a442", event = "VeryLazy", config = require("config-leap")}, {name = "leap-spooky", url = "https://github.com/ggandor/leap-spooky.nvim", commit = "3e940464b1728b22052dd565accc949c0b02b025", event = "VeryLazy", config = require("config-leap-spooky"), dependencies = {"leap"}}, {name = "lsp-lines", url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim", commit = "dcff567b3a2d730f31b6da229ca3bb40640ec5a6", event = "LspAttach", config = require("config-lsp-lines")}, {name = "lualine", url = "https://github.com/nvim-lualine/lualine.nvim", commit = "84ffb80e452d95e2c46fa29a98ea11a240f7843e", config = require("config-lualine")}, {name = "mini-surround", url = "https://github.com/echasnovski/mini.surround", commit = "ea2e9c4cdbddc826dc6eeac69b035f8220f65de5", event = "VeryLazy", config = require("config-mini-surround")}, {name = "notify", url = "https://github.com/rcarriga/nvim-notify", tag = "v3.11.0", config = require("config-notify")}, {name = "repeat", url = "https://github.com/tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a", event = "VeryLazy", config = _37_}, {name = "startuptime", url = "https://github.com/dstein64/vim-startuptime", tag = "v4.4.0", cmd = "StartupTime", config = _38_}, {name = "surround", url = "https://github.com/tpope/vim-surround", commit = "aeb933272e72617f7c4d35e1f003be16836b948d", event = "VeryLazy", config = _39_}, {name = "treesitter", url = "https://github.com/nvim-treesitter/nvim-treesitter", commit = "0ec48923e526d55892b7a1564a01b5111e5e9ba0", build = ":TSUpdate", config = require("config-treesitter")}, {name = "playground", url = "https://github.com/nvim-treesitter/playground", commit = "2b81a018a49f8e476341dfcb228b7b808baba68b", cmd = "TSPlaygroundToggle", config = _41_}, {name = "which-key", url = "https://github.com/folke/which-key.nvim", tag = "v1.4.0", event = "VeryLazy", config = require("config-which-key")}})
  vim.g.gruvbox_material_background = "soft"
  vim.g.gruvbox_material_better_performance = 1
  vim.g.gruvbox_material_enable_italic = 1
  vim.cmd("colorscheme gruvbox-material")
  vim.g.haskell_enable_backpack = 1
  vim.g.haskell_enable_pattern_synonyms = 1
  vim.g.haskell_enable_quantification = 1
  vim.g.haskell_enable_recursivedo = 1
  vim.g.haskell_enable_static_pointers = 1
  vim.g.haskell_enable_typeroles = 1
  vim.g.haskell_indent_disable = 1
  vim.g.git_messenger_always_into_popup = true
  vim.g.git_messenger_extra_blame_args = "-w"
  vim.g.git_messenger_no_default_mappings = true
  vim.keymap.set("n", "<Space>b", "<Plug>(git-messenger)")
  vim.keymap.set("n", "-", "m`<Plug>CommentaryLine``")
  vim.keymap.set("v", "-", "<Plug>Commentary")
  vim.g.surround_no_mappings = 1
  return nil
end
package.preload["config-nvim-bqf"] = package.preload["config-nvim-bqf"] or function(...)
  local function _7_()
    local bqf = require("bqf")
    return bqf.setup()
  end
  return _7_
end
package.preload["config-characterize"] = package.preload["config-characterize"] or function(...)
  local function _8_()
    return vim.keymap.set("n", "ga", "<Plug>(characterize)")
  end
  return _8_
end
package.preload["config-nvim-cmp"] = package.preload["config-nvim-cmp"] or function(...)
  local function _9_()
    local cmp = require("cmp")
    return cmp.setup({mapping = {["<CR>"] = cmp.mapping.confirm({select = false}), ["<Tab>"] = cmp.mapping.select_next_item()}, sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "buffer"}})})
  end
  return _9_
end
package.preload["config-deadcolumn"] = package.preload["config-deadcolumn"] or function(...)
  local function _12_()
    local deadcolumn = require("deadcolumn")
    return deadcolumn.setup({blending = {threshold = 100}, scope = "visible", warning = {alpha = 0.1, hlgroup = {"ErrorMsg", "background"}}})
  end
  return _12_
end
package.preload["config-fzf"] = package.preload["config-fzf"] or function(...)
  local function _14_()
    vim.g.fzf_layout = {window = {height = 0.95, width = 0.95}}
    return nil
  end
  return _14_
end
package.preload["config-fzf-vim"] = package.preload["config-fzf-vim"] or function(...)
  local function _15_()
    local fzf_vim_buffers = vim.fn["fzf#vim#buffers"]
    local fzf_vim_files = vim.fn["fzf#vim#files"]
    local fzf_vim_grep = vim.fn["fzf#vim#grep"]
    local fzf_vim_gitfiles = vim.fn["fzf#vim#gitfiles"]
    local fzf_vim_with_preview = vim.fn["fzf#vim#with_preview"]
    local opts1 = fzf_vim_with_preview({options = {"--info=inline", "--layout=reverse"}}, "down:60%")
    vim.g.fzf_buffers_jump = 1
    local ripgrep
    local function _16_(args)
      return fzf_vim_grep(("rg --column --line-number --no-heading --color=always -- " .. vim.fn.shellescape(table.concat(args, " "))), 1, opts1, 0)
    end
    ripgrep = _16_
    local function _17_(opts)
      return ripgrep(opts.fargs)
    end
    vim.api.nvim_create_user_command("Rg", _17_, {desc = "ripgrep", nargs = "*"})
    local function _18_()
      return ripgrep({vim.fn.expand("<cword>")})
    end
    vim.keymap.set("n", "<Space>f", _18_)
    local function _19_()
      return fzf_vim_buffers(opts1)
    end
    vim.keymap.set("n", "<Space>k", _19_)
    local function _22_()
      if (0 == os.execute("git rev-parse 2>/dev/null")) then
        local function _20_()
          return fzf_vim_gitfiles("", opts1)
        end
        return _20_
      else
        local function _21_()
          return fzf_vim_files(".", opts1)
        end
        return _21_
      end
    end
    return vim.keymap.set("n", "<Space>o", _22_())
  end
  return _15_
end
package.preload["config-indent-blankline"] = package.preload["config-indent-blankline"] or function(...)
  local function _23_()
    local plugin = require("indent_blankline")
    return plugin.setup({char_list = {"\226\148\130", "\226\148\138"}, indent_level = 40})
  end
  return _23_
end
package.preload["config-leap"] = package.preload["config-leap"] or function(...)
  local function _24_()
    local leap = require("leap")
    leap.opts.equivalence_classes = {" \9\13\n", ".`~!@#$%^&*()-_=+[{]}\\|;:'\",<>/?"}
    leap.opts.labels = {"j", "f", "k", "d", "l", "s", "a", "m", "c", "n", "v", "u", "r", "y", "t", ",", "x", "i", "e", ".", "z", "o", "w", "/", "p", "q"}
    leap.opts.safe_labels = {}
    local function _25_()
      return leap.leap({target_windows = {vim.api.nvim_get_current_win()}})
    end
    vim.keymap.set({"n"}, "s", _25_)
    local function _26_()
      return leap.leap({inclusive_op = true, target_windows = {vim.api.nvim_get_current_win()}})
    end
    return vim.keymap.set({"x", "o"}, "s", _26_)
  end
  return _24_
end
package.preload["config-leap-spooky"] = package.preload["config-leap-spooky"] or function(...)
  local function _27_()
    local leap_spooky = require("leap-spooky")
    return leap_spooky.setup({})
  end
  return _27_
end
package.preload["config-lsp-lines"] = package.preload["config-lsp-lines"] or function(...)
  local function _28_()
    local lsp_lines = require("lsp_lines")
    local function _29_()
      local value = vim.diagnostic.config().virtual_lines
      if (value == true) then
        vim.diagnostic.config({virtual_lines = {only_current_line = true}})
        return vim.notify("LSP diagnostics on (current line only)")
      else
        vim.diagnostic.config({virtual_lines = true})
        return vim.notify("LSP diagnostics on")
      end
    end
    vim.keymap.set("n", "<Space>ll", _29_, {desc = "Toggle diagnostics"})
    return lsp_lines.setup()
  end
  return _28_
end
package.preload["config-lualine"] = package.preload["config-lualine"] or function(...)
  local mode_code_to_name = {n = "normal", niI = "normal", niR = "normal", niV = "normal", nt = "normal", ntT = "normal", no = "operator", nv = "operator", noV = "operator", ["no\22"] = "operator", v = "visual", vs = "visual", V = "visual", Vs = "visual", ["\22"] = "visual", ["\22s"] = "visual", s = "select", S = "select", ["\19"] = "select", i = "insert", ic = "insert", ix = "insert", r = "replace", R = "replace", Rc = "replace", Rx = "replace", Rv = "replace", Rvc = "replace", Rvx = "replace", c = "command", cv = "ex", ce = "ex", rm = "more", ["r?"] = "confirm", ["!"] = "shell", t = "terminal"}
  local config
  local function _31_()
    local mode_code = vim.api.nvim_get_mode().mode
    return (mode_code_to_name[mode_code] or mode_code)
  end
  local function _32_(name, _buffer)
    if ("[No Name]" == name) then
      return ""
    else
      return name
    end
  end
  config = {component_separators = "", globalstatus = true, section_separators = "", sections = {lualine_a = {_31_}, lualine_b = {"branch"}, lualine_c = {{"filename", symbols = {unnamed = ""}}, "diagnostics", "searchcount"}, lualine_x = {"filetype"}, lualine_y = {"selectioncount"}, lualine_z = {"progress", "location"}}, refresh = {statusline = 30000, tabline = 30000, winbar = 30000}, tabline = {lualine_a = {{"buffers", filetype_names = {fzf = "fzf"}, fmt = _32_, show_filenames_only = true, symbols = {alternate_file = ""}, show_modified_status = false}}, lualine_b = {}, lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = {}}, icons_enabled = false}
  local function _34_()
    return (require("lualine")).setup(config)
  end
  return _34_
end
package.preload["config-mini-surround"] = package.preload["config-mini-surround"] or function(...)
  local function _35_()
    local mini_surround = require("mini.surround")
    return mini_surround.setup({custom_surroundings = nil, highlight_duration = 300, mappings = {add = "z", delete = "zd", find = "", find_left = "", highlight = "", replace = "zr", update_n_lines = "", suffix_last = "", suffix_next = ""}, n_lines = 20, search_method = "cover_or_next"})
  end
  return _35_
end
package.preload["config-notify"] = package.preload["config-notify"] or function(...)
  local function _36_()
    local notify = require("notify")
    notify.setup({stages = "static"})
    vim.notify = notify
    return nil
  end
  return _36_
end
package.preload["config-treesitter"] = package.preload["config-treesitter"] or function(...)
  local function _40_()
    local treesitter = require("nvim-treesitter.configs")
    return treesitter.setup({highlight = {enable = true}, playground = {enable = true}})
  end
  return _40_
end
package.preload["config-which-key"] = package.preload["config-which-key"] or function(...)
  local function _42_()
    local which_key = require("which-key")
    which_key.setup({icons = {separator = ""}, plugins = {marks = true, presets = {motions = false, g = false, nav = false, windows = false, text_objects = false, operators = false, z = false}, registers = true, spelling = {enabled = false}}, window = {border = "single", margin = {0, 0, 0, 0}, padding = {0, 0, 0, 0}}})
    which_key.register({mode = {"n", "v"}, ["<Space>l"] = {name = "+LSP"}})
    local function _43_()
      return which_key.show("`", {auto = true, mode = "n"})
    end
    return vim.keymap.set("n", "'", _43_)
  end
  return _42_
end
require("plugins")
package.preload["mappings"] = package.preload["mappings"] or function(...)
  vim.keymap.set({"n", "v"}, ";", ":")
  vim.keymap.set({"n", "v"}, ":", ";")
  vim.keymap.set("n", "/", "/\\v")
  vim.keymap.set("v", "/", "/\\v")
  local function _44_()
    vim.cmd("keepjumps normal! mz*`z")
    local lualine = require("lualine")
    return lualine.refresh()
  end
  vim.keymap.set("n", "*", _44_)
  vim.keymap.set("n", "<BS>", "<C-^>")
  vim.keymap.set("n", "j", "gj")
  vim.keymap.set("n", "k", "gk")
  vim.keymap.set({"n", "v"}, "J", "6j", {remap = true})
  vim.keymap.set({"n", "v"}, "K", "6k", {remap = true})
  vim.keymap.set({"n", "o", "v"}, "H", "^")
  vim.keymap.set({"n", "o"}, "L", "$")
  vim.keymap.set("v", "L", "g_")
  vim.keymap.set("v", "p", "P")
  local function _45_()
    local prev_region
    do
      local _local_46_ = vim.api.nvim_buf_get_mark(0, "[")
      local start_row_7_auto = _local_46_[1]
      local start_col_8_auto = _local_46_[2]
      local _local_47_ = vim.api.nvim_buf_get_mark(0, "]")
      local end_row_9_auto = _local_47_[1]
      local end_col_10_auto = _local_47_[2]
      prev_region = {["end"] = {col = end_col_10_auto, row = end_row_9_auto}, start = {col = start_col_8_auto, row = start_row_7_auto}}
    end
    if not ((prev_region.start.row == 0) and (prev_region.start.col == 0)) then
      local cur_region
      do
        local _local_48_ = vim.fn.getpos("v")
        local _bufnum_11_auto = _local_48_[1]
        local begin_row_12_auto = _local_48_[2]
        local begin_col_13_auto = _local_48_[3]
        local _off_14_auto = _local_48_[4]
        local begin_pos_15_auto = {col = (begin_col_13_auto - 1), row = begin_row_12_auto}
        local end_pos_16_auto
        do
          local _local_49_ = vim.api.nvim_win_get_cursor(0)
          local row_1_auto = _local_49_[1]
          local col_2_auto = _local_49_[2]
          end_pos_16_auto = {col = col_2_auto, row = row_1_auto}
        end
        if ((begin_pos_15_auto.row < end_pos_16_auto.row) or ((begin_pos_15_auto.row == end_pos_16_auto.row) and (begin_pos_15_auto.col <= end_pos_16_auto.col))) then
          cur_region = {["end"] = end_pos_16_auto, start = begin_pos_15_auto}
        else
          cur_region = {["end"] = begin_pos_15_auto, start = end_pos_16_auto}
        end
      end
      local prev_contents
      do
        local _local_51_ = prev_region
        local _local_52_ = _local_51_["end"]
        local end_col_6_auto = _local_52_["col"]
        local end_row_5_auto = _local_52_["row"]
        local _local_53_ = _local_51_["start"]
        local start_col_4_auto = _local_53_["col"]
        local start_row_3_auto = _local_53_["row"]
        prev_contents = vim.api.nvim_buf_get_text(0, (start_row_3_auto - 1), start_col_4_auto, (end_row_5_auto - 1), (end_col_6_auto + 1), {})
      end
      local cur_contents
      do
        local _local_54_ = cur_region
        local _local_55_ = _local_54_["end"]
        local end_col_6_auto = _local_55_["col"]
        local end_row_5_auto = _local_55_["row"]
        local _local_56_ = _local_54_["start"]
        local start_col_4_auto = _local_56_["col"]
        local start_row_3_auto = _local_56_["row"]
        cur_contents = vim.api.nvim_buf_get_text(0, (start_row_3_auto - 1), start_col_4_auto, (end_row_5_auto - 1), (end_col_6_auto + 1), {})
      end
      local function adjust_region(left_region, right_region)
        local right_region_len = (right_region["end"].col - right_region.start.col)
        local left_region_len = (left_region["end"].col - left_region.start.col)
        local delta = (right_region_len - left_region_len)
        return {start = {row = right_region.start.row, col = (right_region.start.col + delta)}, ["end"] = {row = right_region["end"].row, col = (right_region["end"].col + delta)}}
      end
      if ((prev_region.start.row == prev_region["end"].row) and (cur_region.start.row == cur_region["end"].row)) then
        if (prev_region.start.row ~= cur_region.start.row) then
          vim.api.nvim_feedkeys("\27", "xn", false)
          do
            local _local_57_ = prev_region
            local _local_58_ = _local_57_["end"]
            local end_col_20_auto = _local_58_["col"]
            local end_row_19_auto = _local_58_["row"]
            local _local_59_ = _local_57_["start"]
            local start_col_18_auto = _local_59_["col"]
            local start_row_17_auto = _local_59_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), cur_contents)
          end
          do
            local _local_60_ = cur_region
            local _local_61_ = _local_60_["end"]
            local end_col_20_auto = _local_61_["col"]
            local end_row_19_auto = _local_61_["row"]
            local _local_62_ = _local_60_["start"]
            local start_col_18_auto = _local_62_["col"]
            local start_row_17_auto = _local_62_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), prev_contents)
          end
          local _local_63_ = cur_region.start
          local col_22_auto = _local_63_["col"]
          local row_21_auto = _local_63_["row"]
          return vim.api.nvim_win_set_cursor(0, {row_21_auto, col_22_auto})
        elseif ((prev_region.start.col < cur_region.start.col) and (prev_region["end"].col < cur_region.start.col)) then
          vim.api.nvim_feedkeys("\27", "xn", false)
          do
            local _local_64_ = prev_region
            local _local_65_ = _local_64_["end"]
            local end_col_20_auto = _local_65_["col"]
            local end_row_19_auto = _local_65_["row"]
            local _local_66_ = _local_64_["start"]
            local start_col_18_auto = _local_66_["col"]
            local start_row_17_auto = _local_66_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), cur_contents)
          end
          local adjusted_cur_region = adjust_region(prev_region, cur_region)
          do
            local _local_67_ = adjusted_cur_region
            local _local_68_ = _local_67_["end"]
            local end_col_20_auto = _local_68_["col"]
            local end_row_19_auto = _local_68_["row"]
            local _local_69_ = _local_67_["start"]
            local start_col_18_auto = _local_69_["col"]
            local start_row_17_auto = _local_69_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), prev_contents)
          end
          local _local_70_ = adjusted_cur_region.start
          local col_22_auto = _local_70_["col"]
          local row_21_auto = _local_70_["row"]
          return vim.api.nvim_win_set_cursor(0, {row_21_auto, col_22_auto})
        elseif ((cur_region.start.col < prev_region.start.col) and (cur_region["end"].col < prev_region.start.col)) then
          vim.api.nvim_feedkeys("\27", "xn", false)
          do
            local _local_71_ = cur_region
            local _local_72_ = _local_71_["end"]
            local end_col_20_auto = _local_72_["col"]
            local end_row_19_auto = _local_72_["row"]
            local _local_73_ = _local_71_["start"]
            local start_col_18_auto = _local_73_["col"]
            local start_row_17_auto = _local_73_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), prev_contents)
          end
          local adjusted_prev_region = adjust_region(cur_region, prev_region)
          do
            local _local_74_ = adjusted_prev_region
            local _local_75_ = _local_74_["end"]
            local end_col_20_auto = _local_75_["col"]
            local end_row_19_auto = _local_75_["row"]
            local _local_76_ = _local_74_["start"]
            local start_col_18_auto = _local_76_["col"]
            local start_row_17_auto = _local_76_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), cur_contents)
          end
          local _local_77_ = cur_region.start
          local col_22_auto = _local_77_["col"]
          local row_21_auto = _local_77_["row"]
          return vim.api.nvim_win_set_cursor(0, {row_21_auto, col_22_auto})
        else
          return nil
        end
      else
        return nil
      end
    else
      return nil
    end
  end
  vim.keymap.set("x", "x", _45_)
  vim.keymap.set("v", "Y", "y`>")
  vim.keymap.set("n", "U", "<C-r>")
  vim.keymap.set({"n", "v"}, "n", "nzz")
  vim.keymap.set({"n", "v"}, "N", "Nzz")
  local function _81_()
    local buffers = vim.fn.getbufinfo()
    local num_listed
    do
      local acc = 0
      for _, buffer in ipairs(buffers) do
        if (1 == buffer.listed) then
          acc = (acc + 1)
        else
          acc = acc
        end
      end
      num_listed = acc
    end
    if (num_listed <= 1) then
      return vim.cmd.q()
    else
      return vim.api.nvim_buf_delete(0, {force = true})
    end
  end
  vim.keymap.set("n", "q", _81_)
  local function _84_()
    if (vim.fn.argc() > 0) then
      vim.cmd("%argdel")
    else
    end
    vim.cmd({cmd = "mksession", bang = true})
    return vim.cmd.qa()
  end
  vim.keymap.set("n", "Q", _84_)
  vim.keymap.set("n", ">", "<Plug>MyRightShift", {silent = true})
  vim.keymap.set("n", "<", "<Plug>MyLeftShift", {silent = true})
  vim.keymap.set("n", "<Plug>MyRightShift", ">>ll:call repeat#set(\"\\<Plug>MyRightShift\")<CR>", {silent = true})
  vim.keymap.set("n", "<Plug>MyLeftShift", "<<hh:call repeat#set(\"\\<Plug>MyLeftShift\")<CR>", {silent = true})
  vim.keymap.set("n", "M", "m`J``")
  vim.keymap.set("v", "al", "$o0", {silent = true})
  vim.keymap.set("o", "al", ":<C-u>normal val<CR>", {silent = true})
  vim.keymap.set("v", "il", "g_o^", {silent = true})
  vim.keymap.set("o", "il", ":<C-u>normal vil<CR>", {silent = true})
  vim.keymap.set("n", "<C-s>", ":%s/\\v//cg<Left><Left><Left><Left>")
  vim.keymap.set("v", "<C-s>", ":s/\\v//cg<Left><Left><Left><Left>")
  vim.keymap.set("n", "<C-j>", ":bn<CR>", {silent = true})
  vim.keymap.set("n", "<C-k>", ":bp<CR>", {silent = true})
  vim.keymap.set("n", "<C-h>", "<C-w><C-h>", {})
  vim.keymap.set("n", "<C-l>", "<C-w><C-l>", {})
  do
    local function list_buffers()
      local buffer_ids = vim.api.nvim_list_bufs()
      local tbl_17_auto = {}
      local i_18_auto = #tbl_17_auto
      for __7_auto, buffer_id in ipairs(buffer_ids) do
        local val_19_auto
        if vim.api.nvim_buf_get_option(buffer_id, "buflisted") then
          val_19_auto = buffer_id
        else
          val_19_auto = nil
        end
        if (nil ~= val_19_auto) then
          i_18_auto = (i_18_auto + 1)
          do end (tbl_17_auto)[i_18_auto] = val_19_auto
        else
        end
      end
      return tbl_17_auto
    end
    local function go_to_buffer(i)
      local buffer_ids = list_buffers()
      local buffer_id = buffer_ids[i]
      if buffer_id then
        return vim.cmd.buffer(buffer_id)
      else
        return nil
      end
    end
    local function move_buffer_to_index(desired_buffer_index)
      if (desired_buffer_index >= 1) then
        local buffer_ids = list_buffers()
        local current_buffer_id = vim.api.nvim_get_current_buf()
        local current_buffer_index = nil
        for buffer_index, buffer_id in ipairs(buffer_ids) do
          if current_buffer_index then break end
          if (buffer_id == current_buffer_id) then
            current_buffer_index = buffer_index
          else
          end
        end
        if (desired_buffer_index < current_buffer_index) then
          local left_buffer_ids_to_delete
          do
            local tbl_17_auto = {}
            local i_18_auto = #tbl_17_auto
            local function _90_()
              local tbl_17_auto0 = {}
              local i_18_auto0 = #tbl_17_auto0
              for i_1_auto, x_2_auto in ipairs(buffer_ids) do
                local val_19_auto
                if (i_1_auto <= (desired_buffer_index - 1)) then
                  val_19_auto = nil
                else
                  val_19_auto = x_2_auto
                end
                if (nil ~= val_19_auto) then
                  i_18_auto0 = (i_18_auto0 + 1)
                  do end (tbl_17_auto0)[i_18_auto0] = val_19_auto
                else
                end
              end
              return tbl_17_auto0
            end
            for i_3_auto, x_4_auto in ipairs(_90_()) do
              local val_19_auto
              if (i_3_auto <= (current_buffer_index - desired_buffer_index)) then
                val_19_auto = x_4_auto
              else
                val_19_auto = nil
              end
              if (nil ~= val_19_auto) then
                i_18_auto = (i_18_auto + 1)
                do end (tbl_17_auto)[i_18_auto] = val_19_auto
              else
              end
            end
            left_buffer_ids_to_delete = tbl_17_auto
          end
          local left_filenames_to_reopen
          do
            local tbl_17_auto = {}
            local i_18_auto = #tbl_17_auto
            for __7_auto, buffer_id in ipairs(left_buffer_ids_to_delete) do
              local val_19_auto = vim.api.nvim_buf_get_name(buffer_id)
              if (nil ~= val_19_auto) then
                i_18_auto = (i_18_auto + 1)
                do end (tbl_17_auto)[i_18_auto] = val_19_auto
              else
              end
            end
            left_filenames_to_reopen = tbl_17_auto
          end
          local right_buffer_ids_to_delete
          do
            local tbl_17_auto = {}
            local i_18_auto = #tbl_17_auto
            for i_1_auto, x_2_auto in ipairs(buffer_ids) do
              local val_19_auto
              if (i_1_auto <= current_buffer_index) then
                val_19_auto = nil
              else
                val_19_auto = x_2_auto
              end
              if (nil ~= val_19_auto) then
                i_18_auto = (i_18_auto + 1)
                do end (tbl_17_auto)[i_18_auto] = val_19_auto
              else
              end
            end
            right_buffer_ids_to_delete = tbl_17_auto
          end
          local right_filenames_to_reopen
          do
            local tbl_17_auto = {}
            local i_18_auto = #tbl_17_auto
            for __7_auto, buffer_id in ipairs(right_buffer_ids_to_delete) do
              local val_19_auto = vim.api.nvim_buf_get_name(buffer_id)
              if (nil ~= val_19_auto) then
                i_18_auto = (i_18_auto + 1)
                do end (tbl_17_auto)[i_18_auto] = val_19_auto
              else
              end
            end
            right_filenames_to_reopen = tbl_17_auto
          end
          for _, buffer_id in ipairs(left_buffer_ids_to_delete) do
            vim.api.nvim_buf_delete(buffer_id, {force = true})
          end
          for _, buffer_id in ipairs(right_buffer_ids_to_delete) do
            vim.api.nvim_buf_delete(buffer_id, {force = true})
          end
          for _, filename in ipairs(left_filenames_to_reopen) do
            vim.cmd.badd(filename)
          end
          for _, filename in ipairs(right_filenames_to_reopen) do
            vim.cmd.badd(filename)
          end
          local lualine = require("lualine")
          return lualine.refresh()
        elseif (desired_buffer_index > current_buffer_index) then
          local buffer_ids_to_delete
          do
            local tbl_17_auto = {}
            local i_18_auto = #tbl_17_auto
            for i_1_auto, x_2_auto in ipairs(buffer_ids) do
              local val_19_auto
              if (i_1_auto <= desired_buffer_index) then
                val_19_auto = nil
              else
                val_19_auto = x_2_auto
              end
              if (nil ~= val_19_auto) then
                i_18_auto = (i_18_auto + 1)
                do end (tbl_17_auto)[i_18_auto] = val_19_auto
              else
              end
            end
            buffer_ids_to_delete = tbl_17_auto
          end
          local filenames_to_reopen
          do
            local tbl_17_auto = {}
            local i_18_auto = #tbl_17_auto
            for __7_auto, buffer_id in ipairs(buffer_ids_to_delete) do
              local val_19_auto = vim.api.nvim_buf_get_name(buffer_id)
              if (nil ~= val_19_auto) then
                i_18_auto = (i_18_auto + 1)
                do end (tbl_17_auto)[i_18_auto] = val_19_auto
              else
              end
            end
            filenames_to_reopen = tbl_17_auto
          end
          local current_filename = vim.api.nvim_buf_get_name(0)
          vim.api.nvim_buf_delete(current_buffer_id, {force = true})
          for _, buffer_id in ipairs(buffer_ids_to_delete) do
            vim.api.nvim_buf_delete(buffer_id, {force = true})
          end
          vim.cmd.edit(current_filename)
          for _, filename in ipairs(filenames_to_reopen) do
            vim.cmd.badd(filename)
          end
          return nil
        else
          return nil
        end
      else
        return nil
      end
    end
    local function _104_()
      return go_to_buffer(1)
    end
    vim.keymap.set("n", "1", _104_)
    local function _105_()
      return go_to_buffer(2)
    end
    vim.keymap.set("n", "2", _105_)
    local function _106_()
      return go_to_buffer(3)
    end
    vim.keymap.set("n", "3", _106_)
    local function _107_()
      return go_to_buffer(4)
    end
    vim.keymap.set("n", "4", _107_)
    local function _108_()
      return go_to_buffer(5)
    end
    vim.keymap.set("n", "5", _108_)
    local function _109_()
      return move_buffer_to_index(1)
    end
    vim.keymap.set("n", "<Space>1", _109_)
    local function _110_()
      return move_buffer_to_index(2)
    end
    vim.keymap.set("n", "<Space>2", _110_)
    local function _111_()
      return move_buffer_to_index(3)
    end
    vim.keymap.set("n", "<Space>3", _111_)
    local function _112_()
      return move_buffer_to_index(4)
    end
    vim.keymap.set("n", "<Space>4", _112_)
    local function _113_()
      return move_buffer_to_index(5)
    end
    vim.keymap.set("n", "<Space>5", _113_)
  end
  vim.keymap.set("n", "<Space>s", "m`vip<Esc>:silent '<,'>w !repld-send --no-echo<CR>``", {silent = true})
  vim.keymap.set("n", "<Space>S", "m`:silent w !repld-send<CR>``", {silent = true})
  vim.keymap.set("v", "<Space>s", "m`<Esc>:silent '<,'>w !repld-send<CR>``", {silent = true})
  vim.keymap.set("i", "<C-v>", "<C-r>*")
  vim.keymap.set("i", "<C-h>", "<C-w>")
  vim.keymap.set("c", "<C-h>", "<Left>")
  vim.keymap.set("c", "<C-j>", "<Down>")
  vim.keymap.set("c", "<C-k>", "<Up>")
  vim.keymap.set("c", "<C-l>", "<Right>")
  vim.keymap.set("n", "~", "mzlblgueh~`z", {silent = true})
  do
    local number_regex = "0x\\x\\+\\|\\d\\+\\(\\.\\d\\+\\)\\?"
    local function _114_()
      local matched_line = vim.fn.search(number_regex, "ceW")
      if (matched_line ~= 0) then
        vim.cmd("normal! v")
        return vim.fn.search(number_regex, "bcW")
      else
        return nil
      end
    end
    vim.keymap.set("o", "n", _114_)
  end
  local function _116_()
    vim.keymap.del("i", "<C-u>")
    vim.keymap.set("i", "<C-u><<", "\194\171")
    vim.keymap.set("i", "<C-u>>>", "\194\187")
    vim.keymap.set("i", "<C-U><<<", "\226\139\152")
    vim.keymap.set("i", "<C-U>>>>", "\226\139\153")
    vim.keymap.set("i", "<C-u>not", "\194\172")
    vim.keymap.set("i", "<C-u>+-", "\194\177")
    vim.keymap.set("i", "<C-u>`", "\194\180")
    vim.keymap.set("i", "<C-u>micro", "\194\181")
    vim.keymap.set("i", "<C-u>mult", "\195\151")
    vim.keymap.set("i", "<C-u>div", "\195\183")
    vim.keymap.set("i", "<C-u>Gamma", "\206\147")
    vim.keymap.set("i", "<C-u>Delta", "\206\148")
    vim.keymap.set("i", "<C-u>Theta", "\206\152")
    vim.keymap.set("i", "<C-u>Lambda", "\206\155")
    vim.keymap.set("i", "<C-u>Xi", "\206\158")
    vim.keymap.set("i", "<C-u>Pi", "\206\160")
    vim.keymap.set("i", "<C-u>Sigma", "\206\163")
    vim.keymap.set("i", "<C-u>Upsilon", "\206\165")
    vim.keymap.set("i", "<C-u>Phi", "\206\166")
    vim.keymap.set("i", "<C-u>Psi", "\206\168")
    vim.keymap.set("i", "<C-u>Omega", "\206\169")
    vim.keymap.set("i", "<C-u>alpha", "\206\177")
    vim.keymap.set("i", "<C-u>beta", "\206\178")
    vim.keymap.set("i", "<C-u>gamma", "\206\179")
    vim.keymap.set("i", "<C-u>delta", "\206\180")
    vim.keymap.set("i", "<C-u>epsilon", "\206\181")
    vim.keymap.set("i", "<C-u>zeta", "\206\182")
    vim.keymap.set("i", "<C-u>eta", "\206\183")
    vim.keymap.set("i", "<C-u>theta", "\206\184")
    vim.keymap.set("i", "<C-u>iota", "\206\185")
    vim.keymap.set("i", "<C-u>kappa", "\206\186")
    vim.keymap.set("i", "<C-u>lambda", "\206\187")
    vim.keymap.set("i", "<C-u>mu", "\206\188")
    vim.keymap.set("i", "<C-u>nu", "\206\189")
    vim.keymap.set("i", "<C-u>xi", "\206\190")
    vim.keymap.set("i", "<C-u>pi", "\207\128")
    vim.keymap.set("i", "<C-u>rho", "\207\129")
    vim.keymap.set("i", "<C-u>sigma", "\207\131")
    vim.keymap.set("i", "<C-u>tau", "\207\132")
    vim.keymap.set("i", "<C-u>upsilon", "\207\133")
    vim.keymap.set("i", "<C-u>phi", "\207\134")
    vim.keymap.set("i", "<C-u>chi", "\207\135")
    vim.keymap.set("i", "<C-u>psi", "\207\136")
    vim.keymap.set("i", "<C-u>omega", "\207\137")
    vim.keymap.set("i", "<C-u>^0", "\226\129\176")
    vim.keymap.set("i", "<C-u>^1", "\194\185")
    vim.keymap.set("i", "<C-u>^2", "\194\178")
    vim.keymap.set("i", "<C-u>^3", "\194\179")
    vim.keymap.set("i", "<C-u>^4", "\226\129\180")
    vim.keymap.set("i", "<C-u>^5", "\226\129\181")
    vim.keymap.set("i", "<C-u>^6", "\226\129\182")
    vim.keymap.set("i", "<C-u>^7", "\226\129\183")
    vim.keymap.set("i", "<C-u>^8", "\226\129\184")
    vim.keymap.set("i", "<C-u>^9", "\226\129\185")
    vim.keymap.set("i", "<C-u>^a", "\225\181\131")
    vim.keymap.set("i", "<C-u>^b", "\225\181\135")
    vim.keymap.set("i", "<C-u>^d", "\225\181\136")
    vim.keymap.set("i", "<C-u>^e", "\225\181\137")
    vim.keymap.set("i", "<C-u>^g", "\225\181\141")
    vim.keymap.set("i", "<C-u>^i", "\226\129\177")
    vim.keymap.set("i", "<C-u>^k", "\225\181\143")
    vim.keymap.set("i", "<C-u>^m", "\225\181\144")
    vim.keymap.set("i", "<C-u>^n", "\226\129\191")
    vim.keymap.set("i", "<C-u>^o", "\225\181\146")
    vim.keymap.set("i", "<C-u>^p", "\225\181\150")
    vim.keymap.set("i", "<C-u>^t", "\225\181\151")
    vim.keymap.set("i", "<C-u>^u", "\225\181\152")
    vim.keymap.set("i", "<C-u>^v", "\225\181\155")
    vim.keymap.set("i", "<C-u>^A", "\225\180\172")
    vim.keymap.set("i", "<C-u>^B", "\225\180\174")
    vim.keymap.set("i", "<C-u>^D", "\225\180\176")
    vim.keymap.set("i", "<C-u>^E", "\225\180\177")
    vim.keymap.set("i", "<C-u>^G", "\225\180\179")
    vim.keymap.set("i", "<C-u>^H", "\225\180\180")
    vim.keymap.set("i", "<C-u>^I", "\225\180\181")
    vim.keymap.set("i", "<C-u>^J", "\225\180\182")
    vim.keymap.set("i", "<C-u>^K", "\225\180\183")
    vim.keymap.set("i", "<C-u>^L", "\225\180\184")
    vim.keymap.set("i", "<C-u>^M", "\225\180\185")
    vim.keymap.set("i", "<C-u>^N", "\225\180\186")
    vim.keymap.set("i", "<C-u>^O", "\225\180\188")
    vim.keymap.set("i", "<C-u>^P", "\225\180\190")
    vim.keymap.set("i", "<C-u>^R", "\225\180\191")
    vim.keymap.set("i", "<C-u>^T", "\225\181\128")
    vim.keymap.set("i", "<C-u>^U", "\225\181\129")
    vim.keymap.set("i", "<C-u>^W", "\225\181\130")
    vim.keymap.set("i", "<C-u>^alpha", "\225\181\133")
    vim.keymap.set("i", "<C-u>^beta", "\225\181\157")
    vim.keymap.set("i", "<C-u>^gamma", "\225\181\158")
    vim.keymap.set("i", "<C-u>^delta", "\225\181\159")
    vim.keymap.set("i", "<C-u>^phi", "\225\181\160")
    vim.keymap.set("i", "<C-u>^chi", "\225\181\161")
    vim.keymap.set("i", "<C-u>_a", "\226\130\144")
    vim.keymap.set("i", "<C-u>_e", "\226\130\145")
    vim.keymap.set("i", "<C-u>_h", "\226\130\149")
    vim.keymap.set("i", "<C-u>_i", "\225\181\162")
    vim.keymap.set("i", "<C-u>_k", "\226\130\150")
    vim.keymap.set("i", "<C-u>_l", "\226\130\151")
    vim.keymap.set("i", "<C-u>_m", "\226\130\152")
    vim.keymap.set("i", "<C-u>_n", "\226\130\153")
    vim.keymap.set("i", "<C-u>_o", "\226\130\146")
    vim.keymap.set("i", "<C-u>_p", "\226\130\154")
    vim.keymap.set("i", "<C-u>_r", "\225\181\163")
    vim.keymap.set("i", "<C-u>_s", "\226\130\155")
    vim.keymap.set("i", "<C-u>_t", "\226\130\156")
    vim.keymap.set("i", "<C-u>_u", "\225\181\164")
    vim.keymap.set("i", "<C-u>_v", "\225\181\165")
    vim.keymap.set("i", "<C-u>_x", "\226\130\147")
    vim.keymap.set("i", "<C-u>_beta", "\225\181\166")
    vim.keymap.set("i", "<C-u>_gamma", "\225\181\167")
    vim.keymap.set("i", "<C-u>_rho", "\225\181\168")
    vim.keymap.set("i", "<C-u>_phi", "\225\181\169")
    vim.keymap.set("i", "<C-u>_chi", "\225\181\170")
    vim.keymap.set("i", "<C-u>!!", "\226\128\188")
    vim.keymap.set("i", "<C-u>??", "\226\129\135")
    vim.keymap.set("i", "<C-u>?!", "\226\129\136")
    vim.keymap.set("i", "<C-u>!?", "\226\129\137")
    vim.keymap.set("i", "<C-u>_*", "\226\129\142")
    vim.keymap.set("i", "<C-u>^+", "\226\129\186")
    vim.keymap.set("i", "<C-u>^-", "\226\129\187")
    vim.keymap.set("i", "<C-u>^=", "\226\129\188")
    vim.keymap.set("i", "<C-u>^(", "\226\129\189")
    vim.keymap.set("i", "<C-u>^)", "\226\129\190")
    vim.keymap.set("i", "<C-u>_0", "\226\130\128")
    vim.keymap.set("i", "<C-u>_1", "\226\130\129")
    vim.keymap.set("i", "<C-u>_2", "\226\130\130")
    vim.keymap.set("i", "<C-u>_3", "\226\130\131")
    vim.keymap.set("i", "<C-u>_4", "\226\130\132")
    vim.keymap.set("i", "<C-u>_5", "\226\130\133")
    vim.keymap.set("i", "<C-u>_6", "\226\130\134")
    vim.keymap.set("i", "<C-u>_7", "\226\130\135")
    vim.keymap.set("i", "<C-u>_8", "\226\130\136")
    vim.keymap.set("i", "<C-u>_9", "\226\130\137")
    vim.keymap.set("i", "<C-u>_+", "\226\130\138")
    vim.keymap.set("i", "<C-u>_-", "\226\130\139")
    vim.keymap.set("i", "<C-u>_=", "\226\130\140")
    vim.keymap.set("i", "<C-u>_(", "\226\130\141")
    vim.keymap.set("i", "<C-u>_)", "\226\130\142")
    vim.keymap.set("i", "<C-U>tm", "\226\132\162")
    vim.keymap.set("i", "<C-U><-", "\226\134\144")
    vim.keymap.set("i", "<C-U>-^", "\226\134\145")
    vim.keymap.set("i", "<C-U>->", "\226\134\146")
    vim.keymap.set("i", "<C-U>-v", "\226\134\147")
    vim.keymap.set("i", "<C-U><~", "\226\134\156")
    vim.keymap.set("i", "<C-U>~>", "\226\134\157")
    vim.keymap.set("i", "<C-U><<-", "\226\134\158")
    vim.keymap.set("i", "<C-U>-^^", "\226\134\159")
    vim.keymap.set("i", "<C-U>->>", "\226\134\160")
    vim.keymap.set("i", "<C-U>-vv", "\226\134\161")
    vim.keymap.set("i", "<C-U><-(", "\226\134\162")
    vim.keymap.set("i", "<C-U>)->", "\226\134\163")
    vim.keymap.set("i", "<C-U><-<Bar>", "\226\134\164")
    vim.keymap.set("i", "<C-U><Bar>-^", "\226\134\165")
    vim.keymap.set("i", "<C-U><Bar>->", "\226\134\166")
    vim.keymap.set("i", "<C-U><Bar>-v", "\226\134\167")
    vim.keymap.set("i", "<C-U></", "\226\134\169")
    vim.keymap.set("i", "<C-U>\\>", "\226\134\170")
    vim.keymap.set("i", "<C-U><=", "\226\135\144")
    vim.keymap.set("i", "<C-U>=^", "\226\135\145")
    vim.keymap.set("i", "<C-U>=>", "\226\135\146")
    vim.keymap.set("i", "<C-U>=v", "\226\135\147")
    vim.keymap.set("i", "<C-U><=>", "\226\135\148")
    vim.keymap.set("i", "<C-U>^=v", "\226\135\149")
    vim.keymap.set("i", "<C-u>forall", "\226\136\128")
    vim.keymap.set("i", "<C-u>exists", "\226\136\131")
    vim.keymap.set("i", "<C-u>nexists", "\226\136\132")
    vim.keymap.set("i", "<C-u>empty", "\226\136\133")
    vim.keymap.set("i", "<C-u>incr", "\226\136\134")
    vim.keymap.set("i", "<C-u>nabla", "\226\136\135")
    vim.keymap.set("i", "<C-u>elem", "\226\136\136")
    vim.keymap.set("i", "<C-u>nelem", "\226\136\137")
    vim.keymap.set("i", "<C-u>selem", "\226\136\138")
    vim.keymap.set("i", "<C-u>contains", "\226\136\139")
    vim.keymap.set("i", "<C-u>ncontains", "\226\136\140")
    vim.keymap.set("i", "<C-u>scontains", "\226\136\141")
    vim.keymap.set("i", "<C-u>product", "\226\136\143")
    vim.keymap.set("i", "<C-u>coproduct", "\226\136\144")
    vim.keymap.set("i", "<C-u>sum", "\226\136\145")
    vim.keymap.set("i", "<C-u>bullet", "\226\136\153")
    vim.keymap.set("i", "<C-u>infinity", "\226\136\158")
    vim.keymap.set("i", "<C-u>and", "\226\136\167")
    vim.keymap.set("i", "<C-u>or", "\226\136\168")
    vim.keymap.set("i", "<C-u>intersection", "\226\136\169")
    vim.keymap.set("i", "<C-u>union", "\226\136\170")
    vim.keymap.set("i", "<C-U>/=", "\226\137\160")
    vim.keymap.set("i", "<C-U>=3", "\226\137\161")
    vim.keymap.set("i", "<C-U>/=3", "\226\137\162")
    vim.keymap.set("i", "<C-U>=<", "\226\137\164")
    vim.keymap.set("i", "<C-U>>=", "\226\137\165")
    vim.keymap.set("i", "<C-U>/<", "\226\137\174")
    vim.keymap.set("i", "<C-U>/>", "\226\137\175")
    vim.keymap.set("i", "<C-U>/=<", "\226\137\176")
    vim.keymap.set("i", "<C-U>/>=", "\226\137\177")
    vim.keymap.set("i", "<C-U>psubset", "\226\138\130")
    vim.keymap.set("i", "<C-U>psuperset", "\226\138\131")
    vim.keymap.set("i", "<C-U>/psubset", "\226\138\132")
    vim.keymap.set("i", "<C-U>/psuperset", "\226\138\133")
    vim.keymap.set("i", "<C-U>subset", "\226\138\134")
    vim.keymap.set("i", "<C-U>superset", "\226\138\135")
    vim.keymap.set("i", "<C-U>/subset", "\226\138\136")
    vim.keymap.set("i", "<C-U>/superset", "\226\138\137")
    vim.keymap.set("i", "<C-U>top", "\226\138\164")
    vim.keymap.set("i", "<C-U>bottom", "\226\138\165")
    vim.keymap.set("i", "<C-U>xor", "\226\138\187")
    vim.keymap.set("i", "<C-U>nand", "\226\138\188")
    vim.keymap.set("i", "<C-U>nor", "\226\138\189")
    vim.keymap.set("i", "<C-U>n-and", "\226\139\128")
    vim.keymap.set("i", "<C-U>n-or", "\226\139\129")
    vim.keymap.set("i", "<C-U>n-intersect", "\226\139\130")
    vim.keymap.set("i", "<C-U>n-union", "\226\139\131")
    vim.keymap.set("i", "<C-U>[[", "\226\159\166")
    vim.keymap.set("i", "<C-U>]]", "\226\159\167")
    vim.keymap.set("i", "<C-U>[<", "\226\159\168")
    vim.keymap.set("i", "<C-U>>]", "\226\159\169")
    vim.keymap.set("i", "<C-U>[<<", "\226\159\170")
    vim.keymap.set("i", "<C-U>>>]", "\226\159\171")
    vim.keymap.set("i", "<C-U>{{", "\226\166\131")
    vim.keymap.set("i", "<C-U>}}", "\226\166\132")
    vim.keymap.set("i", "<C-U>((", "\226\166\133")
    vim.keymap.set("i", "<C-U>))", "\226\166\134")
    vim.keymap.set("i", "<C-u>;", "\226\168\190")
    vim.keymap.set("i", "<C-U>bA", "\240\157\144\128")
    vim.keymap.set("i", "<C-U>bB", "\240\157\144\129")
    vim.keymap.set("i", "<C-U>bC", "\240\157\144\130")
    vim.keymap.set("i", "<C-U>bD", "\240\157\144\131")
    vim.keymap.set("i", "<C-U>bE", "\240\157\144\132")
    vim.keymap.set("i", "<C-U>bF", "\240\157\144\133")
    vim.keymap.set("i", "<C-U>bG", "\240\157\144\134")
    vim.keymap.set("i", "<C-U>bH", "\240\157\144\135")
    vim.keymap.set("i", "<C-U>bI", "\240\157\144\136")
    vim.keymap.set("i", "<C-U>bJ", "\240\157\144\137")
    vim.keymap.set("i", "<C-U>bK", "\240\157\144\138")
    vim.keymap.set("i", "<C-U>bL", "\240\157\144\139")
    vim.keymap.set("i", "<C-U>bM", "\240\157\144\140")
    vim.keymap.set("i", "<C-U>bN", "\240\157\144\141")
    vim.keymap.set("i", "<C-U>bO", "\240\157\144\142")
    vim.keymap.set("i", "<C-U>bP", "\240\157\144\143")
    vim.keymap.set("i", "<C-U>bQ", "\240\157\144\144")
    vim.keymap.set("i", "<C-U>bR", "\240\157\144\145")
    vim.keymap.set("i", "<C-U>bS", "\240\157\144\146")
    vim.keymap.set("i", "<C-U>bT", "\240\157\144\147")
    vim.keymap.set("i", "<C-U>bU", "\240\157\144\148")
    vim.keymap.set("i", "<C-U>bV", "\240\157\144\149")
    vim.keymap.set("i", "<C-U>bW", "\240\157\144\150")
    vim.keymap.set("i", "<C-U>bX", "\240\157\144\151")
    vim.keymap.set("i", "<C-U>bY", "\240\157\144\152")
    vim.keymap.set("i", "<C-U>bZ", "\240\157\144\153")
    vim.keymap.set("i", "<C-U>ba", "\240\157\144\154")
    vim.keymap.set("i", "<C-U>bb", "\240\157\144\155")
    vim.keymap.set("i", "<C-U>bc", "\240\157\144\156")
    vim.keymap.set("i", "<C-U>bd", "\240\157\144\157")
    vim.keymap.set("i", "<C-U>be", "\240\157\144\158")
    vim.keymap.set("i", "<C-U>bf", "\240\157\144\159")
    vim.keymap.set("i", "<C-U>bg", "\240\157\144\160")
    vim.keymap.set("i", "<C-U>bh", "\240\157\144\161")
    vim.keymap.set("i", "<C-U>bi", "\240\157\144\162")
    vim.keymap.set("i", "<C-U>bj", "\240\157\144\163")
    vim.keymap.set("i", "<C-U>bk", "\240\157\144\164")
    vim.keymap.set("i", "<C-U>bl", "\240\157\144\165")
    vim.keymap.set("i", "<C-U>bm", "\240\157\144\166")
    vim.keymap.set("i", "<C-U>bn", "\240\157\144\167")
    vim.keymap.set("i", "<C-U>bo", "\240\157\144\168")
    vim.keymap.set("i", "<C-U>bp", "\240\157\144\169")
    vim.keymap.set("i", "<C-U>bq", "\240\157\144\170")
    vim.keymap.set("i", "<C-U>br", "\240\157\144\171")
    vim.keymap.set("i", "<C-U>bs", "\240\157\144\172")
    vim.keymap.set("i", "<C-U>bt", "\240\157\144\173")
    vim.keymap.set("i", "<C-U>bu", "\240\157\144\174")
    vim.keymap.set("i", "<C-U>bv", "\240\157\144\175")
    vim.keymap.set("i", "<C-U>bw", "\240\157\144\176")
    vim.keymap.set("i", "<C-U>bx", "\240\157\144\177")
    vim.keymap.set("i", "<C-U>by", "\240\157\144\178")
    vim.keymap.set("i", "<C-U>bz", "\240\157\144\179")
    vim.keymap.set("i", "<C-U>iA", "\240\157\144\180")
    vim.keymap.set("i", "<C-U>iB", "\240\157\144\181")
    vim.keymap.set("i", "<C-U>iC", "\240\157\144\182")
    vim.keymap.set("i", "<C-U>iD", "\240\157\144\183")
    vim.keymap.set("i", "<C-U>iE", "\240\157\144\184")
    vim.keymap.set("i", "<C-U>iF", "\240\157\144\185")
    vim.keymap.set("i", "<C-U>iG", "\240\157\144\186")
    vim.keymap.set("i", "<C-U>iH", "\240\157\144\187")
    vim.keymap.set("i", "<C-U>iI", "\240\157\144\188")
    vim.keymap.set("i", "<C-U>iJ", "\240\157\144\189")
    vim.keymap.set("i", "<C-U>iK", "\240\157\144\190")
    vim.keymap.set("i", "<C-U>iL", "\240\157\144\191")
    vim.keymap.set("i", "<C-U>iM", "\240\157\145\128")
    vim.keymap.set("i", "<C-U>iN", "\240\157\145\129")
    vim.keymap.set("i", "<C-U>iO", "\240\157\145\130")
    vim.keymap.set("i", "<C-U>iP", "\240\157\145\131")
    vim.keymap.set("i", "<C-U>iQ", "\240\157\145\132")
    vim.keymap.set("i", "<C-U>iR", "\240\157\145\133")
    vim.keymap.set("i", "<C-U>iS", "\240\157\145\134")
    vim.keymap.set("i", "<C-U>iT", "\240\157\145\135")
    vim.keymap.set("i", "<C-U>iU", "\240\157\145\136")
    vim.keymap.set("i", "<C-U>iV", "\240\157\145\137")
    vim.keymap.set("i", "<C-U>iW", "\240\157\145\138")
    vim.keymap.set("i", "<C-U>iX", "\240\157\145\139")
    vim.keymap.set("i", "<C-U>iY", "\240\157\145\140")
    vim.keymap.set("i", "<C-U>iZ", "\240\157\145\141")
    vim.keymap.set("i", "<C-U>ia", "\240\157\145\142")
    vim.keymap.set("i", "<C-U>ib", "\240\157\145\143")
    vim.keymap.set("i", "<C-U>ic", "\240\157\145\144")
    vim.keymap.set("i", "<C-U>id", "\240\157\145\145")
    vim.keymap.set("i", "<C-U>ie", "\240\157\145\146")
    vim.keymap.set("i", "<C-U>if", "\240\157\145\147")
    vim.keymap.set("i", "<C-U>ig", "\240\157\145\148")
    vim.keymap.set("i", "<C-U>ih", "\226\132\142")
    vim.keymap.set("i", "<C-U>ii", "\240\157\145\150")
    vim.keymap.set("i", "<C-U>ij", "\240\157\145\151")
    vim.keymap.set("i", "<C-U>ik", "\240\157\145\152")
    vim.keymap.set("i", "<C-U>il", "\240\157\145\153")
    vim.keymap.set("i", "<C-U>im", "\240\157\145\154")
    vim.keymap.set("i", "<C-U>in", "\240\157\145\155")
    vim.keymap.set("i", "<C-U>io", "\240\157\145\156")
    vim.keymap.set("i", "<C-U>ip", "\240\157\145\157")
    vim.keymap.set("i", "<C-U>iq", "\240\157\145\158")
    vim.keymap.set("i", "<C-U>ir", "\240\157\145\159")
    vim.keymap.set("i", "<C-U>is", "\240\157\145\160")
    vim.keymap.set("i", "<C-U>it", "\240\157\145\161")
    vim.keymap.set("i", "<C-U>iu", "\240\157\145\162")
    vim.keymap.set("i", "<C-U>iv", "\240\157\145\163")
    vim.keymap.set("i", "<C-U>iw", "\240\157\145\164")
    vim.keymap.set("i", "<C-U>ix", "\240\157\145\165")
    vim.keymap.set("i", "<C-U>iy", "\240\157\145\166")
    vim.keymap.set("i", "<C-U>iz", "\240\157\145\167")
    vim.keymap.set("i", "<C-U>biA", "\240\157\145\168")
    vim.keymap.set("i", "<C-U>biB", "\240\157\145\169")
    vim.keymap.set("i", "<C-U>biC", "\240\157\145\170")
    vim.keymap.set("i", "<C-U>biD", "\240\157\145\171")
    vim.keymap.set("i", "<C-U>biE", "\240\157\145\172")
    vim.keymap.set("i", "<C-U>biF", "\240\157\145\173")
    vim.keymap.set("i", "<C-U>biG", "\240\157\145\174")
    vim.keymap.set("i", "<C-U>biH", "\240\157\145\175")
    vim.keymap.set("i", "<C-U>biI", "\240\157\145\176")
    vim.keymap.set("i", "<C-U>biJ", "\240\157\145\177")
    vim.keymap.set("i", "<C-U>biK", "\240\157\145\178")
    vim.keymap.set("i", "<C-U>biL", "\240\157\145\179")
    vim.keymap.set("i", "<C-U>biM", "\240\157\145\180")
    vim.keymap.set("i", "<C-U>biN", "\240\157\145\181")
    vim.keymap.set("i", "<C-U>biO", "\240\157\145\182")
    vim.keymap.set("i", "<C-U>biP", "\240\157\145\183")
    vim.keymap.set("i", "<C-U>biQ", "\240\157\145\184")
    vim.keymap.set("i", "<C-U>biR", "\240\157\145\185")
    vim.keymap.set("i", "<C-U>biS", "\240\157\145\186")
    vim.keymap.set("i", "<C-U>biT", "\240\157\145\187")
    vim.keymap.set("i", "<C-U>biU", "\240\157\145\188")
    vim.keymap.set("i", "<C-U>biV", "\240\157\145\189")
    vim.keymap.set("i", "<C-U>biW", "\240\157\145\190")
    vim.keymap.set("i", "<C-U>biX", "\240\157\145\191")
    vim.keymap.set("i", "<C-U>biY", "\240\157\146\128")
    vim.keymap.set("i", "<C-U>biZ", "\240\157\146\129")
    vim.keymap.set("i", "<C-U>bia", "\240\157\146\130")
    vim.keymap.set("i", "<C-U>bib", "\240\157\146\131")
    vim.keymap.set("i", "<C-U>bic", "\240\157\146\132")
    vim.keymap.set("i", "<C-U>bid", "\240\157\146\133")
    vim.keymap.set("i", "<C-U>bie", "\240\157\146\134")
    vim.keymap.set("i", "<C-U>bif", "\240\157\146\135")
    vim.keymap.set("i", "<C-U>big", "\240\157\146\136")
    vim.keymap.set("i", "<C-U>bih", "\240\157\146\137")
    vim.keymap.set("i", "<C-U>bii", "\240\157\146\138")
    vim.keymap.set("i", "<C-U>bij", "\240\157\146\139")
    vim.keymap.set("i", "<C-U>bik", "\240\157\146\140")
    vim.keymap.set("i", "<C-U>bil", "\240\157\146\141")
    vim.keymap.set("i", "<C-U>bim", "\240\157\146\142")
    vim.keymap.set("i", "<C-U>bin", "\240\157\146\143")
    vim.keymap.set("i", "<C-U>bio", "\240\157\146\144")
    vim.keymap.set("i", "<C-U>bip", "\240\157\146\145")
    vim.keymap.set("i", "<C-U>biq", "\240\157\146\146")
    vim.keymap.set("i", "<C-U>bir", "\240\157\146\147")
    vim.keymap.set("i", "<C-U>bis", "\240\157\146\148")
    vim.keymap.set("i", "<C-U>bit", "\240\157\146\149")
    vim.keymap.set("i", "<C-U>biu", "\240\157\146\150")
    vim.keymap.set("i", "<C-U>biv", "\240\157\146\151")
    vim.keymap.set("i", "<C-U>biw", "\240\157\146\152")
    vim.keymap.set("i", "<C-U>bix", "\240\157\146\153")
    vim.keymap.set("i", "<C-U>biy", "\240\157\146\154")
    vim.keymap.set("i", "<C-U>biz", "\240\157\146\155")
    vim.keymap.set("i", "<C-U>sA", "\240\157\146\156")
    vim.keymap.set("i", "<C-U>sB", "\226\132\172")
    vim.keymap.set("i", "<C-U>sC", "\240\157\146\158")
    vim.keymap.set("i", "<C-U>sD", "\240\157\146\159")
    vim.keymap.set("i", "<C-U>sE", "\226\132\176")
    vim.keymap.set("i", "<C-U>sF", "\226\132\177")
    vim.keymap.set("i", "<C-U>sG", "\240\157\146\162")
    vim.keymap.set("i", "<C-U>sH", "\226\132\139")
    vim.keymap.set("i", "<C-U>sI", "\226\132\144")
    vim.keymap.set("i", "<C-U>sJ", "\240\157\146\165")
    vim.keymap.set("i", "<C-U>sK", "\240\157\146\166")
    vim.keymap.set("i", "<C-U>sL", "\226\132\146")
    vim.keymap.set("i", "<C-U>sM", "\226\132\179")
    vim.keymap.set("i", "<C-U>sN", "\240\157\146\169")
    vim.keymap.set("i", "<C-U>sO", "\240\157\146\170")
    vim.keymap.set("i", "<C-U>sP", "\240\157\146\171")
    vim.keymap.set("i", "<C-U>sQ", "\240\157\146\172")
    vim.keymap.set("i", "<C-U>sR", "\226\132\155")
    vim.keymap.set("i", "<C-U>sS", "\240\157\146\174")
    vim.keymap.set("i", "<C-U>sT", "\240\157\146\175")
    vim.keymap.set("i", "<C-U>sU", "\240\157\146\176")
    vim.keymap.set("i", "<C-U>sV", "\240\157\146\177")
    vim.keymap.set("i", "<C-U>sW", "\240\157\146\178")
    vim.keymap.set("i", "<C-U>sX", "\240\157\146\179")
    vim.keymap.set("i", "<C-U>sY", "\240\157\146\180")
    vim.keymap.set("i", "<C-U>sZ", "\240\157\146\181")
    vim.keymap.set("i", "<C-U>sa", "\240\157\146\182")
    vim.keymap.set("i", "<C-U>sb", "\240\157\146\183")
    vim.keymap.set("i", "<C-U>sc", "\240\157\146\184")
    vim.keymap.set("i", "<C-U>sd", "\240\157\146\185")
    vim.keymap.set("i", "<C-U>se", "\226\132\175")
    vim.keymap.set("i", "<C-U>sf", "\240\157\146\187")
    vim.keymap.set("i", "<C-U>sg", "\226\132\138")
    vim.keymap.set("i", "<C-U>sh", "\240\157\146\189")
    vim.keymap.set("i", "<C-U>si", "\240\157\146\190")
    vim.keymap.set("i", "<C-U>sj", "\240\157\146\191")
    vim.keymap.set("i", "<C-U>sk", "\240\157\147\128")
    vim.keymap.set("i", "<C-U>sl", "\226\132\147")
    vim.keymap.set("i", "<C-U>sm", "\240\157\147\130")
    vim.keymap.set("i", "<C-U>sn", "\240\157\147\131")
    vim.keymap.set("i", "<C-U>so", "\226\132\180")
    vim.keymap.set("i", "<C-U>sp", "\240\157\147\133")
    vim.keymap.set("i", "<C-U>sq", "\240\157\147\134")
    vim.keymap.set("i", "<C-U>sr", "\240\157\147\135")
    vim.keymap.set("i", "<C-U>ss", "\240\157\147\136")
    vim.keymap.set("i", "<C-U>st", "\240\157\147\137")
    vim.keymap.set("i", "<C-U>su", "\240\157\147\138")
    vim.keymap.set("i", "<C-U>sv", "\240\157\147\139")
    vim.keymap.set("i", "<C-U>sw", "\240\157\147\140")
    vim.keymap.set("i", "<C-U>sx", "\240\157\147\141")
    vim.keymap.set("i", "<C-U>sy", "\240\157\147\142")
    vim.keymap.set("i", "<C-U>sz", "\240\157\147\143")
    vim.keymap.set("i", "<C-U>sbA", "\240\157\147\144")
    vim.keymap.set("i", "<C-U>sbB", "\240\157\147\145")
    vim.keymap.set("i", "<C-U>sbC", "\240\157\147\146")
    vim.keymap.set("i", "<C-U>sbD", "\240\157\147\147")
    vim.keymap.set("i", "<C-U>sbE", "\240\157\147\148")
    vim.keymap.set("i", "<C-U>sbF", "\240\157\147\149")
    vim.keymap.set("i", "<C-U>sbG", "\240\157\147\150")
    vim.keymap.set("i", "<C-U>sbH", "\240\157\147\151")
    vim.keymap.set("i", "<C-U>sbI", "\240\157\147\152")
    vim.keymap.set("i", "<C-U>sbJ", "\240\157\147\153")
    vim.keymap.set("i", "<C-U>sbK", "\240\157\147\154")
    vim.keymap.set("i", "<C-U>sbL", "\240\157\147\155")
    vim.keymap.set("i", "<C-U>sbM", "\240\157\147\156")
    vim.keymap.set("i", "<C-U>sbN", "\240\157\147\157")
    vim.keymap.set("i", "<C-U>sbO", "\240\157\147\158")
    vim.keymap.set("i", "<C-U>sbP", "\240\157\147\159")
    vim.keymap.set("i", "<C-U>sbQ", "\240\157\147\160")
    vim.keymap.set("i", "<C-U>sbR", "\240\157\147\161")
    vim.keymap.set("i", "<C-U>sbS", "\240\157\147\162")
    vim.keymap.set("i", "<C-U>sbT", "\240\157\147\163")
    vim.keymap.set("i", "<C-U>sbU", "\240\157\147\164")
    vim.keymap.set("i", "<C-U>sbV", "\240\157\147\165")
    vim.keymap.set("i", "<C-U>sbW", "\240\157\147\166")
    vim.keymap.set("i", "<C-U>sbX", "\240\157\147\167")
    vim.keymap.set("i", "<C-U>sbY", "\240\157\147\168")
    vim.keymap.set("i", "<C-U>sbZ", "\240\157\147\169")
    vim.keymap.set("i", "<C-U>sba", "\240\157\147\170")
    vim.keymap.set("i", "<C-U>sbb", "\240\157\147\171")
    vim.keymap.set("i", "<C-U>sbc", "\240\157\147\172")
    vim.keymap.set("i", "<C-U>sbd", "\240\157\147\173")
    vim.keymap.set("i", "<C-U>sbe", "\240\157\147\174")
    vim.keymap.set("i", "<C-U>sbf", "\240\157\147\175")
    vim.keymap.set("i", "<C-U>sbg", "\240\157\147\176")
    vim.keymap.set("i", "<C-U>sbh", "\240\157\147\177")
    vim.keymap.set("i", "<C-U>sbi", "\240\157\147\178")
    vim.keymap.set("i", "<C-U>sbj", "\240\157\147\179")
    vim.keymap.set("i", "<C-U>sbk", "\240\157\147\180")
    vim.keymap.set("i", "<C-U>sbl", "\240\157\147\181")
    vim.keymap.set("i", "<C-U>sbm", "\240\157\147\182")
    vim.keymap.set("i", "<C-U>sbn", "\240\157\147\183")
    vim.keymap.set("i", "<C-U>sbo", "\240\157\147\184")
    vim.keymap.set("i", "<C-U>sbp", "\240\157\147\185")
    vim.keymap.set("i", "<C-U>sbq", "\240\157\147\186")
    vim.keymap.set("i", "<C-U>sbr", "\240\157\147\187")
    vim.keymap.set("i", "<C-U>sbs", "\240\157\147\188")
    vim.keymap.set("i", "<C-U>sbt", "\240\157\147\189")
    vim.keymap.set("i", "<C-U>sbu", "\240\157\147\190")
    vim.keymap.set("i", "<C-U>sbv", "\240\157\147\191")
    vim.keymap.set("i", "<C-U>sbw", "\240\157\148\128")
    vim.keymap.set("i", "<C-U>sbx", "\240\157\148\129")
    vim.keymap.set("i", "<C-U>sby", "\240\157\148\130")
    vim.keymap.set("i", "<C-U>sbz", "\240\157\148\131")
    vim.keymap.set("i", "<C-U>bAlpha", "\240\157\154\168")
    vim.keymap.set("i", "<C-U>bBeta", "\240\157\154\169")
    vim.keymap.set("i", "<C-U>bGamma", "\240\157\154\170")
    vim.keymap.set("i", "<C-U>bDelta", "\240\157\154\171")
    vim.keymap.set("i", "<C-U>bEpsilon", "\240\157\154\172")
    vim.keymap.set("i", "<C-U>bZeta", "\240\157\154\173")
    vim.keymap.set("i", "<C-U>bEta", "\240\157\154\174")
    vim.keymap.set("i", "<C-U>bTheta", "\240\157\154\175")
    vim.keymap.set("i", "<C-U>bIota", "\240\157\154\176")
    vim.keymap.set("i", "<C-U>bKappa", "\240\157\154\177")
    vim.keymap.set("i", "<C-U>bLambda", "\240\157\154\178")
    vim.keymap.set("i", "<C-U>bMu", "\240\157\154\179")
    vim.keymap.set("i", "<C-U>bNu", "\240\157\154\180")
    vim.keymap.set("i", "<C-U>bXi", "\240\157\154\181")
    vim.keymap.set("i", "<C-U>bOmnicron", "\240\157\154\182")
    vim.keymap.set("i", "<C-U>bPi", "\240\157\154\183")
    vim.keymap.set("i", "<C-U>bRho", "\240\157\154\184")
    vim.keymap.set("i", "<C-U>bSigma", "\240\157\154\186")
    vim.keymap.set("i", "<C-U>bTau", "\240\157\154\187")
    vim.keymap.set("i", "<C-U>bUpsilon", "\240\157\154\188")
    vim.keymap.set("i", "<C-U>bPhi", "\240\157\154\189")
    vim.keymap.set("i", "<C-U>bChi", "\240\157\154\190")
    vim.keymap.set("i", "<C-U>bPsi", "\240\157\154\191")
    vim.keymap.set("i", "<C-U>bOmega", "\240\157\155\128")
    vim.keymap.set("i", "<C-U>bNabla", "\240\157\155\129")
    vim.keymap.set("i", "<C-U>balpha", "\240\157\155\130")
    vim.keymap.set("i", "<C-U>bbeta", "\240\157\155\131")
    vim.keymap.set("i", "<C-U>bgamma", "\240\157\155\132")
    vim.keymap.set("i", "<C-U>bdelta", "\240\157\155\133")
    vim.keymap.set("i", "<C-U>bepsilon", "\240\157\155\134")
    vim.keymap.set("i", "<C-U>bzeta", "\240\157\155\135")
    vim.keymap.set("i", "<C-U>btheta", "\240\157\155\137")
    vim.keymap.set("i", "<C-U>biota", "\240\157\155\138")
    vim.keymap.set("i", "<C-U>bkappa", "\240\157\155\139")
    vim.keymap.set("i", "<C-U>blambda", "\240\157\155\140")
    vim.keymap.set("i", "<C-U>bmu", "\240\157\155\141")
    vim.keymap.set("i", "<C-U>bnu", "\240\157\155\142")
    vim.keymap.set("i", "<C-U>bxi", "\240\157\155\143")
    vim.keymap.set("i", "<C-U>bomnicron", "\240\157\155\144")
    vim.keymap.set("i", "<C-U>bpi", "\240\157\155\145")
    vim.keymap.set("i", "<C-U>brho", "\240\157\155\146")
    vim.keymap.set("i", "<C-U>bfsigma", "\240\157\155\147")
    vim.keymap.set("i", "<C-U>bsigma", "\240\157\155\148")
    vim.keymap.set("i", "<C-U>btau", "\240\157\155\149")
    vim.keymap.set("i", "<C-U>bupsilon", "\240\157\155\150")
    vim.keymap.set("i", "<C-U>bphi", "\240\157\155\151")
    vim.keymap.set("i", "<C-U>bchi", "\240\157\155\152")
    vim.keymap.set("i", "<C-U>bpsi", "\240\157\155\153")
    vim.keymap.set("i", "<C-U>bomega", "\240\157\155\154")
    vim.keymap.set("i", "<C-U>bpdiff", "\240\157\155\155")
    vim.keymap.set("i", "<C-U>iAlpha", "\240\157\155\162")
    vim.keymap.set("i", "<C-U>iBeta", "\240\157\155\163")
    vim.keymap.set("i", "<C-U>iGamma", "\240\157\155\164")
    vim.keymap.set("i", "<C-U>iDelta", "\240\157\155\165")
    vim.keymap.set("i", "<C-U>iEpsilon", "\240\157\155\166")
    vim.keymap.set("i", "<C-U>iZeta", "\240\157\155\167")
    vim.keymap.set("i", "<C-U>iEta", "\240\157\155\168")
    vim.keymap.set("i", "<C-U>iTheta", "\240\157\155\169")
    vim.keymap.set("i", "<C-U>iIota", "\240\157\155\170")
    vim.keymap.set("i", "<C-U>iKappa", "\240\157\155\171")
    vim.keymap.set("i", "<C-U>iLambda", "\240\157\155\172")
    vim.keymap.set("i", "<C-U>iMu", "\240\157\155\173")
    vim.keymap.set("i", "<C-U>iNu", "\240\157\155\174")
    vim.keymap.set("i", "<C-U>iXi", "\240\157\155\175")
    vim.keymap.set("i", "<C-U>iOmnicron", "\240\157\155\176")
    vim.keymap.set("i", "<C-U>iPi", "\240\157\155\177")
    vim.keymap.set("i", "<C-U>iRho", "\240\157\155\178")
    vim.keymap.set("i", "<C-U>iSigma", "\240\157\155\180")
    vim.keymap.set("i", "<C-U>iTau", "\240\157\155\181")
    vim.keymap.set("i", "<C-U>iUpsilon", "\240\157\155\182")
    vim.keymap.set("i", "<C-U>iPhi", "\240\157\155\183")
    vim.keymap.set("i", "<C-U>iChi", "\240\157\155\184")
    vim.keymap.set("i", "<C-U>iPsi", "\240\157\155\185")
    vim.keymap.set("i", "<C-U>iOmega", "\240\157\155\186")
    vim.keymap.set("i", "<C-U>iNabla", "\240\157\155\187")
    vim.keymap.set("i", "<C-U>ialpha", "\240\157\155\188")
    vim.keymap.set("i", "<C-U>ibeta", "\240\157\155\189")
    vim.keymap.set("i", "<C-U>igamma", "\240\157\155\190")
    vim.keymap.set("i", "<C-U>idelta", "\240\157\155\191")
    vim.keymap.set("i", "<C-U>iepsilon", "\240\157\156\128")
    vim.keymap.set("i", "<C-U>izeta", "\240\157\156\129")
    vim.keymap.set("i", "<C-U>ieta", "\240\157\156\130")
    vim.keymap.set("i", "<C-U>itheta", "\240\157\156\131")
    vim.keymap.set("i", "<C-U>iiota", "\240\157\156\132")
    vim.keymap.set("i", "<C-U>ikappa", "\240\157\156\133")
    vim.keymap.set("i", "<C-U>ilambda", "\240\157\156\134")
    vim.keymap.set("i", "<C-U>imu", "\240\157\156\135")
    vim.keymap.set("i", "<C-U>inu", "\240\157\156\136")
    vim.keymap.set("i", "<C-U>ixi", "\240\157\156\137")
    vim.keymap.set("i", "<C-U>iomnicron", "\240\157\156\138")
    vim.keymap.set("i", "<C-U>ipi", "\240\157\156\139")
    vim.keymap.set("i", "<C-U>irho", "\240\157\156\140")
    vim.keymap.set("i", "<C-U>ifsigma", "\240\157\156\141")
    vim.keymap.set("i", "<C-U>isigma", "\240\157\156\142")
    vim.keymap.set("i", "<C-U>itau", "\240\157\156\143")
    vim.keymap.set("i", "<C-U>iupsilon", "\240\157\156\144")
    vim.keymap.set("i", "<C-U>iphi", "\240\157\156\145")
    vim.keymap.set("i", "<C-U>ichi", "\240\157\156\146")
    vim.keymap.set("i", "<C-U>ipsi", "\240\157\156\147")
    vim.keymap.set("i", "<C-U>iomega", "\240\157\156\148")
    vim.keymap.set("i", "<C-U>ipdiff", "\240\157\156\149")
    vim.keymap.set("i", "<C-U>biAlpha", "\240\157\156\156")
    vim.keymap.set("i", "<C-U>biBeta", "\240\157\156\157")
    vim.keymap.set("i", "<C-U>biGamma", "\240\157\156\158")
    vim.keymap.set("i", "<C-U>biDelta", "\240\157\156\159")
    vim.keymap.set("i", "<C-U>biEpsilon", "\240\157\156\160")
    vim.keymap.set("i", "<C-U>biZeta", "\240\157\156\161")
    vim.keymap.set("i", "<C-U>biEta", "\240\157\156\162")
    vim.keymap.set("i", "<C-U>biTheta", "\240\157\156\163")
    vim.keymap.set("i", "<C-U>biIota", "\240\157\156\164")
    vim.keymap.set("i", "<C-U>biKappa", "\240\157\156\165")
    vim.keymap.set("i", "<C-U>biLambda", "\240\157\156\166")
    vim.keymap.set("i", "<C-U>biMu", "\240\157\156\167")
    vim.keymap.set("i", "<C-U>biNu", "\240\157\156\168")
    vim.keymap.set("i", "<C-U>biXi", "\240\157\156\169")
    vim.keymap.set("i", "<C-U>biOmnicron", "\240\157\156\170")
    vim.keymap.set("i", "<C-U>biPi", "\240\157\156\171")
    vim.keymap.set("i", "<C-U>biRho", "\240\157\156\172")
    vim.keymap.set("i", "<C-U>biSigma", "\240\157\156\174")
    vim.keymap.set("i", "<C-U>biTau", "\240\157\156\175")
    vim.keymap.set("i", "<C-U>biUpsilon", "\240\157\156\176")
    vim.keymap.set("i", "<C-U>biPhi", "\240\157\156\177")
    vim.keymap.set("i", "<C-U>biChi", "\240\157\156\178")
    vim.keymap.set("i", "<C-U>biPsi", "\240\157\156\179")
    vim.keymap.set("i", "<C-U>biOmega", "\240\157\156\180")
    vim.keymap.set("i", "<C-U>biNabla", "\240\157\156\181")
    vim.keymap.set("i", "<C-U>bialpha", "\240\157\156\182")
    vim.keymap.set("i", "<C-U>bibeta", "\240\157\156\183")
    vim.keymap.set("i", "<C-U>bigamma", "\240\157\156\184")
    vim.keymap.set("i", "<C-U>bidelta", "\240\157\156\185")
    vim.keymap.set("i", "<C-U>biepsilon", "\240\157\156\186")
    vim.keymap.set("i", "<C-U>bizeta", "\240\157\156\187")
    vim.keymap.set("i", "<C-U>bieta", "\240\157\156\188")
    vim.keymap.set("i", "<C-U>bitheta", "\240\157\156\189")
    vim.keymap.set("i", "<C-U>biiota", "\240\157\156\190")
    vim.keymap.set("i", "<C-U>bikappa", "\240\157\156\191")
    vim.keymap.set("i", "<C-U>bilambda", "\240\157\157\128")
    vim.keymap.set("i", "<C-U>bimu", "\240\157\157\129")
    vim.keymap.set("i", "<C-U>binu", "\240\157\157\130")
    vim.keymap.set("i", "<C-U>bixi", "\240\157\157\131")
    vim.keymap.set("i", "<C-U>biomnicron", "\240\157\157\132")
    vim.keymap.set("i", "<C-U>bipi", "\240\157\157\133")
    vim.keymap.set("i", "<C-U>birho", "\240\157\157\134")
    vim.keymap.set("i", "<C-U>bifsigma", "\240\157\157\135")
    vim.keymap.set("i", "<C-U>bisigma", "\240\157\157\136")
    vim.keymap.set("i", "<C-U>bitau", "\240\157\157\137")
    vim.keymap.set("i", "<C-U>biupsilon", "\240\157\157\138")
    vim.keymap.set("i", "<C-U>biphi", "\240\157\157\139")
    vim.keymap.set("i", "<C-U>bichi", "\240\157\157\140")
    vim.keymap.set("i", "<C-U>bipsi", "\240\157\157\141")
    vim.keymap.set("i", "<C-U>biomega", "\240\157\157\142")
    vim.keymap.set("i", "<C-U>bipdiff", "\240\157\157\143")
    vim.keymap.set("i", "<C-U>b0", "\240\157\159\142")
    vim.keymap.set("i", "<C-U>b1", "\240\157\159\143")
    vim.keymap.set("i", "<C-U>b2", "\240\157\159\144")
    vim.keymap.set("i", "<C-U>b3", "\240\157\159\145")
    vim.keymap.set("i", "<C-U>b4", "\240\157\159\146")
    vim.keymap.set("i", "<C-U>b5", "\240\157\159\147")
    vim.keymap.set("i", "<C-U>b6", "\240\157\159\148")
    vim.keymap.set("i", "<C-U>b7", "\240\157\159\149")
    vim.keymap.set("i", "<C-U>b8", "\240\157\159\150")
    vim.keymap.set("i", "<C-U>b9", "\240\157\159\151")
    return vim.notify("Set Unicode mappings.")
  end
  return vim.keymap.set("i", "<C-u>", _116_)
end
require("mappings")
vim.cmd.sign("define", "DiagnosticSignError", "text=\226\156\151", "texthl=DiagnosticSignError", "linehl=", "numhl=")
vim.cmd.sign("define", "DiagnosticSignWarn", "text=\226\154\160", "texthl=DiagnosticSignWarn", "linehl=", "numhl=")
vim.cmd.sign("define", "DiagnosticSignInfo", "text=\226\132\185", "texthl=DiagnosticSignInfo", "linehl=", "numhl=")
vim.cmd.sign("define", "DiagnosticSignHint", "text=\226\158\164", "texthl=DiagnosticSignHint", "linehl=", "numhl=")
vim.diagnostic.config({float = {scope = "cursor", header = ""}, underline = {severity = vim.diagnostic.severity.ERROR}, virtual_lines = {only_current_line = true}, virtual_text = false})
vim.api.nvim_create_augroup("mitchellwrosen", {})
local function _117_(opts)
  local function _118_()
    local last_known_pos = vim.api.nvim_buf_get_mark(opts.buf, "\"")
    local last_known_line = last_known_pos[1]
    if ((last_known_line > 1) and (last_known_line <= vim.api.nvim_buf_line_count(opts.buf))) then
      return vim.api.nvim_feedkeys("g`\"", "nx", false)
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("BufWinEnter", {buffer = opts.buf, once = true, callback = _118_, group = "mitchellwrosen"})
end
vim.api.nvim_create_autocmd("BufRead", {group = "mitchellwrosen", callback = _117_})
local function _120_()
  vim.bo.modifiable = not vim.bo.readonly
  return nil
end
vim.api.nvim_create_autocmd("BufReadPost", {group = "mitchellwrosen", callback = _120_})
local function _121_()
  return vim.highlight.on_yank({higroup = "IncSearch", timeout = 300})
end
vim.api.nvim_create_autocmd("TextYankPost", {group = "mitchellwrosen", callback = _121_})
local function _122_()
  if (vim.fn.getcmdwintype() == "") then
    return vim.cmd.checktime()
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"CursorHold", "FocusGained"}, {group = "mitchellwrosen", callback = _122_})
local function _124_()
  if ((vim.o.buftype == "") and (vim.api.nvim_buf_get_name(0) ~= "")) then
    local view = vim.fn.winsaveview()
    vim.cmd("keeppatterns silent! %s/\\s\\+$//e")
    vim.cmd("silent! update")
    return vim.fn.winrestview(view)
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {group = "mitchellwrosen", callback = _124_})
local extract_haskell_typesig_from_markdown
local function _126_(str0)
  local str = str0
  local i = nil
  i = string.find(str, "```haskell\n")
  if i then
    str = string.sub(str, (i + 11))
    i = string.find(str, "\n```")
    if i then
      str = string.sub(str, 1, (i - 1))
      i = string.find(str, ":: ")
      if i then
        str = string.sub(str, (i + 3))
        i = string.find(str, "forall")
        if (i == 1) then
          i = string.find(str, "%.")
          str = string.sub(str, (i + 2))
        else
        end
        str = string.gsub(str, "\n", " ")
        str = string.gsub(str, "%%1 %->", "->")
        return str
      else
        return nil
      end
    else
      return nil
    end
  else
    return nil
  end
end
extract_haskell_typesig_from_markdown = _126_
local hover_namespace = vim.api.nvim_create_namespace("hover")
local function _134_(_131_)
  local _arg_132_ = _131_
  local buf = _arg_132_["buf"]
  local _arg_133_ = _arg_132_["data"]
  local client_id = _arg_133_["client_id"]
  local client = vim.lsp.get_client_by_id(client_id)
  vim.cmd("highlight LspReference guifg=NONE guibg=#665c54 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59")
  vim.cmd("highlight! link LspReferenceText LspReference")
  vim.cmd("highlight! link LspReferenceRead LspReference")
  vim.cmd("highlight! link LspReferenceWrite LspReference")
  vim.cmd("highlight! link DiagnosticVirtualTextError DiagnosticSignError")
  vim.cmd("highlight! link DiagnosticVirtualTextInfo DiagnosticSignInfo")
  vim.cmd("highlight! link DiagnosticVirtualTextWarn DiagnosticSignWarn")
  local function next_reference_index(_135_, references)
    local _arg_136_ = _135_
    local cursor_row = _arg_136_["row"]
    local cursor_col = _arg_136_["col"]
    local ref_ix = nil
    for i, ref in ipairs(references) do
      if ref_ix then break end
      local _local_137_ = ref
      local _local_138_ = _local_137_["range"]
      local _local_139_ = _local_138_["start"]
      local ref_row0 = _local_139_["line"]
      local ref_col = _local_139_["character"]
      local ref_row = (ref_row0 + 1)
      if ((ref_row > cursor_row) or ((ref_row == cursor_row) and (ref_col > cursor_col))) then
        ref_ix = i
      else
      end
    end
    if ref_ix then
      return ref_ix
    else
      return 1
    end
  end
  if client.supports_method("textDocument/documentHighlight") then
    local function _142_()
      local references = vim.b["document-highlights"]
      if references then
        if (#references > 1) then
          local next_ref_ix
          local _143_
          do
            local _local_144_ = vim.api.nvim_win_get_cursor(0)
            local row_1_auto = _local_144_[1]
            local col_2_auto = _local_144_[2]
            _143_ = {col = col_2_auto, row = row_1_auto}
          end
          next_ref_ix = next_reference_index(_143_, references)
          local _local_145_ = references[next_ref_ix]
          local _local_146_ = _local_145_["range"]
          local _local_147_ = _local_146_["start"]
          local next_ref_row = _local_147_["line"]
          local next_ref_col = _local_147_["character"]
          local _local_148_ = {row = (next_ref_row + 1), col = next_ref_col}
          local col_22_auto = _local_148_["col"]
          local row_21_auto = _local_148_["row"]
          return vim.api.nvim_win_set_cursor(0, {row_21_auto, col_22_auto})
        else
          return nil
        end
      else
        return vim.cmd("normal! nzz")
      end
    end
    vim.keymap.set("n", "n", _142_)
    local function _151_()
      local references = vim.b["document-highlights"]
      if references then
        local num_refs = #references
        if (num_refs > 1) then
          local next_ref_ix
          local _152_
          do
            local _local_153_ = vim.api.nvim_win_get_cursor(0)
            local row_1_auto = _local_153_[1]
            local col_2_auto = _local_153_[2]
            _152_ = {col = col_2_auto, row = row_1_auto}
          end
          next_ref_ix = next_reference_index(_152_, references)
          local prev_ref_ix
          if (next_ref_ix == 1) then
            prev_ref_ix = (num_refs - 1)
          elseif (next_ref_ix == 2) then
            prev_ref_ix = num_refs
          else
            prev_ref_ix = (next_ref_ix - 2)
          end
          local _local_155_ = references[prev_ref_ix]
          local _local_156_ = _local_155_["range"]
          local _local_157_ = _local_156_["start"]
          local prev_ref_row = _local_157_["line"]
          local prev_ref_col = _local_157_["character"]
          local _local_158_ = {row = (prev_ref_row + 1), col = prev_ref_col}
          local col_22_auto = _local_158_["col"]
          local row_21_auto = _local_158_["row"]
          return vim.api.nvim_win_set_cursor(0, {row_21_auto, col_22_auto})
        else
          return nil
        end
      else
        return vim.cmd("normal! Nzz")
      end
    end
    vim.keymap.set("n", "N", _151_)
  else
  end
  if client.supports_method("textDocument/codeAction") then
    vim.keymap.set("n", "<Space>la", vim.lsp.buf.code_action, {buffer = buf, desc = "Apply code action", silent = true})
  else
  end
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = buf, desc = "Go to definition", silent = true})
  vim.keymap.set("n", "<Space>ld", vim.lsp.buf.definition, {buffer = buf, desc = "Go to definition", silent = true})
  if client.supports_method("textDocument/formatting") then
    vim.keymap.set("n", "<Space>d", vim.lsp.buf.format, {buffer = buf, desc = "Format code", silent = true})
    vim.keymap.set("n", "<Space>lf", vim.lsp.buf.format, {buffer = buf, desc = "Format code", silent = true})
  else
  end
  if client.supports_method("textDocument/hover") then
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded", silent = true})
    vim.keymap.set("n", "<Enter>", vim.lsp.buf.hover, {buffer = buf, silent = true})
  else
  end
  if client.supports_method("textDocument/prepareCallHierarchy") then
    vim.keymap.set("n", "<Space>li", vim.lsp.buf.incoming_calls, {buffer = buf, desc = "Incoming calls", silent = true})
    vim.keymap.set("n", "<Space>lo", vim.lsp.buf.outgoing_calls, {buffer = buf, desc = "Outgoing calls", silent = true})
  else
  end
  if client.supports_method("textDocument/references") then
    vim.keymap.set("n", "<Space>lr", vim.lsp.buf.references, {buffer = buf, desc = "References", silent = true})
  else
  end
  if client.supports_method("textDocument/rename") then
    vim.keymap.set("n", "<Space>ln", vim.lsp.buf.rename, {buffer = buf, desc = "Rename", silent = true})
  else
  end
  if client.supports_method("textDocument/typeDefinition") then
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = buf, desc = "Go to type", silent = true})
    vim.keymap.set("n", "<Space>lt", vim.lsp.buf.type_definition, {buffer = buf, desc = "Go to type", silent = true})
  else
  end
  do
    local prev_diagnostic
    local function _169_()
      local num_errors = #vim.diagnostic.get(buf, {severity = vim.diagnostic.severity.ERROR})
      if (num_errors > 0) then
        return vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR, float = false})
      else
        return vim.diagnostic.goto_prev({float = false})
      end
    end
    prev_diagnostic = _169_
    local next_diagnostic
    local function _171_()
      local num_errors = #vim.diagnostic.get(buf, {severity = vim.diagnostic.severity.ERROR})
      if (num_errors > 0) then
        return vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR, float = false})
      else
        return vim.diagnostic.goto_next({float = false})
      end
    end
    next_diagnostic = _171_
    vim.keymap.set("n", "<Up>", prev_diagnostic, {buffer = buf, silent = true})
    vim.keymap.set("n", "<Down>", next_diagnostic, {buffer = buf, silent = true})
    vim.keymap.set("n", "<S-Tab>", prev_diagnostic, {buffer = buf, silent = true})
    vim.keymap.set("n", "<Tab>", next_diagnostic, {buffer = buf, silent = true})
  end
  vim.keymap.set("n", "<Space>lq", vim.diagnostic.setqflist, {buffer = buf, desc = "Set QuickFix list", silent = true})
  local augroup_name = ("mitchellwrosenLsp" .. buf)
  vim.api.nvim_create_augroup(augroup_name, {})
  local highlight_thing_under_cursor
  do
    local _173_ = client.name
    if (_173_ == "hls") then
      local function _174_(position)
        vim.lsp.buf.clear_references()
        vim.b["document-highlights"] = nil
        return vim.lsp.buf_request(buf, "textDocument/documentHighlight", position, nil)
      end
      highlight_thing_under_cursor = _174_
    elseif true then
      local _ = _173_
      local function _175_()
        return nil
      end
      highlight_thing_under_cursor = _175_
    else
      highlight_thing_under_cursor = nil
    end
  end
  local unhighlight_thing_under_cursor
  do
    local _177_ = client.name
    if (_177_ == "hls") then
      local function _178_()
        vim.lsp.buf.clear_references()
        vim.b["document-highlights"] = nil
        return nil
      end
      unhighlight_thing_under_cursor = _178_
    elseif true then
      local _ = _177_
      local function _179_()
        return nil
      end
      unhighlight_thing_under_cursor = _179_
    else
      unhighlight_thing_under_cursor = nil
    end
  end
  local show_hover_somehow
  do
    local _181_ = client.name
    if (_181_ == "hls") then
      local function _182_(position)
        local function _183_(_err, result, _ctx, _config)
          local contents
          do
            local t_184_ = result
            if (nil ~= t_184_) then
              t_184_ = (t_184_).contents
            else
            end
            contents = t_184_
          end
          if (not (contents == nil) and (type(contents) == "table") and ("markdown" == contents.kind)) then
            local line = extract_haskell_typesig_from_markdown(contents.value)
            vim.api.nvim_buf_clear_namespace(buf, hover_namespace, 0, -1)
            if line then
              return vim.api.nvim_buf_set_extmark(buf, hover_namespace, position.position.line, 0, {virt_text = {{line, "Comment"}}})
            else
              return nil
            end
          else
            return nil
          end
        end
        return vim.lsp.buf_request(buf, "textDocument/hover", position, _183_)
      end
      show_hover_somehow = _182_
    elseif true then
      local _ = _181_
      local function _188_()
        return nil
      end
      show_hover_somehow = _188_
    else
      show_hover_somehow = nil
    end
  end
  local unshow_hover_somehow
  do
    local _190_ = client.name
    if (_190_ == "hls") then
      local function _191_()
        return vim.api.nvim_buf_clear_namespace(buf, hover_namespace, 0, -1)
      end
      unshow_hover_somehow = _191_
    elseif true then
      local _ = _190_
      local function _192_()
        return nil
      end
      unshow_hover_somehow = _192_
    else
      unshow_hover_somehow = nil
    end
  end
  local on_cursor_move
  local function _194_()
    if (vim.api.nvim_get_mode().mode == "n") then
      local function _196_()
        local _local_197_ = vim.api.nvim_win_get_cursor(0)
        local row_1_auto = _local_197_[1]
        local col_2_auto = _local_197_[2]
        return {col = col_2_auto, row = row_1_auto}
      end
      local _local_195_ = _196_()
      local row = _local_195_["row"]
      local col = _local_195_["col"]
      local current_line = vim.api.nvim_get_current_line()
      local current_character = string.sub(current_line, (1 + col), (1 + col))
      if ((current_character ~= "") and (current_character ~= " ")) then
        local position = vim.lsp.util.make_position_params()
        highlight_thing_under_cursor(position)
        return show_hover_somehow(position)
      else
        unhighlight_thing_under_cursor()
        return unshow_hover_somehow()
      end
    else
      return nil
    end
  end
  on_cursor_move = _194_
  vim.api.nvim_create_autocmd("CursorMoved", {buffer = buf, callback = on_cursor_move, group = augroup_name})
  local function _203_(_200_)
    local _arg_201_ = _200_
    local _arg_202_ = _arg_201_["data"]
    local diagnostics = _arg_202_["diagnostics"]
    return vim.fn.setqflist(vim.diagnostic.toqflist(diagnostics), "r")
  end
  vim.api.nvim_create_autocmd("DiagnosticChanged", {buffer = buf, callback = _203_, group = augroup_name})
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  return nil
end
vim.api.nvim_create_autocmd("LspAttach", {group = "mitchellwrosen", callback = _134_})
local function _204_()
  return vim.keymap.set("n", "!", "qz")
end
vim.api.nvim_create_autocmd({"RecordingLeave", "VimEnter"}, {group = "mitchellwrosen", callback = _204_})
local function _205_()
  return vim.keymap.set("n", "!", "q")
end
vim.api.nvim_create_autocmd("RecordingEnter", {group = "mitchellwrosen", callback = _205_})
vim.keymap.set("n", "9", "@z")
do
  local default_progress_handler = vim.lsp.handlers["$/progress"]
  local notifications = {}
  local function my_progress_handler(err, result, context, config)
    local client_id = context.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    if client then
      local token = result.token
      local value = result.value
      local start_ms = nil
      local _206_ = value.kind
      if (_206_ == "begin") then
        start_ms = vim.loop.now()
        if not notifications[client_id] then
          notifications[client_id] = {}
        else
        end
        local notification_id
        local function _208_()
          if value.title then
            return (" " .. value.title)
          else
            return ""
          end
        end
        local function _209_()
          if value.message then
            return (" " .. value.message)
          else
            return ""
          end
        end
        notification_id = vim.notify(("        | " .. client.name .. ":" .. _208_() .. _209_()), vim.log.levels.INFO, {render = "minimal", timeout = false})
        do end (notifications)[client_id][token] = {id = notification_id, ["start-ms"] = start_ms, title = value.title}
      elseif (_206_ == "report") then
        local _local_210_ = notifications[client_id][token]
        local old_notification_id = _local_210_["id"]
        local title = _local_210_["title"]
        local new_notification_id
        local function _211_()
          if title then
            return (" " .. title)
          else
            return ""
          end
        end
        local function _212_()
          if value.message then
            return (" " .. value.message)
          else
            return ""
          end
        end
        new_notification_id = vim.notify(("        | " .. client.name .. ":" .. _211_() .. _212_()), vim.log.levels.INFO, {replace = old_notification_id})
        do end (notifications)[client_id][token]["id"] = new_notification_id
      elseif (_206_ == "end") then
        local stop_ms = vim.loop.now()
        local _local_213_ = notifications[client_id][token]
        local notification_id = _local_213_["id"]
        local start_ms0 = _local_213_["start-ms"]
        local title = _local_213_["title"]
        local function _214_()
          if title then
            return (" " .. title)
          else
            return ""
          end
        end
        local function _215_()
          if value.message then
            return (" " .. value.message)
          else
            return ""
          end
        end
        local _216_
        if ((stop_ms - start_ms0) < 100) then
          _216_ = 0
        else
          _216_ = 3000
        end
        vim.notify((string.format("%6.2fs", ((stop_ms - start_ms0) / 1000)) .. " | " .. client.name .. ":" .. _214_() .. _215_()), vim.log.levels.INFO, {replace = notification_id, timeout = _216_})
        do end (notifications)[client_id][token] = nil
      else
      end
    else
      print("client died")
    end
    return default_progress_handler(err, result, context, config)
  end
  vim.lsp.handlers["$/progress"] = my_progress_handler
end
local function _220_(_, references, context, _0)
  if references then
    local client_id = context.client_id
    local client = vim.lsp.get_client_by_id(client_id)
    if client then
      local lsp_util = require("vim.lsp.util")
      vim.b["document-highlights"] = references
      return lsp_util.buf_highlight_references(context.bufnr, references, client.offset_encoding)
    else
      return nil
    end
  else
    return nil
  end
end
vim.lsp.handlers["textDocument/documentHighlight"] = _220_
local lsp_capabilities
do
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  lsp_capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end
local function _223_()
  local initialize_notification_id = nil
  local start_ms = nil
  local function _224_(_params_2_auto, _config_3_auto)
    start_ms = vim.loop.now()
    initialize_notification_id = vim.notify(("        | " .. "fennel-ls" .. ": Initializing"), vim.log.levels.INFO, {render = "minimal", timeout = false})
    return nil
  end
  local function _225_(_client_2_auto, _result_3_auto)
    local stop_ms_4_auto = vim.loop.now()
    return vim.notify((string.format("%6.2fs", ((stop_ms_4_auto - start_ms) / 1000)) .. " | " .. "fennel-ls" .. ": Initialized"), vim.log.levels.INFO, {replace = initialize_notification_id, timeout = 3000})
  end
  return vim.lsp.start({before_init = _224_, capabilities = lsp_capabilities, cmd = {"fennel-ls"}, name = "fennel-ls", on_init = _225_, root_dir = ".", settings = {}})
end
vim.api.nvim_create_autocmd("FileType", {pattern = "fennel", callback = _223_, group = "mitchellwrosen"})
local function _226_()
  local _227_
  do
    local acc_2_auto = false
    for name_3_auto, typ_4_auto in vim.fs.dir(".") do
      if acc_2_auto then break end
      acc_2_auto = (((typ_4_auto == "file") and ((name_3_auto == "cabal.project") or (name_3_auto == "stack.yaml") or string.match(name_3_auto, "%.cabal$"))) or acc_2_auto)
    end
    _227_ = acc_2_auto
  end
  if _227_ then
    local initialize_notification_id = nil
    local start_ms = nil
    local function _228_(_params_2_auto, _config_3_auto)
      start_ms = vim.loop.now()
      initialize_notification_id = vim.notify(("        | " .. "hls" .. ": Initializing"), vim.log.levels.INFO, {render = "minimal", timeout = false})
      return nil
    end
    local function _229_(_client_2_auto, _result_3_auto)
      local stop_ms_4_auto = vim.loop.now()
      return vim.notify((string.format("%6.2fs", ((stop_ms_4_auto - start_ms) / 1000)) .. " | " .. "hls" .. ": Initialized"), vim.log.levels.INFO, {replace = initialize_notification_id, timeout = 3000})
    end
    return vim.lsp.start({before_init = _228_, capabilities = lsp_capabilities, cmd = {"haskell-language-server-wrapper", "--lsp"}, name = "hls", on_init = _229_, root_dir = ".", settings = {haskell = {formattingProvider = "ormolu", plugin = {hlint = {globalOn = false}, stan = {globalOn = false}}}}})
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("FileType", {pattern = "haskell", callback = _226_, group = "mitchellwrosen"})
local function _231_()
  local initialize_notification_id = nil
  local start_ms = nil
  local function _232_(_params_2_auto, _config_3_auto)
    start_ms = vim.loop.now()
    initialize_notification_id = vim.notify(("        | " .. "zls" .. ": Initializing"), vim.log.levels.INFO, {render = "minimal", timeout = false})
    return nil
  end
  local function _233_(_client_2_auto, _result_3_auto)
    local stop_ms_4_auto = vim.loop.now()
    return vim.notify((string.format("%6.2fs", ((stop_ms_4_auto - start_ms) / 1000)) .. " | " .. "zls" .. ": Initialized"), vim.log.levels.INFO, {replace = initialize_notification_id, timeout = 3000})
  end
  return vim.lsp.start({before_init = _232_, capabilities = lsp_capabilities, cmd = {"zls"}, name = "zls", on_init = _233_, root_dir = ".", settings = {}})
end
vim.api.nvim_create_autocmd("FileType", {pattern = "zig", callback = _231_, group = "mitchellwrosen"})
local function _234_()
  vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {buffer = true})
  vim.keymap.set("n", "<C-c>", "i<C-c>", {buffer = true})
  return vim.cmd.startinsert()
end
vim.api.nvim_create_autocmd("TermOpen", {group = "mitchellwrosen", callback = _234_})
local function _235_()
  if ((vim.fn.argc() == 0) and file_exists("Session.vim")) then
    return vim.cmd({cmd = "source", args = {"Session.vim"}, mods = {silent = true}})
  else
    return nil
  end
end
return vim.api.nvim_create_autocmd("VimEnter", {nested = true, callback = _235_, group = "mitchellwrosen"})
