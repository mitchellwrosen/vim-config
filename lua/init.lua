package.preload["fennel/mappings"] = package.preload["fennel/mappings"] or function(...)
  vim.keymap.set({"c", "i", "n", "o", "v"}, ";", ":")
  vim.keymap.set({"c", "i", "n", "o", "v"}, ":", ";")
  vim.keymap.set("n", "r;", "r:")
  vim.keymap.set("n", "r:", "r;")
  vim.keymap.set("n", "'", "`")
  vim.keymap.set("n", "/", "/\\v")
  vim.keymap.set("v", "/", "/\\v")
  vim.keymap.set("n", "*", "*``")
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
  vim.keymap.set("n", "<C-r>", "<Nop>")
  vim.keymap.set({"n", "v"}, "n", "nzz")
  vim.keymap.set({"n", "v"}, "N", "Nzz")
  local function _12_()
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
    local function _14_()
      if (num_listed <= 1) then
        return "q"
      else
        return "bd"
      end
    end
    return vim.cmd(_14_())
  end
  vim.keymap.set("n", "q", _12_)
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
  vim.keymap.set("n", "<Space>s", "m`vip<Esc>:silent '<,'>w !repld-send --no-echo<CR>``", {silent = true})
  vim.keymap.set("n", "<Space>S", "m`:silent w !repld-send<CR>``", {silent = true})
  vim.keymap.set("v", "<Space>s", "m`<Esc>:silent '<,'>w !repld-send<CR>``", {silent = true})
  vim.keymap.set("i", "<C-v>", "<C-r>*")
  vim.keymap.set("c", "<C-h>", "<Left>")
  vim.keymap.set("c", "<C-j>", "<Down>")
  vim.keymap.set("c", "<C-k>", "<Up>")
  vim.keymap.set("c", "<C-l>", "<Right>")
  vim.keymap.set("n", "~", "mzlblgueh~`z", {silent = true})
  local number_regex = "0x\\x\\+\\|\\d\\+\\(\\.\\d\\+\\)\\?"
  local function _15_()
    local matched_line = vim.fn.search(number_regex, "ceW")
    if (matched_line ~= 0) then
      vim.cmd("normal! v")
      return vim.fn.search(number_regex, "bcW")
    else
      return nil
    end
  end
  return vim.keymap.set("o", "n", _15_)
end
do
  local lazypath = (vim.fn.stdpath("data") .. "/lazy/lazy.nvim")
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim", "--branch=v9.14.2", lazypath})
  else
  end
  do end (vim.opt.rtp):prepend(lazypath)
