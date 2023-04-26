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
  vim.o.timeoutlen = 300
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
    local deadcolumn = require("deadcolumn")
    return deadcolumn.setup({blending = {threshold = 100}, scope = "visible", warning = {alpha = 0.1, hlgroup = {"ErrorMsg", "background"}}})
  end
  local function _4_()
    local leap = require("leap")
    return leap.add_default_mappings()
  end
  local function _5_()
    local cmp = require("cmp")
    return cmp.setup({mapping = {["<CR>"] = cmp.mapping.confirm({select = false}), ["<Tab>"] = cmp.mapping.select_next_item()}, sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "buffer"}})})
  end
  local function _6_()
    local bqf = require("bqf")
    return bqf.setup()
  end
  local function _7_()
    vim.g.fzf_layout = {window = {height = 0.95, width = 0.95}}
    return nil
  end
  local function _8_()
    local fzf_vim_buffers = vim.fn["fzf#vim#buffers"]
    local fzf_vim_files = vim.fn["fzf#vim#files"]
    local fzf_vim_gitfiles = vim.fn["fzf#vim#gitfiles"]
    local fzf_vim_with_preview = vim.fn["fzf#vim#with_preview"]
    local opts1 = fzf_vim_with_preview({options = {"--info=inline", "--layout=reverse"}}, "down:60%")
    vim.g.fzf_buffers_jump = 1
    vim.keymap.set("n", "<Space>f", ":Rg <C-r><C-w><CR>")
    local function _9_()
      return fzf_vim_buffers(opts1)
    end
    vim.keymap.set("n", "<Space>k", _9_)
    local function _12_()
      if (0 == os.execute("git rev-parse 2>/dev/null")) then
        local function _10_()
          return fzf_vim_gitfiles("", opts1)
        end
        return _10_
      else
        local function _11_()
          return fzf_vim_files(".", opts1)
        end
        return _11_
      end
    end
    return vim.keymap.set("n", "<Space>o", _12_())
  end
  local function _13_()
    local plugin = require("indent_blankline")
    return plugin.setup({show_current_context = true})
  end
  local function _14_()
    return nil
  end
  local function _15_()
    local treesitter = require("nvim-treesitter.configs")
    return treesitter.setup({highlight = {enable = true}})
  end
  local function _16_()
    local notify = require("notify")
    notify.setup({stages = "static"})
    vim.notify = notify
    return nil
  end
  local function _17_()
    return vim.keymap.set("n", "ga", "<Plug>(characterize)")
  end
  local function _18_()
    return nil
  end
  local function _19_()
    local lsp_lines = require("lsp_lines")
    return lsp_lines.setup()
  end
  local function _20_()
    return nil
  end
  local function _21_()
    local which_key = require("which-key")
    which_key.setup({icons = {separator = ""}, plugins = {marks = true, presets = {nav = false, text_objects = false, g = false, windows = false, operators = false, z = false, motions = false}, registers = true, spelling = {enabled = false}}, window = {border = "single", margin = {0, 0, 0, 0}, padding = {0, 0, 0, 0}}})
    which_key.register({mode = {"n", "v"}, ["<Space>l"] = {name = "+LSP"}})
    local function _22_()
      return which_key.show("`", {auto = true, mode = "n"})
    end
    return vim.keymap.set("n", "'", _22_)
  end
  local function _23_()
    return nil
  end
  lazy.setup({{url = "https://github.com/bakpakin/fennel.vim", commit = "30b9beabad2c4f09b9b284caf5cd5666b6b4dc89", ft = "fennel"}, {url = "https://github.com/Bekaboo/deadcolumn.nvim", commit = "8140fd7cface9592a44b3151203fc6ca95ad9598", event = "InsertEnter", config = _3_}, {url = "https://github.com/ggandor/leap.nvim", commit = "f74473d23ebf60957e0db3ff8172349a82e5a442", event = "VeryLazy", config = _4_}, {url = "https://github.com/hrsh7th/nvim-cmp", commit = "f841fa6ced194aa930136a7671439e6bd4c51722", dependencies = {{url = "https://github.com/hrsh7th/cmp-nvim-lsp", commit = "b4251f0fca1daeb6db5d60a23ca81507acf858c2"}, {url = "https://github.com/hrsh7th/cmp-buffer", commit = "f83773e2f433a923997c5faad7ea689ec24d1785"}}, event = "InsertEnter", config = _5_}, {url = "https://github.com/kevinhwang91/nvim-bqf", tag = "v1.1.0", ft = "qf", config = _6_}, {url = "https://github.com/nvim-lualine/lualine.nvim", commit = "84ffb80e452d95e2c46fa29a98ea11a240f7843e", config = require("config-lualine")}, {url = "https://github.com/junegunn/fzf", commit = "96670d5f16dcf23d590eb1d83d1de351b2e8fb15", event = "VeryLazy", config = _7_}, {url = "https://github.com/junegunn/fzf.vim", commit = "d5f1f8641b24c0fd5b10a299824362a2a1b20ae0", dependencies = {"fzf"}, event = "VeryLazy", config = _8_}, {url = "https://github.com/LnL7/vim-nix", commit = "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee", ft = "nix"}, {url = "https://github.com/lukas-reineke/indent-blankline.nvim", tag = "v2.20.4", config = _13_}, {url = "https://github.com/neovimhaskell/haskell-vim", commit = "f35d02204b4813d1dbe8b0e98cc39701a4b8e15e", ft = "haskell"}, {url = "https://github.com/tpope/vim-fugitive", tag = "v3.7", cmd = "Git", config = _14_}, {url = "https://github.com/nvim-treesitter/nvim-treesitter", tag = "v0.8.5.2", build = ":TSUpdate", config = _15_}, {url = "https://github.com/rcarriga/nvim-notify", tag = "v3.11.0", config = _16_}, {url = "https://github.com/romainl/vim-cool", commit = "27ad4ecf7532b750fadca9f36e1c5498fc225af2", event = "VeryLazy"}, {url = "https://github.com/sainnhe/gruvbox-material", commit = "a6c5f652788b36c6ff2a0fdbefa271cb46f8f5e7", priority = 1000}, {url = "https://github.com/tpope/vim-characterize", commit = "885a00a3c21dd52ca8f2fd7d62850134934179d9", keys = {{"ga"}}, config = _17_}, {url = "https://github.com/tpope/vim-commentary", commit = "627308e30639be3e2d5402808ce18690557e8292", event = "VeryLazy", config = _18_}, {url = "https://github.com/tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a", event = "VeryLazy"}, {url = "https://github.com/tpope/vim-surround", commit = "aeb933272e72617f7c4d35e1f003be16836b948d", event = "VeryLazy"}, {url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim", commit = "dcff567b3a2d730f31b6da229ca3bb40640ec5a6", config = _19_}, {url = "https://github.com/dstein64/vim-startuptime", tag = "v4.4.0", cmd = "StartupTime", config = _20_}, {url = "https://github.com/folke/which-key.nvim", tag = "v1.4.0", event = "VeryLazy", config = _21_}, {url = "https://github.com/ziglang/zig.vim", commit = "a0d9adedafeb1a33a0159d16ddcdf194b7cea881", ft = "zig", config = _23_}})
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
require("plugins")
package.preload["mappings"] = package.preload["mappings"] or function(...)
  vim.keymap.set({"c", "i", "n", "o", "v"}, ";", ":")
  vim.keymap.set({"c", "i", "n", "o", "v"}, ":", ";")
  vim.keymap.set("n", "r;", "r:")
  vim.keymap.set("n", "r:", "r;")
  vim.keymap.set("n", "/", "/\\v")
  vim.keymap.set("v", "/", "/\\v")
  local function _24_()
    vim.cmd("keepjumps normal! mz*`z")
    local lualine = require("lualine")
    return lualine.refresh()
  end
  vim.keymap.set("n", "*", _24_)
  vim.keymap.set("n", "<BS>", "<C-^>")
  vim.keymap.set("n", "j", "gj")
  vim.keymap.set("n", "k", "gk")
  vim.keymap.set({"n", "v"}, "J", "6j", {remap = true})
  vim.keymap.set({"n", "v"}, "K", "6k", {remap = true})
  vim.keymap.set({"n", "o", "v"}, "H", "^")
  vim.keymap.set({"n", "o"}, "L", "$")
  vim.keymap.set("v", "L", "g_")
  vim.keymap.set("v", "p", "\"0p")
  local function _25_()
    local prev_region
    do
      local _local_26_ = vim.api.nvim_buf_get_mark(0, "[")
      local start_row_7_auto = _local_26_[1]
      local start_col_8_auto = _local_26_[2]
      local _local_27_ = vim.api.nvim_buf_get_mark(0, "]")
      local end_row_9_auto = _local_27_[1]
      local end_col_10_auto = _local_27_[2]
      prev_region = {["end"] = {col = end_col_10_auto, row = end_row_9_auto}, start = {col = start_col_8_auto, row = start_row_7_auto}}
    end
    if not ((prev_region.start.row == 0) and (prev_region.start.col == 0)) then
      local cur_region
      do
        local _local_28_ = vim.fn.getpos("v")
        local _bufnum_11_auto = _local_28_[1]
        local begin_row_12_auto = _local_28_[2]
        local begin_col_13_auto = _local_28_[3]
        local _off_14_auto = _local_28_[4]
        local begin_pos_15_auto = {col = (begin_col_13_auto - 1), row = begin_row_12_auto}
        local end_pos_16_auto
        do
          local _local_29_ = vim.api.nvim_win_get_cursor(0)
          local row_1_auto = _local_29_[1]
          local col_2_auto = _local_29_[2]
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
        local _local_31_ = prev_region
        local _local_32_ = _local_31_["end"]
        local end_col_6_auto = _local_32_["col"]
        local end_row_5_auto = _local_32_["row"]
        local _local_33_ = _local_31_["start"]
        local start_col_4_auto = _local_33_["col"]
        local start_row_3_auto = _local_33_["row"]
        prev_contents = vim.api.nvim_buf_get_text(0, (start_row_3_auto - 1), start_col_4_auto, (end_row_5_auto - 1), (end_col_6_auto + 1), {})
      end
      local cur_contents
      do
        local _local_34_ = cur_region
        local _local_35_ = _local_34_["end"]
        local end_col_6_auto = _local_35_["col"]
        local end_row_5_auto = _local_35_["row"]
        local _local_36_ = _local_34_["start"]
        local start_col_4_auto = _local_36_["col"]
        local start_row_3_auto = _local_36_["row"]
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
            local _local_37_ = prev_region
            local _local_38_ = _local_37_["end"]
            local end_col_20_auto = _local_38_["col"]
            local end_row_19_auto = _local_38_["row"]
            local _local_39_ = _local_37_["start"]
            local start_col_18_auto = _local_39_["col"]
            local start_row_17_auto = _local_39_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), cur_contents)
          end
          do
            local _local_40_ = cur_region
            local _local_41_ = _local_40_["end"]
            local end_col_20_auto = _local_41_["col"]
            local end_row_19_auto = _local_41_["row"]
            local _local_42_ = _local_40_["start"]
            local start_col_18_auto = _local_42_["col"]
            local start_row_17_auto = _local_42_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), prev_contents)
          end
          local _local_43_ = cur_region.start
          local col_22_auto = _local_43_["col"]
          local row_21_auto = _local_43_["row"]
          return vim.api.nvim_win_set_cursor(0, {row_21_auto, col_22_auto})
        elseif ((prev_region.start.col < cur_region.start.col) and (prev_region["end"].col < cur_region.start.col)) then
          vim.api.nvim_feedkeys("\27", "xn", false)
          do
            local _local_44_ = prev_region
            local _local_45_ = _local_44_["end"]
            local end_col_20_auto = _local_45_["col"]
            local end_row_19_auto = _local_45_["row"]
            local _local_46_ = _local_44_["start"]
            local start_col_18_auto = _local_46_["col"]
            local start_row_17_auto = _local_46_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), cur_contents)
          end
          local adjusted_cur_region = adjust_region(prev_region, cur_region)
          do
            local _local_47_ = adjusted_cur_region
            local _local_48_ = _local_47_["end"]
            local end_col_20_auto = _local_48_["col"]
            local end_row_19_auto = _local_48_["row"]
            local _local_49_ = _local_47_["start"]
            local start_col_18_auto = _local_49_["col"]
            local start_row_17_auto = _local_49_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), prev_contents)
          end
          local _local_50_ = adjusted_cur_region.start
          local col_22_auto = _local_50_["col"]
          local row_21_auto = _local_50_["row"]
          return vim.api.nvim_win_set_cursor(0, {row_21_auto, col_22_auto})
        elseif ((cur_region.start.col < prev_region.start.col) and (cur_region["end"].col < prev_region.start.col)) then
          vim.api.nvim_feedkeys("\27", "xn", false)
          do
            local _local_51_ = cur_region
            local _local_52_ = _local_51_["end"]
            local end_col_20_auto = _local_52_["col"]
            local end_row_19_auto = _local_52_["row"]
            local _local_53_ = _local_51_["start"]
            local start_col_18_auto = _local_53_["col"]
            local start_row_17_auto = _local_53_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), prev_contents)
          end
          local adjusted_prev_region = adjust_region(cur_region, prev_region)
          do
            local _local_54_ = adjusted_prev_region
            local _local_55_ = _local_54_["end"]
            local end_col_20_auto = _local_55_["col"]
            local end_row_19_auto = _local_55_["row"]
            local _local_56_ = _local_54_["start"]
            local start_col_18_auto = _local_56_["col"]
            local start_row_17_auto = _local_56_["row"]
            vim.api.nvim_buf_set_text(0, (start_row_17_auto - 1), start_col_18_auto, (end_row_19_auto - 1), (end_col_20_auto + 1), cur_contents)
          end
          local _local_57_ = cur_region.start
          local col_22_auto = _local_57_["col"]
          local row_21_auto = _local_57_["row"]
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
  vim.keymap.set("x", "x", _25_)
  vim.keymap.set("v", "Y", "y`>")
  vim.keymap.set("n", "U", "<C-r>")
  vim.keymap.set({"n", "v"}, "n", "nzz")
  vim.keymap.set({"n", "v"}, "N", "Nzz")
  local function _61_()
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
  vim.keymap.set("n", "q", _61_)
  local function _64_()
    if (vim.fn.argc() > 0) then
      vim.cmd("%argdel")
    else
    end
    vim.cmd({cmd = "mksession", bang = true})
    return vim.cmd.qa()
  end
  vim.keymap.set("n", "Q", _64_)
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
            local function _70_()
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
            for i_3_auto, x_4_auto in ipairs(_70_()) do
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
    local function _84_()
      return go_to_buffer(1)
    end
    vim.keymap.set("n", "1", _84_)
    local function _85_()
      return go_to_buffer(2)
    end
    vim.keymap.set("n", "2", _85_)
    local function _86_()
      return go_to_buffer(3)
    end
    vim.keymap.set("n", "3", _86_)
    local function _87_()
      return go_to_buffer(4)
    end
    vim.keymap.set("n", "4", _87_)
    local function _88_()
      return go_to_buffer(5)
    end
    vim.keymap.set("n", "5", _88_)
    local function _89_()
      return move_buffer_to_index(1)
    end
    vim.keymap.set("n", "<Space>1", _89_)
    local function _90_()
      return move_buffer_to_index(2)
    end
    vim.keymap.set("n", "<Space>2", _90_)
    local function _91_()
      return move_buffer_to_index(3)
    end
    vim.keymap.set("n", "<Space>3", _91_)
    local function _92_()
      return move_buffer_to_index(4)
    end
    vim.keymap.set("n", "<Space>4", _92_)
    local function _93_()
      return move_buffer_to_index(5)
    end
    vim.keymap.set("n", "<Space>5", _93_)
  end
  vim.keymap.set("n", "<Space>s", "m`vip<Esc>:silent '<,'>w !repld-send --no-echo<CR>``", {silent = true})
  vim.keymap.set("n", "<Space>S", "m`:silent w !repld-send<CR>``", {silent = true})
  vim.keymap.set("v", "<Space>s", "m`<Esc>:silent '<,'>w !repld-send<CR>``", {silent = true})
  vim.keymap.set("i", "<C-v>", "<C-r>*")
  vim.keymap.set("c", "<C-h>", "<Left>")
  vim.keymap.set("c", "<C-j>", "<Down>")
  vim.keymap.set("c", "<C-k>", "<Up>")
  vim.keymap.set("c", "<C-l>", "<Right>")
  vim.keymap.set("n", "~", "mzlblgueh~`z", {silent = true})
  do
    local number_regex = "0x\\x\\+\\|\\d\\+\\(\\.\\d\\+\\)\\?"
    local function _94_()
      local matched_line = vim.fn.search(number_regex, "ceW")
      if (matched_line ~= 0) then
        vim.cmd("normal! v")
        return vim.fn.search(number_regex, "bcW")
      else
        return nil
      end
    end
    vim.keymap.set("o", "n", _94_)
  end
  local function _96_()
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
  return vim.keymap.set("i", "<C-u>", _96_)
