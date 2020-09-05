local nvim_lsp = require'nvim_lsp'
local configs = require'nvim_lsp/configs'

configs.ghcide = {
  default_config = {
    cmd = { 'ghcide-wrapper', '--lsp' };
    filetypes = { 'haskell' };
    root_dir = nvim_lsp.util.root_pattern(".git", "cabal.project", "stack.yaml");
    settings = {};
  };
};

nvim_lsp.ghcide.setup{}
nvim_lsp.vimls.setup{}
