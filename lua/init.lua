local completion = require('completion')
local configs = require('nvim_lsp/configs')
local lsp = require('nvim_lsp')
local status = require('lsp-status')

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

local capabilities = function(config)
  return vim.tbl_extend('keep', config.capabilities or {}, status.capabilities)
end
local on_attach = function(client)
  status.on_attach(client)
  completion.on_attach(client)
end
lsp.ghcide.setup { capabilities = capabilities(lsp.ghcide), on_attach = on_attach }
lsp.sumneko_lua.setup { capabilities = capabilities(lsp.sumneko_lua), on_attach = on_attach }
lsp.vimls.setup { capabilities = capabilities(lsp.vimls), on_attach = on_attach }

local function lightline_status()
  if #vim.lsp.buf_get_clients() > 0 then
    return status.status()
  else
    return ''
  end
end

-- Run the given command in a centered floating terminal.
local function run_floating(command)
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

return { lightline_status = lightline_status, run_floating = run_floating }