end
require("mappings")
vim.diagnostic.config({float = {scope = "cursor", header = ""}, underline = {severity = vim.diagnostic.severity.ERROR}, virtual_lines = {only_current_line = true}, virtual_text = false})
vim.api.nvim_create_augroup("mitchellwrosen", {})
local function _97_(opts)
  local function _98_()
    local last_known_pos = vim.api.nvim_buf_get_mark(opts.buf, "\"")
    local last_known_line = last_known_pos[1]
    if ((last_known_line > 1) and (last_known_line <= vim.api.nvim_buf_line_count(opts.buf))) then
      return vim.api.nvim_feedkeys("g`\"", "nx", false)
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("BufWinEnter", {buffer = opts.buf, once = true, group = "mitchellwrosen", callback = _98_})
end
vim.api.nvim_create_autocmd("BufRead", {group = "mitchellwrosen", callback = _97_})
local function _100_()
  vim.bo.modifiable = not vim.bo.readonly
  return nil
end
vim.api.nvim_create_autocmd("BufReadPost", {group = "mitchellwrosen", callback = _100_})
local function _101_()
  return vim.highlight.on_yank({higroup = "IncSearch", timeout = 300})
end
vim.api.nvim_create_autocmd("TextYankPost", {group = "mitchellwrosen", callback = _101_})
local function _102_()
  if (vim.fn.getcmdwintype() == "") then
    return vim.cmd.checktime()
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"CursorHold", "FocusGained"}, {group = "mitchellwrosen", callback = _102_})
local function _104_()
  if ((vim.o.buftype == "") and (vim.api.nvim_buf_get_name(0) ~= "")) then
    local view = vim.fn.winsaveview()
    vim.cmd("keeppatterns silent! %s/\\s\\+$//e")
    vim.cmd("silent! update")
    return vim.fn.winrestview(view)
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {group = "mitchellwrosen", callback = _104_})
local extract_haskell_typesig_from_markdown
local function _106_(str0)
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
extract_haskell_typesig_from_markdown = _106_
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})
local hover_namespace = vim.api.nvim_create_namespace("hover")
local function _111_(args)
  local buf = args.buf
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  local augroup_name = ("mitchellwrosenLsp" .. buf)
  vim.api.nvim_create_augroup(augroup_name, {})
  vim.cmd("highlight LspReference guifg=NONE guibg=#665c54 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59")
  vim.cmd("highlight! link LspReferenceText LspReference")
  vim.cmd("highlight! link LspReferenceRead LspReference")
  vim.cmd("highlight! link LspReferenceWrite LspReference")
  vim.keymap.set("n", "<Space>la", vim.lsp.buf.code_action, {buffer = buf, desc = "Apply code action", silent = true})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = buf, desc = "Go to definition", silent = true})
  vim.keymap.set("n", "<Space>d", vim.lsp.buf.format, {buffer = buf, desc = "Format code", silent = true})
  vim.keymap.set("n", "<Space>lf", vim.lsp.buf.format, {buffer = buf, desc = "Format code (<Space>d)", silent = true})
  vim.keymap.set("n", "<Enter>", vim.lsp.buf.hover, {buffer = buf, silent = true})
  vim.keymap.set("n", "<Space>li", vim.lsp.buf.incoming_calls, {buffer = buf, desc = "Incoming calls", silent = true})
  vim.keymap.set("n", "<Space>lo", vim.lsp.buf.outgoing_calls, {buffer = buf, desc = "Outgoing calls", silent = true})
  vim.keymap.set("n", "<Space>lr", vim.lsp.buf.references, {buffer = buf, desc = "References", silent = true})
  vim.keymap.set("n", "<Space>ln", vim.lsp.buf.rename, {buffer = buf, desc = "Rename", silent = true})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = buf, desc = "Go to type", silent = true})
  local function _112_()
    return vim.diagnostic.goto_prev({float = false})
  end
  vim.keymap.set("n", "<Up>", _112_, {buffer = buf, silent = true})
  local function _113_()
    return vim.diagnostic.goto_next({float = false})
  end
  vim.keymap.set("n", "<Down>", _113_, {buffer = buf, silent = true})
  local function _114_()
    if (vim.api.nvim_get_mode().mode == "n") then
      if (vim.api.nvim_get_current_line() ~= "") then
        if client.server_capabilities.documentHighlightProvider then
          vim.lsp.buf.clear_references()
          vim.lsp.buf.document_highlight()
        else
        end
        local position = vim.lsp.util.make_position_params()
        local function _116_(_err, result, _ctx, _config)
          local contents
          do
            local t_117_ = result
            if (nil ~= t_117_) then
              t_117_ = (t_117_).contents
            else
            end
            contents = t_117_
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
        return vim.lsp.buf_request(buf, "textDocument/hover", position, _116_)
      else
        return nil
      end
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd("CursorMoved", {buffer = buf, callback = _114_, group = augroup_name})
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  return nil
end
vim.api.nvim_create_autocmd("LspAttach", {group = "mitchellwrosen", callback = _111_})
local function _123_()
  return vim.keymap.set("n", "!", "qz")
