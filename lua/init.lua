local _local_1_ = require("stdlib")
local file_exists = _local_1_["file-exists"]
do
  local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim", "--branch=v9.14.2", lazypath})
  else
  end
  do end (vim.opt.rtp):prepend(lazypath)
end
vim.o.autowriteall = true
vim.o.grepprg = "rg --vimgrep"
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.joinspaces = false
vim.o.lazyredraw = true
vim.o.mouse = ""
vim.o.report = 0
vim.o.scrolloff = 15
vim.o.shiftround = true
vim.o.shortmess = "filnxtToOFIc"
vim.o.showcmd = false
vim.o.showmode = false
vim.o.showtabline = 2
vim.o.sidescrolloff = 16
vim.o.smartcase = true
vim.o.startofline = false
vim.o.termguicolors = true
vim.o.timeoutlen = 400
vim.o.title = true
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
do
  vim.bo["expandtab"] = true
  vim.o["expandtab"] = true
end
do
  vim.bo["modeline"] = false
  vim.o["modeline"] = false
end
do
  vim.bo["smartindent"] = true
  vim.o["smartindent"] = true
end
do
  vim.bo["undofile"] = true
  vim.o["undofile"] = true
end
do
  vim.bo["shiftwidth"] = 2
  vim.o["shiftwidth"] = 2
end
do
  vim.bo["synmaxcol"] = 200
  vim.o["synmaxcol"] = 200
end
do
  vim.bo["softtabstop"] = 2
  vim.o["softtabstop"] = 2
