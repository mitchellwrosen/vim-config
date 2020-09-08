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