end
vim.api.nvim_create_autocmd({"RecordingLeave", "VimEnter"}, {group = "mitchellwrosen", callback = _123_})
local function _124_()
  return vim.keymap.set("n", "!", "q")
end
vim.api.nvim_create_autocmd("RecordingEnter", {group = "mitchellwrosen", callback = _124_})
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
      local _125_ = value.kind
      if (_125_ == "begin") then
        start_ms = vim.loop.now()
        if not notifications[client_id] then
          notifications[client_id] = {}
        else
        end
        local notification_id
        local function _127_()
          if value.title then
            return (" " .. value.title)
          else
            return ""
          end
        end
        local function _128_()
          if value.message then
            return (" " .. value.message)
          else
            return ""
          end
        end
        notification_id = vim.notify(("        | " .. client.name .. ":" .. _127_() .. _128_()), vim.log.levels.INFO, {render = "minimal", timeout = false})
        do end (notifications)[client_id][token] = {id = notification_id, ["start-ms"] = start_ms, title = value.title}
      elseif (_125_ == "report") then
        local _local_129_ = notifications[client_id][token]
        local old_notification_id = _local_129_["id"]
        local title = _local_129_["title"]
        local new_notification_id
        local function _130_()
          if title then
            return (" " .. title)
          else
            return ""
          end
        end
        local function _131_()
          if value.message then
            return (" " .. value.message)
          else
            return ""
          end
        end
        new_notification_id = vim.notify(("        | " .. client.name .. ":" .. _130_() .. _131_()), vim.log.levels.INFO, {replace = old_notification_id})
        do end (notifications)[client_id][token]["id"] = new_notification_id
      elseif (_125_ == "end") then
        local stop_ms = vim.loop.now()
        local _local_132_ = notifications[client_id][token]
        local notification_id = _local_132_["id"]
        local start_ms0 = _local_132_["start-ms"]
        local title = _local_132_["title"]
        local function _133_()
          if title then
            return (" " .. title)
          else
            return ""
          end
        end
        local function _134_()
          if value.message then
            return (" " .. value.message)
          else
            return ""
          end
        end
        local _135_
        if ((stop_ms - start_ms0) < 100) then
          _135_ = 0
        else
          _135_ = 3000
        end
        vim.notify((string.format("%6.2fs", ((stop_ms - start_ms0) / 1000)) .. " | " .. client.name .. ":" .. _133_() .. _134_()), vim.log.levels.INFO, {replace = notification_id, timeout = _135_})
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
local lsp_capabilities
do
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  lsp_capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
end
local function _139_()
  local initialize_notification_id = nil
  local start_ms = nil
  local function _140_(_params_2_auto, _config_3_auto)
    start_ms = vim.loop.now()
    initialize_notification_id = vim.notify(("        | " .. "fennel-ls" .. ": Initializing"), vim.log.levels.INFO, {render = "minimal", timeout = false})
    return nil
  end
  local function _141_(_client_2_auto, _result_3_auto)
    local stop_ms_4_auto = vim.loop.now()
    return vim.notify((string.format("%6.2fs", ((stop_ms_4_auto - start_ms) / 1000)) .. " | " .. "fennel-ls" .. ": Initialized"), vim.log.levels.INFO, {replace = initialize_notification_id, timeout = 3000})
  end
  return vim.lsp.start({before_init = _140_, capabilities = lsp_capabilities, cmd = {"fennel-ls"}, name = "fennel-ls", on_init = _141_, root_dir = ".", settings = {}})