end
do
  local lazy = require("lazy")
  local function _2_(_, _0)
    local deadcolumn = require("deadcolumn")
    return deadcolumn.setup({blending = {threshold = 100}, scope = "visible", warning = {alpha = 0.1, hlgroup = {"ErrorMsg", "background"}}})
  end
  local function _3_(_, _0)
    local leap = require("leap")
    return leap.add_default_mappings()
  end
  local function _4_(_, _0)
    local cmp = require("cmp")
    return cmp.setup({mapping = {["<CR>"] = cmp.mapping.confirm({select = false}), ["<Tab>"] = cmp.mapping.select_next_item()}, sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "buffer"}})})
  end
  local function _5_(_, _0)
    local bqf = require("bqf")
    return bqf.setup()
  end
  local function _6_(_, _0)
    local lualine = require("lualine")
    return lualine.setup({component_separators = "", icons_enabled = false, section_separators = "", sections = {lualine_a = {"mode"}, lualine_b = {"branch", "diff", "diagnostics"}, lualine_c = {"filename"}, lualine_x = {"filetype"}, lualine_y = {"progress"}, lualine_z = {"location"}}, tabline = {lualine_a = {{show_filenames_only = true, "buffers"}}, lualine_b = {}, lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = {}}})
  end
  local function _7_(_, _0)
    local plugin = require("indent_blankline")
    return plugin.setup({show_current_context = true})
  end
  local function _8_(_, _0)
    local treesitter = require("nvim-treesitter.configs")
    return treesitter.setup({highlight = {enable = true}})
  end
  local function _9_(_, _0)
    vim.notify = require("notify")
    return nil
  end
  local function _10_(_, _0)
    return nil
  end
  local function _11_(_, _0)
    local lsp_lines = require("lsp_lines")
    return lsp_lines.setup()
  end
  lazy.setup({{url = "https://github.com/bakpakin/fennel.vim", commit = "30b9beabad2c4f09b9b284caf5cd5666b6b4dc89", ft = "fennel"}, {url = "https://github.com/Bekaboo/deadcolumn.nvim", commit = "8140fd7cface9592a44b3151203fc6ca95ad9598", event = "InsertEnter", config = _2_}, {url = "https://github.com/ggandor/leap.nvim", commit = "f74473d23ebf60957e0db3ff8172349a82e5a442", event = "VeryLazy", config = _3_}, {url = "https://github.com/hrsh7th/nvim-cmp", commit = "f841fa6ced194aa930136a7671439e6bd4c51722", dependencies = {{url = "https://github.com/hrsh7th/cmp-nvim-lsp", commit = "b4251f0fca1daeb6db5d60a23ca81507acf858c2"}, {url = "https://github.com/hrsh7th/cmp-buffer", commit = "f83773e2f433a923997c5faad7ea689ec24d1785"}}, event = "InsertEnter", config = _4_}, {url = "https://github.com/kevinhwang91/nvim-bqf", tag = "v1.1.0", ft = "qf", config = _5_}, {url = "https://github.com/nvim-lualine/lualine.nvim", commit = "84ffb80e452d95e2c46fa29a98ea11a240f7843e", config = _6_}, {url = "https://github.com/junegunn/fzf", commit = "6dcf5c3d7d6c321b17e6a5673f1533d6e8350462"}, {url = "https://github.com/junegunn/fzf.vim", commit = "d5f1f8641b24c0fd5b10a299824362a2a1b20ae0"}, {url = "https://github.com/LnL7/vim-nix", commit = "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee", ft = "nix"}, {url = "https://github.com/lukas-reineke/indent-blankline.nvim", tag = "v2.20.4", config = _7_}, {url = "https://github.com/neovim/nvim-lsp", commit = "2c70b7b0095b4bbe55aaf0dc27a2581d1cafe491"}, {url = "https://github.com/neovimhaskell/haskell-vim", commit = "f35d02204b4813d1dbe8b0e98cc39701a4b8e15e", ft = "haskell"}, {url = "https://github.com/nvim-lua/lsp-status.nvim", commit = "4073f766f1303fb602802075e558fe43e382cc92"}, {url = "https://github.com/nvim-treesitter/nvim-treesitter", tag = "v0.8.5.2", build = ":TSUpdate", config = _8_}, {url = "https://github.com/rcarriga/nvim-notify", tag = "v3.11.0", event = "VeryLazy", config = _9_}, {url = "https://github.com/romainl/vim-cool", commit = "27ad4ecf7532b750fadca9f36e1c5498fc225af2", event = "VeryLazy"}, {url = "https://github.com/sainnhe/gruvbox-material", commit = "a6c5f652788b36c6ff2a0fdbefa271cb46f8f5e7", priority = 1000}, {url = "https://github.com/tommcdo/vim-exchange", commit = "784d63083ad7d613aa96f00021cd0dfb126a781a", config = _10_}, {url = "https://github.com/tpope/vim-characterize", commit = "885a00a3c21dd52ca8f2fd7d62850134934179d9", event = "VeryLazy"}, {url = "https://github.com/tpope/vim-commentary", commit = "627308e30639be3e2d5402808ce18690557e8292", event = "VeryLazy"}, {url = "https://github.com/tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a", event = "VeryLazy"}, {url = "https://github.com/tpope/vim-surround", commit = "aeb933272e72617f7c4d35e1f003be16836b948d", event = "VeryLazy"}, {url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim", commit = "dcff567b3a2d730f31b6da229ca3bb40640ec5a6", config = _11_}})
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
vim.api.nvim_set_keymap("n", "<Space>b", "<Plug>(git-messenger)", {})
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
vim.o.autowriteall = true
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.grepprg = "rg --vimgrep"
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.inccommand = "split"
vim.o.joinspaces = false
vim.o.lazyredraw = true
vim.o.listchars = "tab:> ,trail:\194\183,nbsp:+"
vim.o.mouse = ""
vim.o.report = 0
vim.o.scrolloff = 15
vim.o.shiftround = true
vim.o.shortmess = "filnxtToOFIc"
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
  vim.bo["synmaxcol"] = 3000
  vim.o["synmaxcol"] = 3000
end
do
  vim.bo["softtabstop"] = 2
  vim.o["softtabstop"] = 2
end
require("fennel/mappings")
vim.api.nvim_create_augroup("mitchellwrosen", {})
local function _17_(opts)
  local function _18_()
    local last_known_line = (vim.api.nvim_buf_get_mark(opts.buf, "\""))[1]
    if ((last_known_line > 1) and (last_known_line <= vim.api.nvim_buf_line_count(opts.buf))) then
      return vim.api.nvim_feedkeys("g`\"", "x", false)
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("BufWinEnter", {once = true, buffer = opts.buf, callback = _18_})
end
vim.api.nvim_create_autocmd("BufRead", {callback = _17_})
local function _20_()
  vim.bo.modifiable = not vim.bo.readonly
  return nil
end
vim.api.nvim_create_autocmd("BufReadPost", {callback = _20_, group = "mitchellwrosen"})
local function _21_()
  return vim.highlight.on_yank({higroup = "IncSearch", timeout = 300})
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _21_, group = "mitchellwrosen"})
local function _22_()
  if (vim.fn.getcmdwintype() == "") then
    return vim.cmd("checktime")
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"CursorHold", "FocusGained"}, {callback = _22_, group = "mitchellwrosen"})
local function _24_()
  if ((vim.o.buftype == "") and (vim.api.nvim_buf_get_name(0) ~= "")) then
    local view = vim.fn.winsaveview()
    vim.cmd("keeppatterns silent! %s/\\s\\+$//e")
    vim.cmd("silent! update")
    return vim.fn.winrestview(view)
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {callback = _24_, group = "mitchellwrosen"})
local extract_haskell_typesig_from_markdown
local function _26_(str0)
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
extract_haskell_typesig_from_markdown = _26_
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"})
local hover_namespace = vim.api.nvim_create_namespace("hover")
local function _31_(args)
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
  local function _32_()
    return vim.diagnostic.goto_prev({float = false})
  end
  vim.keymap.set("n", "<Up>", _32_, {buffer = buf, silent = true})
  local function _33_()
    return vim.diagnostic.goto_next({float = false})
  end
  vim.keymap.set("n", "<Down>", _33_, {buffer = buf, silent = true})
  local function _34_()
    if (vim.api.nvim_get_mode().mode == "n") then
      local position = vim.lsp.util.make_position_params()
      local line_number = position.position.line
      if ((vim.api.nvim_buf_get_lines(buf, line_number, (line_number + 1), false))[1] ~= "") then
        if client.server_capabilities.documentHighlightProvider then
          vim.lsp.buf.clear_references()
          vim.lsp.buf.document_highlight()
        else
        end
        local function _36_(_err, result, _ctx, _config)
          local contents
          do
            local t_37_ = result
            if (nil ~= t_37_) then
              t_37_ = (t_37_).contents
            else
            end
            contents = t_37_
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
        return vim.lsp.buf_request(buf, "textDocument/hover", position, _36_)
      else
        return nil
      end
    else
      return nil
    end
  end
  vim.api.nvim_create_autocmd("CursorMoved", {buffer = buf, callback = _34_, group = augroup_name})
  vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
  return nil
