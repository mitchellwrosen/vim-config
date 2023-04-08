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
  vim.api.nvim_set_keymap("n", "J", "5j", {})
  vim.api.nvim_set_keymap("n", "K", "5k", {})
  vim.api.nvim_set_keymap("v", "J", "5j", {noremap = true})
  vim.api.nvim_set_keymap("v", "K", "5k", {noremap = true})
  do
    vim.api.nvim_set_keymap("n", "H", "^", {noremap = true})
    vim.api.nvim_set_keymap("o", "H", "^", {noremap = true})
    vim.api.nvim_set_keymap("v", "H", "^", {noremap = true})
  end
  do
    vim.api.nvim_set_keymap("n", "L", "$", {noremap = true})
    vim.api.nvim_set_keymap("o", "L", "$", {noremap = true})
  end
  vim.api.nvim_set_keymap("v", "L", "g_", {noremap = true})
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
  vim.api.nvim_set_keymap("n", "q", "len(getbufinfo({'buflisted': 1})) ==? 1 ? \":q\\<CR>\" : \":bd\\<CR>\"", {expr = true, noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", ",q", "q", {noremap = true})
  vim.api.nvim_set_keymap("n", "Q", "@q", {noremap = true})
  vim.api.nvim_set_keymap("n", ">>", "<Plug>MyNmapLl", {})
  vim.api.nvim_set_keymap("n", "<<", "<Plug>MyNmapHh", {})
  vim.api.nvim_set_keymap("n", "<Plug>MyNmapLl", ">>ll:call repeat#set(\"\\<Plug>MyNmapLl\")<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", "<Plug>MyNmapHh", "<<hh:call repeat#set(\"\\<Plug>MyNmapHh\")<CR>", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("n", ",j", "m`J``", {noremap = true})
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
  return vim.api.nvim_set_keymap("c", "<C-l>", "<Right>", {noremap = true})
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
    local lsp_lines = require("lsp_lines")
    return lsp_lines.setup()
  end
  lazy.setup({{url = "https://github.com/bakpakin/fennel.vim", commit = "30b9beabad2c4f09b9b284caf5cd5666b6b4dc89", ft = "fennel"}, {url = "https://github.com/Bekaboo/deadcolumn.nvim", commit = "8140fd7cface9592a44b3151203fc6ca95ad9598", event = "InsertEnter", config = _4_}, {url = "https://github.com/folke/trouble.nvim", commit = "20469be985143d024c460d95326ebeff9971d714"}, {url = "https://github.com/ggandor/leap.nvim", commit = "f74473d23ebf60957e0db3ff8172349a82e5a442", event = "VeryLazy", config = _5_}, {url = "https://github.com/hrsh7th/nvim-cmp", commit = "f841fa6ced194aa930136a7671439e6bd4c51722", dependencies = {{url = "https://github.com/hrsh7th/cmp-nvim-lsp", commit = "b4251f0fca1daeb6db5d60a23ca81507acf858c2"}, {url = "https://github.com/hrsh7th/cmp-buffer", commit = "f83773e2f433a923997c5faad7ea689ec24d1785"}}, event = "InsertEnter", config = _6_}, {url = "https://github.com/itchyny/lightline.vim", commit = "a29b8331e1bb36b09bafa30c3aa77e89cdd832b2", config = _7_}, {url = "https://github.com/junegunn/fzf", commit = "6dcf5c3d7d6c321b17e6a5673f1533d6e8350462"}, {url = "https://github.com/junegunn/fzf.vim", commit = "d5f1f8641b24c0fd5b10a299824362a2a1b20ae0"}, {url = "https://github.com/LnL7/vim-nix", commit = "7d23e97d13c40fcc6d603b291fe9b6e5f92516ee", ft = "nix"}, {url = "https://github.com/lukas-reineke/indent-blankline.nvim", tag = "v2.20.4", config = _8_}, {url = "https://github.com/mengelbrecht/lightline-bufferline", commit = "c0199a7027da92d9770d1e2a9f4bf6257c7ec7ef"}, {url = "https://github.com/neovim/nvim-lsp", commit = "2c70b7b0095b4bbe55aaf0dc27a2581d1cafe491"}, {url = "https://github.com/neovimhaskell/haskell-vim", commit = "f35d02204b4813d1dbe8b0e98cc39701a4b8e15e", ft = "haskell"}, {url = "https://github.com/nvim-lua/lsp-status.nvim", commit = "4073f766f1303fb602802075e558fe43e382cc92"}, {url = "https://github.com/nvim-treesitter/nvim-treesitter", tag = "v0.8.5.2", build = ":TSUpdate", config = _9_}, {url = "https://github.com/romainl/vim-cool", commit = "27ad4ecf7532b750fadca9f36e1c5498fc225af2"}, {url = "https://github.com/sainnhe/gruvbox-material", commit = "a6c5f652788b36c6ff2a0fdbefa271cb46f8f5e7", priority = 1000}, {url = "https://github.com/tommcdo/vim-exchange", commit = "784d63083ad7d613aa96f00021cd0dfb126a781a"}, {url = "https://github.com/tpope/vim-characterize", commit = "885a00a3c21dd52ca8f2fd7d62850134934179d9"}, {url = "https://github.com/tpope/vim-commentary", commit = "627308e30639be3e2d5402808ce18690557e8292"}, {url = "https://github.com/tpope/vim-repeat", commit = "24afe922e6a05891756ecf331f39a1f6743d3d5a", event = "VeryLazy"}, {url = "https://github.com/tpope/vim-surround", commit = "aeb933272e72617f7c4d35e1f003be16836b948d", event = "VeryLazy"}, {url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim", commit = "dcff567b3a2d730f31b6da229ca3bb40640ec5a6", config = _10_}})
end
vim.g.gruvbox_material_background = "soft"
vim.g.gruvbox_material_better_performance = 1
vim.g.gruvbox_material_enable_italic = 1
vim.cmd("colorscheme gruvbox-material")
do
  local trouble = require("trouble")
  trouble.setup({icons = false, position = "right"})
end
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
vim.o.hidden = true
vim.o.ignorecase = true
vim.o.lazyredraw = true
vim.o.joinspaces = false
vim.o.showmode = false
vim.o.startofline = false
vim.o.shiftround = true
vim.o.shortmess = "filnxtToOFIc"
vim.o.smartcase = true
vim.o.termguicolors = true
vim.o.title = true
vim.o.wildmenu = true
vim.o.report = 0
vim.o.scrolloff = 10
vim.o.sidescrolloff = 16
vim.o.showtabline = 2
vim.o.timeoutlen = 400
vim.o.updatetime = 300
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.completeopt = "menuone,noinsert,noselect"
vim.o.grepprg = "rg --vimgrep"
vim.o.inccommand = "split"
vim.o.listchars = "tab:> ,trail:\194\183,nbsp:+"
vim.o.wildmode = "list:longest,full"
vim.wo.colorcolumn = "120"
vim.wo.cursorline = true
vim.wo.linebreak = true
vim.wo.list = true
vim.wo.foldenable = false
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
local function _11_(opts)
  local function _12_()
    local last_known_line = (vim.api.nvim_buf_get_mark(opts.buf, "\""))[1]
    if ((last_known_line > 1) and (last_known_line <= vim.api.nvim_buf_line_count(opts.buf))) then
      return vim.api.nvim_feedkeys("g`\"", "x", false)
    else
      return nil
    end
  end
  return vim.api.nvim_create_autocmd("BufWinEnter", {once = true, buffer = opts.buf, callback = _12_})
end
vim.api.nvim_create_autocmd("BufRead", {callback = _11_})
local function _14_()
  vim.bo.modifiable = not vim.bo.readonly
  return nil
end
vim.api.nvim_create_autocmd("BufReadPost", {callback = _14_, group = "mitchellwrosen"})
local function _15_()
  return vim.highlight.on_yank({higroup = "Visual", timeout = 600})
end
vim.api.nvim_create_autocmd("TextYankPost", {callback = _15_, group = "mitchellwrosen"})
local function _16_()
  if (vim.fn.getcmdwintype() == "") then
    return vim.cmd("checktime")
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"CursorHold", "FocusGained"}, {callback = _16_, group = "mitchellwrosen"})
local function _18_()
  if ((vim.o.buftype == "") and (vim.api.nvim_buf_get_name(0) ~= "")) then
    return vim.cmd("silent! update")
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"InsertLeave", "TextChanged"}, {callback = _18_, group = "mitchellwrosen"})
local function _20_()
  return vim.cmd("startinsert")
end
vim.api.nvim_create_autocmd("TermOpen", {callback = _20_, group = "mitchellwrosen"})
do
  local lsp = require("lspconfig")
  local status = require("lsp-status")
  local capabilities
  local function _21_(config)
    _G.assert((nil ~= config), "Missing argument config on fennel/init.fnl:523")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    return cmp_nvim_lsp.update_capabilities(vim.tbl_extend("keep", (config.capabilities or {}), status.capabilities))
  end
  capabilities = _21_
  local on_attach
  local function _22_(client, buf)
    _G.assert((nil ~= buf), "Missing argument buf on fennel/init.fnl:535")
    _G.assert((nil ~= client), "Missing argument client on fennel/init.fnl:535")
    local augroup_name = ("mitchellwrosenLsp" .. buf)
    vim.api.nvim_create_augroup(augroup_name, {})
    vim.cmd("highlight LspReference guifg=NONE guibg=#665c54 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59")
    vim.cmd("highlight! link LspReferenceText LspReference")
    vim.cmd("highlight! link LspReferenceRead LspReference")
    vim.cmd("highlight! link LspReferenceWrite LspReference")
    vim.api.nvim_buf_set_keymap(buf, "n", "<Space>a", ":lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "<Space>d", ":lua vim.lsp.buf.format()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "<Enter>", ":lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "<Space>r", ":lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "gt", ":lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "<Up>", ":lua vim.diagnostic.goto_prev({float=false})<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "<Down>", ":lua vim.diagnostic.goto_next({float=false})<CR>", {noremap = true, silent = true})
    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
    local meaningful_head
    local function _23_(lines)
      local ret = ""
      local i = 1
      while (i <= #lines) do
        local l = lines[i]
        if ((l == "") or (0 == vim.fn.match(l, "^```"))) then
          i = (i + 1)
        else
          i = (#lines + 1)
          ret = l
        end
      end
      return ret
    end
    meaningful_head = _23_
    local filter
    do
      local _25_ = vim.bo.filetype
      if (_25_ == "haskell") then
        local function _26_(line)
          if (-1 == vim.fn.match(line, "::")) then
            return ""
          else
            return line
          end
        end
        filter = _26_
      elseif true then
        local _ = _25_
        local function _28_(line)
          return line
        end
        filter = _28_
      else
        filter = nil
      end
    end
    local function _30_()
      if (vim.api.nvim_get_mode().mode == "n") then
        local position = vim.lsp.util.make_position_params()
        if client.server_capabilities.documentHighlightProvider then
          vim.lsp.buf.clear_references()
          vim.lsp.buf.document_highlight()
        else
        end
        local function _32_(_err, result, _ctx, _config)
          if (not (result == nil) and (type(result) == "table")) then
            local namespace = vim.api.nvim_create_namespace("hover")
            local line = meaningful_head(vim.lsp.util.convert_input_to_markdown_lines(result.contents))
            vim.api.nvim_buf_clear_namespace(0, namespace, 0, -1)
            if not (filter(line) == "") then
              return vim.api.nvim_buf_set_virtual_text(0, namespace, position.position.line, {{("\226\136\153 " .. line), "Comment"}}, {})
            else
              return nil
            end
          else
            return nil
          end
        end
        return vim.lsp.buf_request(0, "textDocument/hover", position, _32_)
      else
        return nil
      end
    end
    return vim.api.nvim_create_autocmd({"CursorMoved"}, {buffer = buf, callback = _30_, group = augroup_name})
  end
  on_attach = _22_
  status.register_progress()
  vim.diagnostic.config({float = {scope = "cursor", header = ""}, underline = {severity = vim.diagnostic.severity.ERROR}, virtual_lines = true, virtual_text = false})
  local function _36_(client, buf)
    _G.assert((nil ~= buf), "Missing argument buf on fennel/init.fnl:693")
    _G.assert((nil ~= client), "Missing argument client on fennel/init.fnl:693")
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    else
    end
    return on_attach(client, buf)
  end
  lsp.elmls.setup({capabilities = capabilities(lsp.elmls), on_attach = _36_})
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
  _G.assert((nil ~= command), "Missing argument command on fennel/init.fnl:729")
  local buf = vim.api.nvim_create_buf(false, true)
  local columns = vim.o.columns
  local lines = vim.o.lines
  local height = math.floor(((lines * 0.8) + 0.5))
  local row = math.floor((((lines - height) / 2) + 0.5))
  local width = math.floor(((columns * 0.8) + 0.5))
  local col = math.floor((((columns - width) / 2) + 0.5))
  local win = vim.api.nvim_open_win(buf, true, {col = col, height = height, relative = "editor", row = row, style = "minimal", width = width})
  local function _39_()
    return vim.cmd(("bw! " .. buf))
  end
  vim.fn.termopen(command, {on_exit = _39_})
  vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<Esc>", {noremap = true, nowait = true, silent = true})
  return win
end
return {lightline_status = lightline_status, run_floating = run_floating, virtual_hover = __fnl_global__virtual_2dhover}