end
vim.api.nvim_create_autocmd("FileType", {pattern = "fennel", callback = _139_, group = "mitchellwrosen"})
local function _142_()
  local _143_
  do
    local acc_2_auto = false
    for name_3_auto, typ_4_auto in vim.fs.dir(".") do
      if acc_2_auto then break end
      acc_2_auto = (((typ_4_auto == "file") and ((name_3_auto == "cabal.project") or (name_3_auto == "stack.yaml") or string.match(name_3_auto, "%.cabal$"))) or acc_2_auto)
    end
    _143_ = acc_2_auto
  end
  if _143_ then
    local initialize_notification_id = nil
    local start_ms = nil
    local function _144_(_params_2_auto, _config_3_auto)
      start_ms = vim.loop.now()
      initialize_notification_id = vim.notify(("        | " .. "hls" .. ": Initializing"), vim.log.levels.INFO, {render = "minimal", timeout = false})
      return nil
    end
    local function _145_(_client_2_auto, _result_3_auto)
      local stop_ms_4_auto = vim.loop.now()
      return vim.notify((string.format("%6.2fs", ((stop_ms_4_auto - start_ms) / 1000)) .. " | " .. "hls" .. ": Initialized"), vim.log.levels.INFO, {replace = initialize_notification_id, timeout = 3000})
    end
    return vim.lsp.start({before_init = _144_, capabilities = lsp_capabilities, cmd = {"haskell-language-server-wrapper", "--lsp"}, name = "hls", on_init = _145_, root_dir = ".", settings = {haskell = {formattingProvider = "ormolu", plugin = {hlint = {globalOn = false}, stan = {globalOn = false}}}}})
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("FileType", {pattern = "haskell", callback = _142_, group = "mitchellwrosen"})
local function _147_()
  local initialize_notification_id = nil
  local start_ms = nil
  local function _148_(_params_2_auto, _config_3_auto)
    start_ms = vim.loop.now()
    initialize_notification_id = vim.notify(("        | " .. "zls" .. ": Initializing"), vim.log.levels.INFO, {render = "minimal", timeout = false})
    return nil
  end
  local function _149_(_client_2_auto, _result_3_auto)
    local stop_ms_4_auto = vim.loop.now()
    return vim.notify((string.format("%6.2fs", ((stop_ms_4_auto - start_ms) / 1000)) .. " | " .. "zls" .. ": Initialized"), vim.log.levels.INFO, {replace = initialize_notification_id, timeout = 3000})
  end
  return vim.lsp.start({before_init = _148_, capabilities = lsp_capabilities, cmd = {"zls"}, name = "zls", on_init = _149_, root_dir = ".", settings = {}})
end
vim.api.nvim_create_autocmd("FileType", {pattern = "zig", callback = _147_, group = "mitchellwrosen"})
local function _150_()
  vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {buffer = true})
  vim.keymap.set("n", "<C-c>", "i<C-c>", {buffer = true})
  return vim.cmd.startinsert()
end
vim.api.nvim_create_autocmd("TermOpen", {group = "mitchellwrosen", callback = _150_})
local function _151_()
  if ((vim.fn.argc() == 0) and file_exists("Session.vim")) then
    return vim.cmd({cmd = "source", args = {"Session.vim"}, mods = {silent = true}})
  else
    return nil
  end
end
return vim.api.nvim_create_autocmd("VimEnter", {nested = true, callback = _151_, group = "mitchellwrosen"})
