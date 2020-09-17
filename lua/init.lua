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
do
  vim.bo["softtabstop"] = 2
  vim.o["softtabstop"] = 2
end
vim.api.nvim_set_keymap("n", ";", ":", {noremap = true})
vim.api.nvim_set_keymap("n", ":", ";", {noremap = true})
vim.api.nvim_set_keymap("o", ";", ":", {noremap = true})
vim.api.nvim_set_keymap("o", ":", ";", {noremap = true})
vim.api.nvim_set_keymap("v", ";", ":", {noremap = true})
vim.api.nvim_set_keymap("v", ":", ";", {noremap = true})
vim.api.nvim_set_keymap("n", "r;", "r:", {noremap = true})
vim.api.nvim_set_keymap("n", "r:", "r;", {noremap = true})
vim.api.nvim_set_keymap("i", ";", ":", {noremap = true})
vim.api.nvim_set_keymap("i", ":", ";", {noremap = true})
vim.api.nvim_set_keymap("c", ":", ";", {noremap = true})
vim.api.nvim_set_keymap("c", ";", ":", {noremap = true})
vim.api.nvim_set_keymap("n", "'", "`", {noremap = true})
vim.api.nvim_set_keymap("n", "/", "/\\v", {noremap = true})
vim.api.nvim_set_keymap("v", "/", "/\\v", {noremap = true})
vim.api.nvim_set_keymap("n", "*", "*``", {noremap = true})
vim.api.nvim_set_keymap("n", "<Tab>", "<Nop>", {noremap = true})
vim.api.nvim_set_keymap("n", "<BS>", "<C-^>", {noremap = true})
local event = require("event")
local utils = require("utils")
local function _0_()
  vim.wo.relativenumber = true
  return nil
end
utils.autocmd("mitchellwrosen", {event.bufEnter, event.focusGained, event.insertLeave}, "*", _0_)
local function _1_()
  vim.wo.relativenumber = false
  return nil
end
utils.autocmd("mitchellwrosen", {event.bufLeave, event.focusLost, event.insertEnter}, "*", _1_)
local function lsp_setup()
  local completion = require("completion")
  local configs = require("nvim_lsp/configs")
  local lsp = require("nvim_lsp")
  local status = require("lsp-status")
  status.register_progress()
  configs.ghcide = {default_config = {cmd = {"ghcide-wrapper", "--lsp"}, filetypes = {"haskell"}, root_dir = lsp.util.root_pattern(".git", "cabal.project", "stack.yaml"), settings = {}}}
  do
    local capabilities = nil
    local function _2_(config)
      assert((nil ~= config), ("Missing argument %s on %s:%s"):format("config", "fennel/init.fnl", 181))
      return vim.tbl_extend("keep", (config.capabilities or {}), status.capabilities)
    end
    capabilities = _2_
    local on_attach = nil
    local function _3_(client)
      assert((nil ~= client), ("Missing argument %s on %s:%s"):format("client", "fennel/init.fnl", 183))
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lca", ":lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lcr", ":lua vim.lsp.buf.clear_references<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>ldec", ":lua vim.lsp.buf.declaration()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>ldef", ":lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
      vim.api.nvim_buf_set_keymap(0, "n", "<Space>lds", ":lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
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
    on_attach = _3_
    lsp.ghcide.setup({capabilities = capabilities(lsp.ghcide), on_attach = on_attach})
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
  assert((nil ~= command), ("Missing argument %s on %s:%s"):format("command", "fennel/init.fnl", 221))
  local buf = vim.api.nvim_create_buf(false, true)
  local columns = vim.o.columns
  local lines = vim.o.lines
  local height = math.floor(((lines * 0.80000000000000004) + 0.5))
  local row = math.floor((((lines - height) / 2) + 0.5))
  local width = math.floor(((columns * 0.80000000000000004) + 0.5))
  local col = math.floor((((columns - width) / 2) + 0.5))
  local win = vim.api.nvim_open_win(buf, true, {col = col, height = height, relative = "editor", row = row, style = "minimal", width = width})
  local function _2_()
    return vim.cmd(("bw! " .. buf))
  end
  vim.fn.termopen(command, {on_exit = _2_})
  vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<Esc>", {noremap = true, nowait = true, silent = true})
  return win
end
return {lightline_status = lightline_status, run_floating = run_floating}
