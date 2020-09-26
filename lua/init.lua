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
  vim.api.nvim_set_keymap("n", "<Tab>", "<Nop>", {noremap = true})
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
  vim.api.nvim_set_keymap("i", "<C-v>", "<C-r>*", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-h>", "<Left>", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-j>", "<Down>", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-k>", "<Up>", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-l>", "<Right>", {noremap = true})
  vim.api.nvim_set_keymap("i", "<Tab>", "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"", {expr = true, noremap = true})
  return vim.api.nvim_set_keymap("i", "<CR", "pumvisible() ? \"\\<C-y>\" : \"\\<CR>\"", {expr = true, noremap = true})
end
package.preload["fennel/options"] = package.preload["fennel/options"] or function(...)
  vim.o.autowriteall = true
  vim.o.hidden = true
  vim.o.ignorecase = true
  vim.o.lazyredraw = true
  vim.o.joinspaces = false
  vim.o.showmode = false
  vim.o.startofline = false
  vim.o.shiftround = true
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
    vim.bo["synmaxcol"] = 180
    vim.o["synmaxcol"] = 180
  end
  vim.bo["softtabstop"] = 2
  vim.o["softtabstop"] = 2
  return nil
end
package.preload["fennel/plugin-startify"] = package.preload["fennel/plugin-startify"] or function(...)
  vim.g.startify_custom_footer = {"   [e]  empty buffer", "   [q]  quit"}
  vim.g.startify_custom_header = {}
  vim.g.startify_custom_indices = {"a", "s", "d", "f", "l", "g", "h", "w", "r", "u", "o", "p", "t", "y", "z", "x", "c", "v", "m", "", ".", "/", "b", "n", "1", "2", "3", "4", "5", "6"}
  vim.g.startify_enable_special = 0
  vim.g.startify_enable_unsafe = 1
  vim.g.startify_change_to_dir = 0
  vim.g.startify_files_number = 30
  vim.g.startify_lists = {{type = "files"}}
  vim.g.startify_relative_path = 1
  return nil
end
package.preload["fennel/plugins"] = package.preload["fennel/plugins"] or function(...)
  vim.fn["plug#begin"]((vim.fn.stdpath("data") .. "/plugged"))
  vim.cmd("Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }")
  vim.cmd("Plug 'Yggdroot/indentLine'")
  vim.cmd("Plug 'godlygeek/tabular'")
  vim.cmd("Plug 'itchyny/lightline.vim'")
  vim.cmd("Plug 'junegunn/fzf.vim'")
  vim.cmd("Plug 'liuchengxu/vim-which-key'")
  vim.cmd("Plug 'mengelbrecht/lightline-bufferline'")
  vim.cmd("Plug 'mhinz/vim-startify'")
  vim.cmd("Plug 'neovim/nvim-lsp'")
  vim.cmd("Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }")
  vim.cmd("Plug 'nvim-lua/completion-nvim'")
  vim.cmd("Plug 'nvim-lua/lsp-status.nvim'")
  vim.cmd("Plug 'rhysd/git-messenger.vim'")
  vim.cmd("Plug 'romainl/vim-cool'")
  vim.cmd("Plug 'romainl/vim-qf'")
  vim.cmd("Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }")
  vim.cmd("Plug 'rrethy/vim-illuminate'")
  vim.cmd("Plug 'sdiehl/vim-ormolu', { 'for': 'haskell' }")
  vim.cmd("Plug 'terryma/vim-multiple-cursors'")
  vim.cmd("Plug 'tommcdo/vim-exchange'")
  vim.cmd("Plug 'tpope/vim-characterize'")
  vim.cmd("Plug 'tpope/vim-commentary'")
  vim.cmd("Plug 'tpope/vim-fugitive'")
  vim.cmd("Plug 'tpope/vim-repeat'")
  vim.cmd("Plug 'tpope/vim-surround'")
  vim.cmd("Plug 'unblevable/quick-scope'")
  vim.fn["plug#end"]()
  return require("fennel/plugin-startify")
end
package.preload["fennel/colors"] = package.preload["fennel/colors"] or function(...)
  vim.g.gruvbox_inverse = 1
  vim.g.gruvbox_contrast_dark = "soft"
  vim.g.gruvbox_improved_strings = 1
  vim.g.gruvbox_invert_signs = 1
  return vim.cmd("colorscheme gruvbox")
end
package.preload["fennel/nvim"] = package.preload["fennel/nvim"] or function(...)
  return {event = {bufEnter = "BufEnter", bufLeave = "BufLeave", focusGained = "FocusGained", focusLost = "FocusLost", insertEnter = "InsertEnter", insertLeave = "InsertLeave"}, mode = {["operator-pending"] = "operator-pending", command = "command", insert = "insert", normal = "normal", visual = "visual"}}
end
local _0_ = require("fennel/nvim")
local event = _0_["event"]
local mode = _0_["mode"]
require("fennel/colors")
require("fennel/plugins")
require("fennel/options")
require("fennel/mappings")
local utils = require("utils")
local function _1_()
  vim.wo.relativenumber = true
  return nil
end
utils.autocmd("mitchellwrosen", {event.bufEnter, event.insertLeave}, "*", _1_)
local function _2_()
  vim.wo.relativenumber = false
  return nil
end
utils.autocmd("mitchellwrosen", {event.bufLeave, event.insertEnter}, "*", _2_)
do
  local default_code_action_callback = vim.lsp.callbacks["textDocument/codeAction"]
  local function _3_(x, y, actions)
    if (#actions == 1) then
      local action = actions[1]
      local command = (type(action.command) == "table")
      local edit = action.edit
      if (edit or (type(command) == "table")) then
        if edit then
          vim.lsp.util.apply_workspace_edit(edit)
        end
        if (type(command) == "table") then
          return vim.lsp.buf.execute_command(command)
        end
      else
        return vim.lsp.buf.execute_command(action)
      end
    else
      return default_code_action_callback(x, y, actions)
    end
  end
  vim.lsp.callbacks["textDocument/codeAction"] = _3_
end
local function lsp_setup()
  local completion = require("completion")
  local lsp = require("nvim_lsp")
  local status = require("lsp-status")
  status.register_progress()
  do
    local capabilities = nil
    local function _3_(config)
      assert((nil ~= config), string.format("Missing argument %s on %s:%s", "config", "fennel/init.fnl", 55))
      local x_0_ = (config.capabilities or {})
      local y_0_ = status.capabilities
      return vim.tbl_extend("keep", x_0_, y_0_)
    end
    capabilities = _3_
    local on_attach = nil
    local function _4_(client)
      assert((nil ~= client), string.format("Missing argument %s on %s:%s", "client", "fennel/init.fnl", 57))
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lca", ":lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lcr", ":lua vim.lsp.buf.clear_references<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>ldec", ":lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>ldef", ":lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lds", ":lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>d", ":lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lh", ":lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lic", ":lua vim.lsp.buf.incoming_calls()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lim", ":lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lo", ":lua vim.lsp.buf.outgoing_calls()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lref", ":lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lren", ":lua vim.lsp.buf.rename()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lsh", ":lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lsl", ":lua vim.lsp.util.show_line_diagnostics()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lt", ":lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lw", ":lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
      vim.cmd("setlocal omnifunc=v:lua.vim.lsp.omnifunc")
      completion.on_attach(client)
      return status.on_attach(client)
    end
    on_attach = _4_
    lsp.hls.setup({capabilities = capabilities(lsp.hls), init_options = {haskell = {completionSnippetsOn = true, diagnosticsOnChange = true, formatOnImportOn = true, formattingProvider = "ormolu", hlintOn = false, liquidOn = false}}, on_attach = on_attach})
    lsp.sumneko_lua.setup({capabilities = capabilities(lsp.sumneko_lua), on_attach = on_attach})
    lsp.vimls.setup({capabilities = capabilities(lsp.vimls), on_attach = on_attach})
  end
  return status.status
end
local lsp_status = lsp_setup()
local function lightline_status()
  if (#vim.lsp.buf_get_clients() > 0) then
    return lsp_status()
  else
    return ""
  end
end
local function run_floating(command)
  assert((nil ~= command), string.format("Missing argument %s on %s:%s", "command", "fennel/init.fnl", 108))
  local buf = vim.api.nvim_create_buf(false, true)
  local columns = vim.o.columns
  local lines = vim.o.lines
  local height = math.floor(((lines * 0.80000000000000004) + 0.5))
  local row = math.floor((((lines - height) / 2) + 0.5))
  local width = math.floor(((columns * 0.80000000000000004) + 0.5))
  local col = math.floor((((columns - width) / 2) + 0.5))
  local win = vim.api.nvim_open_win(buf, true, {col = col, height = height, relative = "editor", row = row, style = "minimal", width = width})
  local function _3_()
    return vim.cmd(("bw! " .. buf))
  end
  vim.fn.termopen(command, {on_exit = _3_})
  vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<Esc>", {noremap = true, nowait = true, silent = true})
  return win
end
return {lightline_status = lightline_status, run_floating = run_floating}