end
vim.api.nvim_create_autocmd("LspAttach", {callback = _31_, group = "mitchellwrosen"})
local function _43_()
  return vim.keymap.set("n", "1", "qz")
end
vim.api.nvim_create_autocmd({"RecordingLeave", "VimEnter"}, {callback = _43_, group = "mitchellwrosen"})
local function _44_()
  return vim.keymap.set("n", "1", "q")
end
vim.api.nvim_create_autocmd("RecordingEnter", {callback = _44_, group = "mitchellwrosen"})
vim.keymap.set("n", "9", "@z")
vim.api.nvim_create_autocmd("FileType", {command = "startinsert", group = "mitchellwrosen", pattern = "gitcommit"})
vim.api.nvim_create_autocmd("TermOpen", {command = "startinsert", group = "mitchellwrosen"})
do
  local lsp = require("lspconfig")
  local status = require("lsp-status")
  local capabilities
  local function _45_(config)
    _G.assert((nil ~= config), "Missing argument config on fennel/init.fnl:650")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    return cmp_nvim_lsp.update_capabilities(vim.tbl_extend("keep", (config.capabilities or {}), status.capabilities))
  end
  capabilities = _45_
  status.register_progress()
  vim.diagnostic.config({float = {scope = "cursor", header = ""}, underline = {severity = vim.diagnostic.severity.ERROR}, virtual_lines = {only_current_line = true}, virtual_text = false})
  local function _46_(client, buf)
    _G.assert((nil ~= buf), "Missing argument buf on fennel/init.fnl:685")
    _G.assert((nil ~= client), "Missing argument client on fennel/init.fnl:685")
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
      return nil
    else
      return nil
    end
  end
  lsp.elmls.setup({capabilities = capabilities(lsp.elmls), on_attach = _46_})
  lsp.hls.setup({capabilities = capabilities(lsp.hls), cmd = {"haskell-language-server-wrapper", "--lsp"}, settings = {haskell = {formattingProvider = "ormolu", plugin = {hlint = {globalOn = false}, stan = {globalOn = false}}}}})
  lsp.sumneko_lua.setup({capabilities = capabilities(lsp.sumneko_lua)})
end
local function run_floating(command)
  _G.assert((nil ~= command), "Missing argument command on fennel/init.fnl:718")
  local buf = vim.api.nvim_create_buf(false, true)
  local columns = vim.o.columns
  local lines = vim.o.lines
  local height = math.floor(((lines * 0.8) + 0.5))
  local row = math.floor((((lines - height) / 2) + 0.5))
  local width = math.floor(((columns * 0.8) + 0.5))
  local col = math.floor((((columns - width) / 2) + 0.5))
  local win = vim.api.nvim_open_win(buf, true, {col = col, height = height, relative = "editor", row = row, style = "minimal", width = width})
  local function _48_()
    return vim.cmd(("bw! " .. buf))
  end
  vim.fn.termopen(command, {on_exit = _48_})
  vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<Esc>", {noremap = true, nowait = true, silent = true})
  return win
end
return {run_floating = run_floating, virtual_hover = __fnl_global__virtual_2dhover}