end
do
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
    return nil
  end
  local function _18_()
    return vim.keymap.set("n", "ga", "<Plug>(characterize)")
  end
  local function _19_()
    return nil
  end
  local function _20_()
    local lsp_lines = require("lsp_lines")
    return lsp_lines.setup()
  end
  local function _21_()
    return nil
  end
  lazy.setup({{url = "https://github.com/bakpakin/fennel.vim", commit = "30b9beabad2c4f09b9b284caf5cd5666b6b4dc89", ft = "fennel"}, {url = "https://github.com/Bekaboo/deadcolumn.nvim", commit = "8140fd7cface9592a44b3151203fc6ca95ad9598", event = "InsertEnter", config = _3_}, {url = "https://github.com/ggandor/leap.nvim", commit = "f74473d23ebf60957e0db3ff8172349a82e5a442", event = "VeryLazy", config = _4_}, {url = "https://github.com/hrsh7th/nvim-cmp", commit = "f841fa6ced194aa930136a7671439e6bd4c51722", dependencies = {{url = "https://github.com/hrsh7th/cmp-nvim-lsp", commit = "b4251f0fca1daeb6db5d60a23ca81507acf858c2"}, {url = "https://github.com/hrsh7th/cmp-buffer", commit = "f83773e2f433a923997c5faad7ea689ec24d1785"}}, event = "InsertEnter", config = _5_}, {url = "https://github.com/kevinhwang91/nvim-bqf", tag = "v1.1.0", ft = "qf", config = _6_}, {url = "https://github.com/nvim-lualine/lualine.nvim", commit = "84ffb80e452d95e2c46fa29a98ea11a240f7843e", config = require("config-lualine")}, {url = "https://github.com/junegunn/fzf", commit = "96670d5f16dcf23d590eb1d83d1de351b2e8fb15", event = "VeryLazy", config = _7_}, {url = "https://github.com/junegunn/fzf.vim", commit = "d5f1f8641b24c0fd5b10a299824362a2a1b20ae0", dependencies = {"fzf"}, event = "VeryLazy", config = _8_}, {url = "https://github.com/LnL7/vim-nix", commit = "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee", ft = "nix"}, {url = "https://github.com/lukas-reineke/indent-blankline.nvim", tag = "v2.20.4", config = _13_}, {url = "https://github.com/neovim/nvim-lsp", commit = "2c70b7b0095b4bbe55aaf0dc27a2581d1cafe491"}, {url = "https://github.com/neovimhaskell/haskell-vim", commit = "f35d02204b4813d1dbe8b0e98cc39701a4b8e15e", ft = "haskell"}, {url = "https://github.com/tpope/vim-fugitive", tag = "v3.7", cmd = "Git", config = _14_}, {url = "https://github.com/nvim-lua/lsp-status.nvim", commit = "4073f766f1303fb602802075e558fe43e382cc92"}, {url = "https://github.com/nvim-treesitter/nvim-treesitter", tag = "v0.8.5.2", build = ":TSUpdate", config = _15_}, {url = "https://github.com/rcarriga/nvim-notify", tag = "v3.11.0", config = _16_}, {url = "https://github.com/romainl/vim-cool", commit = "27ad4ecf7532b750fadca9f36e1c5498fc225af2", event = "VeryLazy"}, {url = "https://github.com/sainnhe/gruvbox-material", commit = "a6c5f652788b36c6ff2a0fdbefa271cb46f8f5e7", priority = 1000}, {url = "https://github.com/tommcdo/vim-exchange", commit = "784d63083ad7d613aa96f00021cd0dfb126a781a", config = _17_}, {url = "https://github.com/tpope/vim-characterize", commit = "885a00a3c21dd52ca8f2fd7d62850134934179d9", keys = {{"ga"}}, config = _18_}, {url = "https://github.com/tpope/vim-commentary", commit = "627308e30639be3e2d5402808ce18690557e8292", event = "VeryLazy", config = _19_}, {url = "https://github.com/tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a", event = "VeryLazy"}, {url = "https://github.com/tpope/vim-surround", commit = "aeb933272e72617f7c4d35e1f003be16836b948d", event = "VeryLazy"}, {url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim", commit = "dcff567b3a2d730f31b6da229ca3bb40640ec5a6", config = _20_}, {url = "https://github.com/dstein64/vim-startuptime", tag = "v4.4.0", cmd = "StartupTime", config = _21_}})
end
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
vim.g.exchange_no_mappings = 1
vim.keymap.set({"n", "v"}, "x", "<Plug>(Exchange)")
vim.keymap.set("n", "xw", "<Plug>(Exchange)e")
vim.keymap.set("n", "xW", "<Plug>(Exchange)E")
vim.keymap.set("n", "xx", "m`<Plug>(ExchangeLine)``")
vim.keymap.set("n", "X", "<Plug>(Exchange)$")
vim.keymap.set("n", "xc", "<Plug>(ExchangeClear)")
vim.keymap.set("n", "-", "m`<Plug>CommentaryLine``")
vim.keymap.set("v", "-", "<Plug>Commentary")
vim.g.surround_no_mappings = 1
package.preload["mappings"] = package.preload["mappings"] or function(...)
  vim.keymap.set({"c", "i", "n", "o", "v"}, ";", ":")
  vim.keymap.set({"c", "i", "n", "o", "v"}, ":", ";")
  vim.keymap.set("n", "r;", "r:")
  vim.keymap.set("n", "r:", "r;")
  vim.keymap.set("n", "'", "`")
  vim.keymap.set("n", "/", "/\\v")
  vim.keymap.set("v", "/", "/\\v")
  local function _22_()
    vim.cmd("keepjumps normal! mz*`z")
    local lualine = require("lualine")
    return lualine.refresh()
  end
  vim.keymap.set("n", "*", _22_)
  vim.keymap.set("n", "<BS>", "<C-^>")
  vim.keymap.set("n", "j", "gj")
  vim.keymap.set("n", "k", "gk")
  vim.keymap.set({"n", "v"}, "J", "6j", {remap = true})
  vim.keymap.set({"n", "v"}, "K", "6k", {remap = true})
  vim.keymap.set({"n", "o", "v"}, "H", "^")
  vim.keymap.set({"n", "o"}, "L", "$")
  vim.keymap.set("v", "L", "g_")
  vim.keymap.set("v", "p", "\"0p")
  vim.keymap.set("v", "Y", "y`>")
  vim.keymap.set("n", "gV", "'`[' . strpart(getregtype(), 0, 1) . '`]'", {expr = true})
  vim.keymap.set("n", "U", "<C-r>")
  vim.keymap.set({"n", "v"}, "n", "nzz")
  vim.keymap.set({"n", "v"}, "N", "Nzz")
  local function _23_()
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
  vim.keymap.set("n", "q", _23_)
  local function _26_()
    if (vim.fn.argc() > 0) then
      vim.cmd("%argdel")
    else
    end
    vim.cmd({cmd = "mksession", bang = true})
    return vim.cmd.qa()
  end
  vim.keymap.set("n", "Q", _26_)
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
            local function _32_()
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
            for i_3_auto, x_4_auto in ipairs(_32_()) do
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
    local function _46_()
      return go_to_buffer(1)
    end
    vim.keymap.set("n", "1", _46_)
    local function _47_()
      return go_to_buffer(2)
    end
    vim.keymap.set("n", "2", _47_)
    local function _48_()
      return go_to_buffer(3)
    end
    vim.keymap.set("n", "3", _48_)
    local function _49_()
      return go_to_buffer(4)
    end
    vim.keymap.set("n", "4", _49_)
    local function _50_()
      return go_to_buffer(5)
    end
    vim.keymap.set("n", "5", _50_)
    local function _51_()
      return move_buffer_to_index(1)
    end
    vim.keymap.set("n", "<Space>1", _51_)
    local function _52_()
      return move_buffer_to_index(2)
    end
    vim.keymap.set("n", "<Space>2", _52_)
    local function _53_()
      return move_buffer_to_index(3)
    end
    vim.keymap.set("n", "<Space>3", _53_)
    local function _54_()
      return move_buffer_to_index(4)
    end
    vim.keymap.set("n", "<Space>4", _54_)
    local function _55_()
      return move_buffer_to_index(5)
    end
    vim.keymap.set("n", "<Space>5", _55_)
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
    local function _56_()
      local matched_line = vim.fn.search(number_regex, "ceW")
      if (matched_line ~= 0) then
        vim.cmd("normal! v")
        return vim.fn.search(number_regex, "bcW")
      else
        return nil
      end
    end
    vim.keymap.set("o", "n", _56_)
  end
  local function _58_()
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
  return vim.keymap.set("i", "<C-u>", _58_)
end
require("mappings")
vim.api.nvim_create_augroup("mitchellwrosen", {})
local function _59_(opts)
  local function _60_()
    local last_known_line = (vim.api.nvim_buf_get_mark(opts.buf, "\""))[1]
    if ((last_known_line > 1) and (last_known_line <= vim.api.nvim_buf_line_count(opts.buf))) then
      return vim.api.nvim_feedkeys("g`\"", "x", false)
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("BufWinEnter", {once = true, buffer = opts.buf, callback = _60_, group = "mitchellwrosen"})
end
vim.api.nvim_create_autocmd("BufRead", {callback = _59_, group = "mitchellwrosen"})
local function _62_()
  vim.bo.modifiable = not vim.bo.readonly
  return nil
end
vim.api.nvim_create_autocmd("BufReadPost", {callback = _62_, group = "mitchellwrosen"})
local function _63_()
  return vim.highlight.on_yank({higroup = "IncSearch", timeout = 300})
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _63_, group = "mitchellwrosen"})
local function _64_()
  if (vim.fn.getcmdwintype() == "") then
    return vim.cmd.checktime()
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"CursorHold", "FocusGained"}, {callback = _64_, group = "mitchellwrosen"})
local function _66_()
  if ((vim.o.buftype == "") and (vim.api.nvim_buf_get_name(0) ~= "")) then
    local view = vim.fn.winsaveview()
    vim.cmd("keeppatterns silent! %s/\\s\\+$//e")
    vim.cmd("silent! update")
    return vim.fn.winrestview(view)
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {callback = _66_, group = "mitchellwrosen"})
local extract_haskell_typesig_from_markdown
local function _68_(str0)
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
extract_haskell_typesig_from_markdown = _68_
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})
local hover_namespace = vim.api.nvim_create_namespace("hover")
local function _73_(args)
  local buf = args.buf
  local client = vim.lsp.get_client_by_id(args.data.client_id)
  local augroup_name = ("mitchellwrosenLsp" .. buf)
  vim.api.nvim_create_augroup(augroup_name, {})
  vim.cmd("highlight LspReference guifg=NONE guibg=#665c54 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59")
  vim.cmd("highlight! link LspReferenceText LspReference")
  vim.cmd("highlight! link LspReferenceRead LspReference")
  vim.cmd("highlight! link LspReferenceWrite LspReference")
  vim.keymap.set("n", "<Space>a", vim.lsp.buf.code_action, {buffer = buf, silent = true})
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = buf, silent = true})
  vim.keymap.set("n", "<Space>d", vim.lsp.buf.format, {buffer = buf, silent = true})
  vim.keymap.set("n", "<Enter>", vim.lsp.buf.hover, {buffer = buf, silent = true})
  vim.keymap.set("n", "<Space>i", vim.lsp.buf.incoming_calls, {buffer = buf, silent = true})
  vim.keymap.set("n", "<Space>u", vim.lsp.buf.outgoing_calls, {buffer = buf, silent = true})
  vim.keymap.set("n", "<Space>r", vim.lsp.buf.references, {buffer = buf, silent = true})
  vim.keymap.set("n", "<Space>e", vim.lsp.buf.rename, {buffer = buf, silent = true})
  vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, {buffer = buf, silent = true})
  local function _74_()
    return vim.diagnostic.goto_prev({float = false})
  end
  vim.keymap.set("n", "<Up>", _74_, {buffer = buf, silent = true})
  local function _75_()
    return vim.diagnostic.goto_next({float = false})
  end
  vim.keymap.set("n", "<Down>", _75_, {buffer = buf, silent = true})
  local function _76_()
    if (vim.api.nvim_get_mode().mode == "n") then
      if (vim.api.nvim_get_current_line() ~= "") then
        if client.server_capabilities.documentHighlightProvider then
          vim.lsp.buf.clear_references()
          vim.lsp.buf.document_highlight()
        else
        end
        local position = vim.lsp.util.make_position_params()
        local function _78_(_err, result, _ctx, _config)
          local contents
          do
            local t_79_ = result
            if (nil ~= t_79_) then
              t_79_ = (t_79_).contents
            else
            end
            contents = t_79_
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
        return vim.lsp.buf_request(buf, "textDocument/hover", position, _78_)
      else
        return nil
      end
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd("CursorMoved", {buffer = buf, callback = _76_, group = augroup_name})
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  return nil
end
vim.api.nvim_create_autocmd("LspAttach", {callback = _73_, group = "mitchellwrosen"})
local function _85_()
  return vim.keymap.set("n", "!", "qz")
