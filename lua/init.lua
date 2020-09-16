------------------------------------------------------------------------------------------------------------------------
-- Plugins
------------------------------------------------------------------------------------------------------------------------

vim.fn['plug#begin'](vim.fn.stdpath('data') .. '/plugged')

vim.cmd("Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }")           --
vim.cmd("Plug 'Yggdroot/indentLine'")                                -- show markers every 2 columns of leading whitespace
vim.cmd("Plug 'godlygeek/tabular'")                                  -- align on words
vim.cmd("Plug 'itchyny/lightline.vim'")                              --
vim.cmd("Plug 'junegunn/fzf.vim'")                                   -- fuzzy search source code, files, etc
vim.cmd("Plug 'liuchengxu/vim-which-key'")                           -- thingy to tell me my own hotkeys (requires manual work)
vim.cmd("Plug 'mengelbrecht/lightline-bufferline'")                  --
vim.cmd("Plug 'mhinz/vim-startify'")                                 -- startup screen
vim.cmd("Plug 'neovim/nvim-lsp'")                                    --
vim.cmd("Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }")    --
vim.cmd("Plug 'nvim-lua/completion-nvim'")                           --
vim.cmd("Plug 'nvim-lua/lsp-status.nvim'")                           --
vim.cmd("Plug 'rhysd/git-messenger.vim'")                            -- git blame the line under the cursor
vim.cmd("Plug 'romainl/vim-cool'")                                   -- automatically unhighlight when cursor moves
vim.cmd("Plug 'romainl/vim-qf'")                                     -- vim quickfix improvements
vim.cmd("Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }") -- show colored pips by #abcdef things
vim.cmd("Plug 'rrethy/vim-illuminate'")                              -- highlight occurrences of the word under the cursor
vim.cmd("Plug 'sdiehl/vim-ormolu', { 'for': 'haskell' }")            --
vim.cmd("Plug 'terryma/vim-multiple-cursors'")                       -- multiple cursors for quick and dirty renaming
vim.cmd("Plug 'tommcdo/vim-exchange'")                               -- swap the location of two selections
vim.cmd("Plug 'tpope/vim-characterize'")                             -- improved "ga"
vim.cmd("Plug 'tpope/vim-commentary'")                               -- quick (un-)commenting
vim.cmd("Plug 'tpope/vim-fugitive'")                                 --
vim.cmd("Plug 'tpope/vim-repeat'")                                   -- make "." repeat more things out of the box
vim.cmd("Plug 'tpope/vim-surround'")                                 -- some surround helpers
vim.cmd("Plug 'unblevable/quick-scope'")                             -- highlight characters for f, F, t, T

-- Cool stuff in here but it defines way too many bindings for me and it
-- doesn't seem easy to disable them all and customize the ones I do want
-- Plug 'wellle/targets.vim'

vim.fn['plug#end']()

------------------------------------------------------------------------------------------------------------------------
-- Options
------------------------------------------------------------------------------------------------------------------------

vim.o.autowriteall = true   --
vim.o.hidden = true         -- don't abandon out-of-sight buffers
vim.o.ignorecase = true     -- case-insensitive searching
vim.o.lazyredraw = true     -- don't draw during e.g. applying a macro
vim.o.joinspaces = false    -- insert one space after ., ?, ! chars when joining
vim.o.showmode = false      -- don't show mode, since lightline handle that
vim.o.startofline = false   -- don't jump cursor to start of line when moving
vim.o.shiftround = true     -- shift to multiple of shiftwidth
vim.o.smartcase = true      -- don't ignore case if search contains uppercase char
vim.o.termguicolors = true  --
vim.o.title = true          -- put filename in window title
vim.o.wildmenu = true       -- complete commands with a little menu

