package.preload["fennel/mappings"] = package.preload["fennel/mappings"] or function(...)
  do
    vim.api.nvim_set_keymap("c", ";", ":", {noremap = true})
    vim.api.nvim_set_keymap("i", ";", ":", {noremap = true})
    vim.api.nvim_set_keymap("n", ";", ":", {noremap = true})
    vim.api.nvim_set_keymap("o", ";", ":", {noremap = true})
    vim.api.nvim_set_keymap("v", ";", ":", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("c", ":", ";", {noremap = true})
    vim.api.nvim_set_keymap("i", ":", ";", {noremap = true})
    vim.api.nvim_set_keymap("n", ":", ";", {noremap = true})
    vim.api.nvim_set_keymap("o", ":", ";", {noremap = true})
    vim.api.nvim_set_keymap("v", ":", ";", {noremap = true})
  end
  vim.api.nvim_set_keymap("n", "r;", "r:", {noremap = true})
  vim.api.nvim_set_keymap("n", "r:", "r;", {noremap = true})
  vim.api.nvim_set_keymap("n", "'", "`", {noremap = true})
  vim.api.nvim_set_keymap("n", "/", "/\\v", {noremap = true})
  vim.api.nvim_set_keymap("v", "/", "/\\v", {noremap = true})
  vim.api.nvim_set_keymap("n", "*", "*``", {noremap = true})
  vim.api.nvim_set_keymap("n", "<BS>", "<C-^>", {noremap = true})
  vim.api.nvim_set_keymap("n", "j", "gj", {noremap = true})
  vim.api.nvim_set_keymap("n", "k", "gk", {noremap = true})
  vim.keymap.set({"n", "v"}, "J", "6j", {remap = true})
  vim.keymap.set({"n", "v"}, "K", "6k", {remap = true})
  vim.keymap.set({"n", "o", "v"}, "H", "^")
  vim.keymap.set({"n", "o"}, "L", "$")
  vim.keymap.set("v", "L", "g_")
  vim.api.nvim_set_keymap("n", "Y", "y$", {noremap = true})
  vim.api.nvim_set_keymap("v", "D", "d`>", {noremap = true})
  vim.api.nvim_set_keymap("v", "Y", "y`>", {noremap = true})
  vim.api.nvim_set_keymap("n", "gV", "'`[' . strpart(getregtype(), 0, 1) . '`]'", {expr = true, noremap = true})
  vim.api.nvim_set_keymap("n", "U", "<C-r>", {noremap = true})
  vim.api.nvim_set_keymap("n", "<C-r>", "<Nop>", {noremap = true})
  do
    vim.api.nvim_set_keymap("n", "n", "nzz", {noremap = true})
    vim.api.nvim_set_keymap("v", "n", "nzz", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "N", "Nzz", {noremap = true})
    vim.api.nvim_set_keymap("v", "N", "Nzz", {noremap = true})
  end
  local function _12_()
    local buffers = vim.api.nvim_list_bufs()
    local loaded
    do
      local acc = 0
      for _, buffer in ipairs(buffers) do
        if vim.api.nvim_buf_is_loaded(buffer) then
          acc = (acc + 1)
        else
          acc = acc
        end
      end
      loaded = acc
    end
    local function _14_()
      if (loaded <= 1) then
        return "q"
      else
        return "bd"
      end
    end
    return vim.cmd(_14_())
  end
  vim.keymap.set("n", "q", _12_)
  vim.keymap.set("n", ">", "<Plug>MyNmapLl", {silent = true})
  vim.keymap.set("n", "<", "<Plug>MyNmapHh", {silent = true})
  vim.keymap.set("n", "<Plug>MyNmapLl", ">>ll:call repeat#set(\"\\<Plug>MyNmapLl\")<CR>", {silent = true})
  vim.keymap.set("n", "<Plug>MyNmapHh", "<<hh:call repeat#set(\"\\<Plug>MyNmapHh\")<CR>", {silent = true})
  vim.keymap.set("n", "M", "m`J``")
  vim.api.nvim_set_keymap("v", "al", "$o0", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("o", "al", ":<C-u>normal val<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("v", "il", "g_o^", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("o", "il", ":<C-u>normal vil<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<C-s>", ":%s/\\v//cg<Left><Left><Left><Left>", {noremap = true})
  vim.api.nvim_set_keymap("v", "<C-s>", ":s/\\v//cg<Left><Left><Left><Left>", {noremap = true})
  vim.api.nvim_set_keymap("n", "<C-j>", ":bn<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<C-k>", ":bp<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Space>s", "m`vip<Esc>:silent '<,'>w !repld-send --no-echo<CR>``", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Space>S", "m`:silent w !repld-send<CR>``", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("v", "<Space>s", "m`<Esc>:silent '<,'>w !repld-send<CR>``", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("i", "<C-v>", "<C-r>*", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-h>", "<Left>", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-j>", "<Down>", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-k>", "<Up>", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-l>", "<Right>", {noremap = true})
  return vim.keymap.set("n", "~", "mzlblgueh~`z", {silent = true})
end
package.preload["fennel/nvim"] = package.preload["fennel/nvim"] or function(...)
  local mode = {command = "command", insert = "insert", normal = "normal", ["operator-pending"] = "operator-pending", visual = "visual"}
  local n = 0
  local lambdas = {}
  local function register_lambda(f)
    _G.assert((nil ~= f), "Missing argument f on ./fennel/nvim.fnl:11")
    local name = ("f" .. tostring(n))
    do end (lambdas)[name] = f
    n = (n + 1)
    return name
  end
  local function buf_map_fn(modes, lhs, f, opts)
    _G.assert((nil ~= opts), "Missing argument opts on ./fennel/nvim.fnl:17")
    _G.assert((nil ~= f), "Missing argument f on ./fennel/nvim.fnl:17")
    _G.assert((nil ~= lhs), "Missing argument lhs on ./fennel/nvim.fnl:17")
    _G.assert((nil ~= modes), "Missing argument modes on ./fennel/nvim.fnl:17")
    local name = register_lambda(f)
    for _, mode0 in ipairs(modes) do
      vim.api.nvim_buf_set_keymap(0, modes[1], lhs, (":lua require('fennel/nvim').lambdas." .. name .. "()<CR>"), opts)
    end
    return nil
  end
  local function overwrite_buffer(s)
    _G.assert((nil ~= s), "Missing argument s on ./fennel/nvim.fnl:23")
    if vim.bo.modifiable then
      local w = vim.fn.winsaveview()
      vim.api.nvim_buf_set_lines(0, 0, -1, false, s)
      return vim.fn.winrestview(w)
    else
      return print("Cannot write to non-modifiable buffer")
    end
  end
  local function sys_format_buffer(program)
    _G.assert((nil ~= program), "Missing argument program on ./fennel/nvim.fnl:31")
    local output = vim.fn.system((program .. " " .. vim.api.nvim_buf_get_name(0)))
    if (vim.v.shell_error == 0) then
      overwrite_buffer(vim.fn.split(output, "\n"))
      return vim.cmd("update")
    else
      return nil
    end
  end
  return {["buf-map-fn"] = buf_map_fn, lambdas = lambdas, mode = mode, ["sys-format-buffer"] = sys_format_buffer}
end
require("fennel/nvim")
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
  local function _4_(_, _0)
    local deadcolumn = require("deadcolumn")
    return deadcolumn.setup({blending = {threshold = 100}, scope = "visible", warning = {alpha = 0.1, hlgroup = {"ErrorMsg", "background"}}})
  end
  local function _5_(_, _0)
    local leap = require("leap")
    return leap.add_default_mappings()
  end
  local function _6_(_, _0)
    local cmp = require("cmp")
    return cmp.setup({mapping = {["<CR>"] = cmp.mapping.confirm({select = false}), ["<Tab>"] = cmp.mapping.select_next_item()}, sources = cmp.config.sources({{name = "nvim_lsp"}, {name = "buffer"}})})
  end
  local function _7_(_, _0)
    vim.g.lightline = {active = {left = {{"mode", "paste"}, {"branch"}}, right = {{"lineinfo"}, {"percent"}, {"filetype"}, {"lsp"}}}, colorscheme = "gruvbox_material", component_expand = {buffers = "lightline#bufferline#buffers"}, component_function = {branch = "FugitiveHead", filename = "LightlineFilename", lsp = "LightlineLspStatus"}, component_type = {buffers = "tabsel"}, mode_map = {c = "   ", i = "   ", n = "", R = "   ", t = "   ", v = "   ", V = "   ", ["\22"] = "   "}, tab = {active = {"tabnum", "filename", "modified"}, inactive = {"tabnum", "filename", "modified"}}, tabline = {left = {{"buffers"}}, right = {{}}}}
    return nil
  end
  local function _8_(_, _0)
    local plugin = require("indent_blankline")
    return plugin.setup({show_current_context = true})
  end
  local function _9_(_, _0)
    local treesitter = require("nvim-treesitter.configs")
    return treesitter.setup({highlight = {enable = true}})
  end
  local function _10_(_, _0)
    return nil
  end
  local function _11_(_, _0)
    local lsp_lines = require("lsp_lines")
    return lsp_lines.setup()
  end
  lazy.setup({{url = "https://github.com/bakpakin/fennel.vim", commit = "30b9beabad2c4f09b9b284caf5cd5666b6b4dc89", ft = "fennel"}, {url = "https://github.com/Bekaboo/deadcolumn.nvim", commit = "8140fd7cface9592a44b3151203fc6ca95ad9598", event = "InsertEnter", config = _4_}, {url = "https://github.com/ggandor/leap.nvim", commit = "f74473d23ebf60957e0db3ff8172349a82e5a442", event = "VeryLazy", config = _5_}, {url = "https://github.com/hrsh7th/nvim-cmp", commit = "f841fa6ced194aa930136a7671439e6bd4c51722", dependencies = {{url = "https://github.com/hrsh7th/cmp-nvim-lsp", commit = "b4251f0fca1daeb6db5d60a23ca81507acf858c2"}, {url = "https://github.com/hrsh7th/cmp-buffer", commit = "f83773e2f433a923997c5faad7ea689ec24d1785"}}, event = "InsertEnter", config = _6_}, {url = "https://github.com/itchyny/lightline.vim", commit = "a29b8331e1bb36b09bafa30c3aa77e89cdd832b2", config = _7_}, {url = "https://github.com/junegunn/fzf", commit = "6dcf5c3d7d6c321b17e6a5673f1533d6e8350462"}, {url = "https://github.com/junegunn/fzf.vim", commit = "d5f1f8641b24c0fd5b10a299824362a2a1b20ae0"}, {url = "https://github.com/LnL7/vim-nix", commit = "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee", ft = "nix"}, {url = "https://github.com/lukas-reineke/indent-blankline.nvim", tag = "v2.20.4", config = _8_}, {url = "https://github.com/mengelbrecht/lightline-bufferline", commit = "c0199a7027da92d9770d1e2a9f4bf6257c7ec7ef"}, {url = "https://github.com/neovim/nvim-lsp", commit = "2c70b7b0095b4bbe55aaf0dc27a2581d1cafe491"}, {url = "https://github.com/neovimhaskell/haskell-vim", commit = "f35d02204b4813d1dbe8b0e98cc39701a4b8e15e", ft = "haskell"}, {url = "https://github.com/nvim-lua/lsp-status.nvim", commit = "4073f766f1303fb602802075e558fe43e382cc92"}, {url = "https://github.com/nvim-treesitter/nvim-treesitter", tag = "v0.8.5.2", build = ":TSUpdate", config = _9_}, {url = "https://github.com/romainl/vim-cool", commit = "27ad4ecf7532b750fadca9f36e1c5498fc225af2", event = "VeryLazy"}, {url = "https://github.com/sainnhe/gruvbox-material", commit = "a6c5f652788b36c6ff2a0fdbefa271cb46f8f5e7", priority = 1000}, {url = "https://github.com/tommcdo/vim-exchange", commit = "784d63083ad7d613aa96f00021cd0dfb126a781a", config = _10_}, {url = "https://github.com/tpope/vim-characterize", commit = "885a00a3c21dd52ca8f2fd7d62850134934179d9", event = "VeryLazy"}, {url = "https://github.com/tpope/vim-commentary", commit = "627308e30639be3e2d5402808ce18690557e8292", event = "VeryLazy"}, {url = "https://github.com/tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a", event = "VeryLazy"}, {url = "https://github.com/tpope/vim-surround", commit = "aeb933272e72617f7c4d35e1f003be16836b948d", event = "VeryLazy"}, {url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim", commit = "dcff567b3a2d730f31b6da229ca3bb40640ec5a6", config = _11_}})
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
do
  vim.api.nvim_set_keymap("n", "x", "<Plug>(Exchange)", {})
  vim.api.nvim_set_keymap("v", "x", "<Plug>(Exchange)", {})
end
vim.api.nvim_set_keymap("n", "xw", "<Plug>(Exchange)e", {})
vim.api.nvim_set_keymap("n", "xW", "<Plug>(Exchange)E", {})
vim.api.nvim_set_keymap("n", "xx", "m`<Plug>(ExchangeLine)``", {})
vim.api.nvim_set_keymap("n", "X", "<Plug>(Exchange)$", {})
vim.api.nvim_set_keymap("n", "xc", "<Plug>(ExchangeClear)", {})
vim.api.nvim_set_keymap("n", "-", "m`<Plug>CommentaryLine``", {})
vim.api.nvim_set_keymap("v", "-", "<Plug>Commentary", {})
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
vim.wo.colorcolumn = "120"
vim.wo.cursorline = true
vim.wo.foldenable = false
vim.wo.linebreak = true
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
local function _15_(opts)
  local function _16_()
    local last_known_line = (vim.api.nvim_buf_get_mark(opts.buf, "\""))[1]
    if ((last_known_line > 1) and (last_known_line <= vim.api.nvim_buf_line_count(opts.buf))) then
      return vim.api.nvim_feedkeys("g`\"", "x", false)
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("BufWinEnter", {once = true, buffer = opts.buf, callback = _16_})
end
vim.api.nvim_create_autocmd("BufRead", {callback = _15_})
local function _18_()
  vim.bo.modifiable = not vim.bo.readonly
  return nil
end
vim.api.nvim_create_autocmd("BufReadPost", {callback = _18_, group = "mitchellwrosen"})
local function _19_()
  return vim.highlight.on_yank({higroup = "Visual", timeout = 600})
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _19_, group = "mitchellwrosen"})
local function _20_()
  if (vim.fn.getcmdwintype() == "") then
    return vim.cmd("checktime")
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"CursorHold", "FocusGained"}, {callback = _20_, group = "mitchellwrosen"})
local function _22_()
  if ((vim.o.buftype == "") and (vim.api.nvim_buf_get_name(0) ~= "")) then
    return vim.cmd("silent! update")
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {callback = _22_, group = "mitchellwrosen"})
local extract_haskell_typesig_from_markdown
local function _24_(str0)
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
extract_haskell_typesig_from_markdown = _24_
local hover_namespace = vim.api.nvim_create_namespace("hover")
local function _29_(args)
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
  local function _30_()
    return vim.diagnostic.goto_prev({float = false})
  end
  vim.keymap.set("n", "<Up>", _30_, {buffer = buf, silent = true})
  local function _31_()
    return vim.diagnostic.goto_next({float = false})
  end
  vim.keymap.set("n", "<Down>", _31_, {buffer = buf, silent = true})
  local function _32_()
    if (vim.api.nvim_get_mode().mode == "n") then
      local position = vim.lsp.util.make_position_params()
      if client.server_capabilities.documentHighlightProvider then
        vim.lsp.buf.clear_references()
        vim.lsp.buf.document_highlight()
      else
      end
      local function _34_(_err, result, _ctx, _config)
        local contents
        do
          local t_35_ = result
          if (nil ~= t_35_) then
            t_35_ = (t_35_).contents
          else
          end
          contents = t_35_
        end
        if (not (contents == nil) and (type(contents) == "table") and ("markdown" == contents.kind)) then
          local line = extract_haskell_typesig_from_markdown(contents.value)
          vim.api.nvim_buf_clear_namespace(0, hover_namespace, 0, -1)
          if line then
            return vim.api.nvim_buf_set_extmark(0, hover_namespace, position.position.line, 1, {virt_text = {{("\226\136\153 " .. line), "Comment"}}})
          else
            return nil
          end
        else
          return nil
        end
      end
      return vim.lsp.buf_request(0, "textDocument/hover", position, _34_)
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("CursorMoved", {buffer = buf, callback = _32_, group = augroup_name})
end
vim.api.nvim_create_autocmd("LspAttach", {callback = _29_, group = "mitchellwrosen"})
local function _40_()
  return vim.keymap.set("n", "1", "qz")
end
vim.api.nvim_create_autocmd({"RecordingLeave", "VimEnter"}, {callback = _40_, group = "mitchellwrosen"})
local function _41_()
  return vim.keymap.set("n", "1", "q")
end
vim.api.nvim_create_autocmd("RecordingEnter", {callback = _41_, group = "mitchellwrosen"})
vim.keymap.set("n", "9", "@z")
local function _42_()
  return vim.cmd("startinsert")
end
vim.api.nvim_create_autocmd("TermOpen", {callback = _42_, group = "mitchellwrosen"})
do
  local lsp = require("lspconfig")
  local status = require("lsp-status")
  local capabilities
  local function _43_(config)
    _G.assert((nil ~= config), "Missing argument config on fennel/init.fnl:638")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    return cmp_nvim_lsp.update_capabilities(vim.tbl_extend("keep", (config.capabilities or {}), status.capabilities))
  end
  capabilities = _43_
  local on_attach
  local function _44_(client, buf)
    _G.assert((nil ~= buf), "Missing argument buf on fennel/init.fnl:650")
    _G.assert((nil ~= client), "Missing argument client on fennel/init.fnl:650")
    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
    return nil
  end
  on_attach = _44_
  status.register_progress()
  vim.diagnostic.config({float = {scope = "cursor", header = ""}, underline = {severity = vim.diagnostic.severity.ERROR}, virtual_lines = true, virtual_text = false})
  local function _45_(client, buf)
    _G.assert((nil ~= buf), "Missing argument buf on fennel/init.fnl:685")
    _G.assert((nil ~= client), "Missing argument client on fennel/init.fnl:685")
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    else
    end
    return on_attach(client, buf)
  end
  lsp.elmls.setup({capabilities = capabilities(lsp.elmls), on_attach = _45_})
  lsp.hls.setup({capabilities = capabilities(lsp.hls), cmd = {"haskell-language-server-wrapper", "--lsp"}, settings = {haskell = {formattingProvider = "ormolu", plugin = {hlint = {globalOn = false}, stan = {globalOn = false}}}}, on_attach = on_attach})
  lsp.sumneko_lua.setup({capabilities = capabilities(lsp.sumneko_lua), on_attach = on_attach})
end
local function lightline_status()
  if (#vim.lsp.buf_get_clients() > 0) then
    return (require("lsp-status")).status()
  else
    return ""
  end
end
local function run_floating(command)
  _G.assert((nil ~= command), "Missing argument command on fennel/init.fnl:721")
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
return {lightline_status = lightline_status, run_floating = run_floating, virtual_hover = __fnl_global__virtual_2dhover}