end
vim.api.nvim_create_autocmd({"RecordingLeave", "VimEnter"}, {callback = _85_, group = "mitchellwrosen"})
local function _86_()
  return vim.keymap.set("n", "!", "q")
end
vim.api.nvim_create_autocmd("RecordingEnter", {callback = _86_, group = "mitchellwrosen"})
vim.keymap.set("n", "9", "@z")
local function _87_()
  return vim.cmd.startinsert()
end
vim.api.nvim_create_autocmd("FileType", {pattern = "gitcommit", callback = _87_, group = "mitchellwrosen"})
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
      local _88_ = value.kind
      if (_88_ == "begin") then
        start_ms = vim.loop.now()
        if not notifications[client_id] then
          notifications[client_id] = {}
        else
        end
        local notification_id
        local function _90_()
          if value.title then
            return (" " .. value.title)
          else
            return ""
          end
        end
        local function _91_()
          if value.message then
            return (" " .. value.message)
          else
            return ""
          end
        end
        notification_id = vim.notify(("        | " .. client.name .. ":" .. _90_() .. _91_()), vim.log.levels.INFO, {render = "minimal", timeout = false})
        do end (notifications)[client_id][token] = {id = notification_id, ["start-ms"] = start_ms, title = value.title}
      elseif (_88_ == "report") then
        local _local_92_ = notifications[client_id][token]
        local old_notification_id = _local_92_["id"]
        local title = _local_92_["title"]
        local new_notification_id
        local function _93_()
          if title then
            return (" " .. title)
          else
            return ""
          end
        end
        local function _94_()
          if value.message then
            return (" " .. value.message)
          else
            return ""
          end
        end
        new_notification_id = vim.notify(("        | " .. client.name .. ":" .. _93_() .. _94_()), vim.log.levels.INFO, {replace = old_notification_id})
        do end (notifications)[client_id][token]["id"] = new_notification_id
      elseif (_88_ == "end") then
        local stop_ms = vim.loop.now()
        local _local_95_ = notifications[client_id][token]
        local notification_id = _local_95_["id"]
        local start_ms0 = _local_95_["start-ms"]
        local title = _local_95_["title"]
        local function _96_()
          if title then
            return (" " .. title)
          else
            return ""
          end
        end
        local function _97_()
          if value.message then
            return (" " .. value.message)
          else
            return ""
          end
        end
        local _98_
        if ((stop_ms - start_ms0) < 100) then
          _98_ = 0
        else
          _98_ = 3000
        end
        vim.notify((string.format("%6.2fs", ((stop_ms - start_ms0) / 1000)) .. " | " .. client.name .. ":" .. _96_() .. _97_()), vim.log.levels.INFO, {replace = notification_id, timeout = _98_})
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
local function seems_like_haskell_project()
  local acc = false
  for name, typ in vim.fs.dir(".") do
    if acc then break end
    if ((typ == "file") and ((name == "cabal.project") or (name == "stack.yaml") or string.match(name, "%.cabal$"))) then
      acc = true
    else
      acc = acc
    end
  end
  return acc