vim.o.report = 0         -- always repeat the number of lines changed
vim.o.scrolloff = 10     -- start scrolling before the cursor reaches the edge
vim.o.sidescrolloff = 16 -- start scrolling before the cursor reaches the edge
vim.o.showtabline = 2    -- always show the tabline
vim.o.timeoutlen = 400   -- only wait this many ms for key sequence to complete
vim.o.updatetime = 300   -- fire CursorHold after this many ms (default 4000ms)

vim.o.clipboard = 'unnamed,unnamedplus'         -- yank also copies to both clipboards
vim.o.completeopt = 'menuone,noinsert,noselect' -- sane completion behavior...
vim.o.grepprg = 'rg --vimgrep'                  -- use rg to grep
vim.o.inccommand = 'split'                      -- show live command substitutions
vim.o.listchars = 'tab:> ,trail:·,nbsp:+'       -- trailing whitespace markers
vim.o.wildmode = 'list:longest,full'            -- wild menu completion behavior

vim.wo.cursorline = true     -- higlight the current line
vim.wo.linebreak = true      -- wrap lines in a more visually pleasing way
vim.wo.list = true           -- show trailing whitespace, tabs, etc.
vim.wo.foldenable = false    -- never fold
vim.wo.number = true         -- show line number gutter

vim.wo.signcolumn = 'yes' -- always draw signcolumn because it's jarring when it appears otherwise

vim.bo.expandtab = true   -- convert tabs to spaces
vim.o.expandtab = true
vim.bo.modeline = false   -- disable modelines
vim.o.modeline = false
vim.bo.smartindent = true -- smart autoindenting when starting a new line
vim.o.smartindent = true
vim.bo.undofile = true    -- persist undo history across buffer exits
vim.o.undofile = true

vim.bo.shiftwidth = 2  --
vim.o.shiftwidth = 2
vim.bo.synmaxcol = 180 -- dont bother syntax-highlighting past this column
vim.o.synmaxcol = 180
vim.bo.softtabstop = 2
vim.o.softtabstop = 2

------------------------------------------------------------------------------------------------------------------------
-- Mappings
------------------------------------------------------------------------------------------------------------------------

local utils = require('utils')

-- Swap : and ;
utils.nmap(";", ":", { noremap = true })
utils.nmap(":", ";", { noremap = true })
utils.omap(";", ":", { noremap = true })
utils.omap(":", ";", { noremap = true })
utils.vmap(";", ":", { noremap = true })
utils.vmap(":", ";", { noremap = true })
utils.nmap("r;", "r:", { noremap = true })
utils.nmap("r:", "r;", { noremap = true })
utils.imap(";", ":", { noremap = true })
utils.imap(":", ";", { noremap = true })
utils.cmap(":", ";", { noremap = true })
utils.cmap(";", ":", { noremap = true })

-- make ' jump back to mark's exact position, not just line
utils.nmap("'", '`', { noremap = true })

-- very magic mode search
utils.nmap('/', '/\\v', { noremap = true })
utils.vmap('/', '/\\v', { noremap = true })

-- Don't highlight matches *and* jump at the same time; only highlight
utils.nmap('*', '*``', { noremap = true })

-- Wean myself off tab for now... hm, find a use for this.
utils.nmap('<Tab>', '<Nop>', { noremap = true })

-- Backspace to switch to the previously edited buffer
utils.nmap('<BS>', '<C-^>', { noremap = true })


local event = require('event')

utils.autocmd(
  'mitchellwrosen',
  { event.bufEnter, event.focusGained, event.insertLeave },
  '*',
  function()
    vim.wo.relativenumber = true
  end
)

utils.autocmd(
  'mitchellwrosen',
  { event.bufLeave, event.focusLost, event.insertEnter },
  '*',
  function()
    vim.wo.relativenumber = false
  end
)

local completion = require('completion')
local configs = require('nvim_lsp/configs')
local lsp = require('nvim_lsp')
local status = require('lsp-status')
local utils = require('utils')

local export = {}

-- Uh, just kind of following https://github.com/nvim-lua/lsp-status.nvim here...
status.register_progress()

