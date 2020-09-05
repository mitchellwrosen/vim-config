local configs = require'nvim_lsp/configs'
local nvim_lsp = require'nvim_lsp'

configs.ghcide = {
  default_config = {
    cmd = { 'ghcide-wrapper', '--lsp' };
    filetypes = { 'haskell' };
    root_dir = nvim_lsp.util.root_pattern(".git", "cabal.project", "stack.yaml");
    settings = {};
  };
};

nvim_lsp.ghcide.setup {}
nvim_lsp.vimls.setup {}

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

return { run_floating = run_floating }