end
local function _103_()
  if seems_like_haskell_project() then
    local initialize_notification_id = nil
    local start_ms = nil
    local function _104_(_, _0)
      start_ms = vim.loop.now()
      initialize_notification_id = vim.notify("        | hls: Initializing", vim.log.levels.INFO, {render = "minimal", timeout = false})
      return nil
    end
    local function _105_(_, _0)
      local stop_ms = vim.loop.now()
      return vim.notify((string.format("%6.2fs", ((stop_ms - start_ms) / 1000)) .. " | hls: Initialized"), vim.log.levels.INFO, {replace = initialize_notification_id, timeout = 3000})
    end
    return vim.lsp.start({before_init = _104_, on_init = _105_, cmd = {"haskell-language-server-wrapper", "--lsp"}, name = "hls", root_dir = ".", settings = {haskell = {formattingProvider = "ormolu", plugin = {hlint = {globalOn = false}, stan = {globalOn = false}}}}})
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("FileType", {pattern = "haskell", callback = _103_, group = "mitchellwrosen"})
local function _107_()
  vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", {buffer = true})
  vim.keymap.set("n", "<C-c>", "i<C-c>", {buffer = true})
  return vim.cmd.startinsert()
end
vim.api.nvim_create_autocmd("TermOpen", {callback = _107_, group = "mitchellwrosen"})
local function _108_()
  if ((vim.fn.argc() == 0) and file_exists("Session.vim")) then
    return vim.cmd({cmd = "source", args = {"Session.vim"}, mods = {silent = true}})
  else
    return nil
  end
end
vim.api.nvim_create_autocmd("VimEnter", {nested = true, callback = _108_, group = "mitchellwrosen"})
local lsp = require("lspconfig")
local status = require("lsp-status")
local capabilities
local function _110_(config)
  _G.assert((nil ~= config), "Missing argument config on init.fnl:853")
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  return cmp_nvim_lsp.update_capabilities(vim.tbl_extend("keep", (config.capabilities or {}), status.capabilities))
end
capabilities = _110_
vim.diagnostic.config({float = {scope = "cursor", header = ""}, underline = {severity = vim.diagnostic.severity.ERROR}, virtual_lines = {only_current_line = true}, virtual_text = false})
local function _111_(client, buf)
  _G.assert((nil ~= buf), "Missing argument buf on init.fnl:885")
  _G.assert((nil ~= client), "Missing argument client on init.fnl:885")
  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
    return nil
  else
    return nil
  end
end
lsp.elmls.setup({capabilities = capabilities(lsp.elmls), on_attach = _111_})
return lsp.sumneko_lua.setup({capabilities = capabilities(lsp.sumneko_lua)})