configs.ghcide = {
  default_config = {
    cmd = { 'ghcide-wrapper', '--lsp' };
    filetypes = { 'haskell' };
    root_dir = lsp.util.root_pattern(".git", "cabal.project", "stack.yaml");
    settings = {};
  };
};

local function capabilities(config)
  return vim.tbl_extend('keep', config.capabilities or {}, status.capabilities)
end

local function on_attach(client)
  utils.buf_nnoremap('<Space>lca', ':lua vim.lsp.buf.code_action()<CR>')
  utils.buf_nnoremap('<Space>lcr', ':lua vim.lsp.buf.clear_references<CR>')
  utils.buf_nnoremap('<Space>ldec', ':lua vim.lsp.buf.declaration()<CR>')
  utils.buf_nnoremap('<Space>ldef', ':lua vim.lsp.buf.definition()<CR>')
  utils.buf_nnoremap('<Space>lds', ':lua vim.lsp.buf.document_symbol()<CR>')
  utils.buf_nnoremap('<Space>lh', ':lua vim.lsp.buf.hover()<CR>')
  utils.buf_nnoremap('<Space>lic', ':lua vim.lsp.buf.incoming_calls()<CR>')
  utils.buf_nnoremap('<Space>lim', ':lua vim.lsp.buf.implementation()<CR>')
  utils.buf_nnoremap('<Space>lo', ':lua vim.lsp.buf.outgoing_calls()<CR>')
  utils.buf_nnoremap('<Space>lref', ':lua vim.lsp.buf.references()<CR>')
  utils.buf_nnoremap('<Space>lren', ':lua vim.lsp.buf.rename()<CR>')
  utils.buf_nnoremap('<Space>lsh', ':lua vim.lsp.buf.signature_help()<CR>')
  utils.buf_nnoremap('<Space>lsl', ':lua vim.lsp.util.show_line_diagnostics()<CR>')
  utils.buf_nnoremap('<Space>lt', ':lua vim.lsp.buf.type_definition()<CR>')
  utils.buf_nnoremap('<Space>lw', ':lua vim.lsp.buf.workspace_symbol()<CR>')

  -- vim.cmd [[ autocmd BufEnter,BufWritePost <buffer> ]] .. [[:lua require('lsp_extensions.inlay_hints').request ]] .. [[{aligned = true, prefix = " > "}]]

  vim.cmd "setlocal omnifunc=v:lua.vim.lsp.omnifunc"

  status.on_attach(client)
  completion.on_attach(client)
end

lsp.ghcide.setup {
  capabilities = capabilities(lsp.ghcide),
  on_attach = on_attach
}
lsp.sumneko_lua.setup { capabilities = capabilities(lsp.sumneko_lua), on_attach = on_attach }
lsp.vimls.setup { capabilities = capabilities(lsp.vimls), on_attach = on_attach }

function export.lightline_status()
  if #vim.lsp.buf_get_clients() > 0 then
    return status.status()
  else
    return ''
  end
end

-- Run the given command in a centered floating terminal.
function export.run_floating(command)
  local buf = vim.api.nvim_create_buf(false, true)
  local columns = vim.o['columns']
  local lines = vim.o['lines']

  local height = math.floor(lines * 0.8 + 0.5)
  local row = math.floor((lines - height) / 2 + 0.5)
  local width = math.floor(columns * 0.8 + 0.5)
  local col = math.floor((columns - width) / 2 + 0.5)

  local win =
    vim.api.nvim_open_win(
      buf,
      true,
      {
        col = col,
        height = height,
        relative = 'editor',
        row = row,
        style = 'minimal',
        width = width
      }
    )

  vim.fn['termopen'](command, { on_exit = function() vim.cmd('bw! ' .. buf) end })

  -- Awkward, undo the remapping of <Esc> to <C-\><C-n> in init.vim
  vim.api.nvim_buf_set_keymap(buf, 't', '<Esc>', '<Esc>', { nowait = true, noremap = true, silent = true })

  return win
end

return export
