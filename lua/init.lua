vim.o.autowriteall = true   --
vim.o.cursorline = true     -- higlight the current line
vim.o.expandtab = true      -- convert tabs to spaces
vim.o.hidden = true         -- don't abandon out-of-sight buffers
vim.o.ignorecase = true     -- case-insensitive searching
vim.o.lazyredraw = true     -- don't draw during e.g. applying a macro
vim.o.linebreak = true      -- wrap lines in a more visually pleasing way
vim.o.list = true           -- show trailing whitespace, tabs, etc.
vim.o.foldenable = false    -- never fold
vim.o.joinspaces = false    -- insert one space after ., ?, ! chars when joining
vim.o.modeline = false      -- disable modelines
vim.o.showmode = false      -- don't show mode, since lightline handle that
vim.o.startofline = false   -- don't jump cursor to start of line when moving
vim.o.number = true         -- show line number gutter
vim.o.relativenumber = true --
vim.o.shiftround = true     -- shift to multiple of shiftwidth
vim.o.smartcase = true      -- don't ignore case if search contains uppercase char
vim.o.smartindent = true    -- smart autoindenting when starting a new line
vim.o.termguicolors = true  --
vim.o.title = true          -- put filename in window title
vim.o.undofile = true       -- persist undo history across buffer exits
vim.o.wildmenu = true       -- complete commands with a little menu

vim.o.report = 0         -- always repeat the number of lines changed
vim.o.scrolloff = 10     -- start scrolling before the cursor reaches the edge
vim.o.shiftwidth = 2     --
vim.o.sidescrolloff = 16 -- start scrolling before the cursor reaches the edge
vim.o.synmaxcol = 180    -- dont bother syntax-highlighting past this column
vim.o.showtabline = 2    -- always show the tabline
vim.o.softtabstop = 2    -- tab key makes 2 spaces
vim.o.timeoutlen = 200   -- only wait this many ms for key sequence to complete
vim.o.updatetime = 1000  -- fire CursorHold after this many ms (default 4000ms)

vim.o.clipboard = 'unnamed,unnamedplus'         -- yank also copies to both clipboards
vim.o.completeopt = 'menuone,noinsert,noselect' -- sane completion behavior...
vim.o.grepprg = 'rg --vimgrep'                  -- use rg to grep
vim.o.inccommand = 'split'                      -- show live command substitutions
vim.o.listchars = 'tab:> ,trail:·,nbsp:+'       -- trailing whitespace markers
vim.o.signcolumn = 'yes'                        -- always draw signcolumn because it's jarring when it appears otherwise
vim.o.wildmode = 'list:longest,full'            -- wild menu completion behavior

local completion = require('completion')
local configs = require('nvim_lsp/configs')
local lsp = require('nvim_lsp')
local status = require('lsp-status')

Export = {}

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
  local function nnoremap(lhs, rhs)
    vim.fn.nvim_buf_set_keymap(0, 'n', lhs, rhs, { noremap = true, silent = true })
  end

  nnoremap('<Space>lca', ':lua vim.lsp.buf.code_action()<CR>')
  nnoremap('<Space>lcr', ':lua vim.lsp.buf.clear_references<CR>')
  nnoremap('<Space>ldec', ':lua vim.lsp.buf.declaration()<CR>')
  nnoremap('<Space>ldef', ':lua vim.lsp.buf.definition()<CR>')
  nnoremap('<Space>lds', ':lua vim.lsp.buf.document_symbol()<CR>')
  nnoremap('<Space>lh', ':lua vim.lsp.buf.hover()<CR>')
  nnoremap('<Space>lic', ':lua vim.lsp.buf.incoming_calls()<CR>')
  nnoremap('<Space>lim', ':lua vim.lsp.buf.implementation()<CR>')
  nnoremap('<Space>lo', ':lua vim.lsp.buf.outgoing_calls()<CR>')
  nnoremap('<Space>lref', ':lua vim.lsp.buf.references()<CR>')
  nnoremap('<Space>lren', ':lua vim.lsp.buf.rename()<CR>')
  nnoremap('<Space>lsh', ':lua vim.lsp.buf.signature_help()<CR>')
  nnoremap('<Space>lsl', ':lua vim.lsp.util.show_line_diagnostics()<CR>')
  nnoremap('<Space>lt', ':lua vim.lsp.buf.type_definition()<CR>')
  nnoremap('<Space>lw', ':lua vim.lsp.buf.workspace_symbol()<CR>')

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

function Export.lightline_status()
  if #vim.lsp.buf_get_clients() > 0 then
    return status.status()
  else
    return ''
  end
end

-- Run the given command in a centered floating terminal.
function Export.run_floating(command)
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

return Export
