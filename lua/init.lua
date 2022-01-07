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
  vim.api.nvim_set_keymap("n", "<Space>s", "m`vip<Esc>:silent '<,'>w !repld-send --no-echo<CR>``", {silent = true})
  vim.api.nvim_set_keymap("n", "<Space>S", "m`:silent w !repld-send<CR>``", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("v", "<Space>s", "m`<Esc>:silent '<,'>w !repld-send<CR>``", {noremap = true, silent = true})
  vim.api.nvim_set_keymap("i", "<C-v>", "<C-r>*", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-h>", "<Left>", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-j>", "<Down>", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-k>", "<Up>", {noremap = true})
  vim.api.nvim_set_keymap("c", "<C-l>", "<Right>", {noremap = true})
  vim.api.nvim_set_keymap("i", "<Tab>", "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"", {expr = true, noremap = true})
  return vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? \"\\<C-y>\" : \"\\<CR>\"", {expr = true, noremap = true})
end
package.preload["fennel/nvim"] = package.preload["fennel/nvim"] or function(...)
  local event = {["after-read"] = "BufReadPost", ["after-yank"] = "TextYankPost", bufEnter = "BufEnter", bufLeave = "BufLeave", ["before-write"] = "BufWritePre", ["cursor-hold"] = "CursorHold", ["cursor-moved"] = "CursorMoved", ["focus-gained"] = "FocusGained", focusLost = "FocusLost", insertEnter = "InsertEnter", ["leave-insert-mode"] = "InsertLeave", ["text-changed"] = "TextChanged"}
  local mode = {command = "command", insert = "insert", normal = "normal", ["operator-pending"] = "operator-pending", visual = "visual"}
  local n = 0
  local lambdas = {}
  local function register_lambda(f)
    _G.assert((nil ~= f), "Missing argument f on ./fennel/nvim.fnl:26")
    local name = ("f" .. tostring(n))
    do end (lambdas)[name] = f
    n = (n + 1)
    return name
  end
  local function autocmd(group, events, pattern, f)
    _G.assert((nil ~= f), "Missing argument f on ./fennel/nvim.fnl:33")
    _G.assert((nil ~= pattern), "Missing argument pattern on ./fennel/nvim.fnl:33")
    _G.assert((nil ~= events), "Missing argument events on ./fennel/nvim.fnl:33")
    _G.assert((nil ~= group), "Missing argument group on ./fennel/nvim.fnl:33")
    local name = register_lambda(f)
    return vim.cmd(("autocmd " .. group .. " " .. table.concat(events, ",") .. " " .. pattern .. " lua require('fennel/nvim').lambdas." .. name .. "()"))
  end
  local function buf_map_fn(modes, lhs, f, opts)
    _G.assert((nil ~= opts), "Missing argument opts on ./fennel/nvim.fnl:47")
    _G.assert((nil ~= f), "Missing argument f on ./fennel/nvim.fnl:47")
    _G.assert((nil ~= lhs), "Missing argument lhs on ./fennel/nvim.fnl:47")
    _G.assert((nil ~= modes), "Missing argument modes on ./fennel/nvim.fnl:47")
    local name = register_lambda(f)
    for _, mode0 in ipairs(modes) do
      vim.api.nvim_buf_set_keymap(0, modes[1], lhs, (":lua require('fennel/nvim').lambdas." .. name .. "()<CR>"), opts)
    end
    return nil
  end
  local function overwrite_buffer(s)
    _G.assert((nil ~= s), "Missing argument s on ./fennel/nvim.fnl:53")
    if vim.bo.modifiable then
      local w = vim.fn.winsaveview()
      vim.api.nvim_buf_set_lines(0, 0, -1, false, s)
      return vim.fn.winrestview(w)
    else
      return print("Cannot write to non-modifiable buffer")
    end
  end
  local function sys_format_buffer(program)
    _G.assert((nil ~= program), "Missing argument program on ./fennel/nvim.fnl:61")
    local output = vim.fn.system((program .. " " .. vim.api.nvim_buf_get_name(0)))
    if (vim.v.shell_error == 0) then
      overwrite_buffer(vim.fn.split(output, "\n"))
      return vim.cmd("update")
    else
      return nil
    end
  end
  return {autocmd = autocmd, ["buf-map-fn"] = buf_map_fn, event = event, lambdas = lambdas, mode = mode, ["sys-format-buffer"] = sys_format_buffer}
end
local _local_1_ = require("fennel/nvim")
local autocmd = _local_1_["autocmd"]
local event = _local_1_["event"]
vim.api.nvim_set_keymap("o", "s", "<Plug>Lightspeed_s", {})
vim.api.nvim_set_keymap("o", "S", "<Plug>Lightspeed_S", {})
do
  vim.api.nvim_set_keymap("n", "f", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_f' : 'f'", {expr = true})
  vim.api.nvim_set_keymap("o", "f", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_f' : 'f'", {expr = true})
  vim.api.nvim_set_keymap("v", "f", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_f' : 'f'", {expr = true})
end
do
  vim.api.nvim_set_keymap("n", "F", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_F' : 'F'", {expr = true})
  vim.api.nvim_set_keymap("o", "F", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_F' : 'F'", {expr = true})
  vim.api.nvim_set_keymap("v", "F", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_F' : 'F'", {expr = true})
end
do
  vim.api.nvim_set_keymap("n", "t", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_t' : 't'", {expr = true})
  vim.api.nvim_set_keymap("o", "t", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_t' : 't'", {expr = true})
  vim.api.nvim_set_keymap("v", "t", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_t' : 't'", {expr = true})
end
do
  vim.api.nvim_set_keymap("n", "T", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_T' : 'T'", {expr = true})
  vim.api.nvim_set_keymap("o", "T", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_T' : 'T'", {expr = true})
  vim.api.nvim_set_keymap("v", "T", "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_T' : 'T'", {expr = true})
end
vim.fn["plug#begin"]((vim.fn.stdpath("data") .. "/plugged"))
vim.cmd("Plug 'lukas-reineke/indent-blankline.nvim', { 'commit': '0f8df7e43f0cae4c44e0e8383436ad602f333419' }")
vim.cmd("Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }")
vim.cmd("Plug 'folke/trouble.nvim', { 'commit': '20469be985143d024c460d95326ebeff9971d714' }")
vim.cmd("Plug 'ggandor/lightspeed.nvim', { 'commit': '9fddb6ebf4007eaa26f44cd31b5140cbd3bbb820' }")
vim.cmd("Plug 'itchyny/lightline.vim', { 'commit': 'a29b8331e1bb36b09bafa30c3aa77e89cdd832b2' }")
vim.cmd("Plug 'junegunn/fzf'")
vim.cmd("Plug 'junegunn/fzf.vim'")
vim.cmd("Plug 'kevinhwang91/nvim-bqf', { 'commit': '46e6469fb1ef90d475fb43c56e0eeb81eacf08dd' }")
vim.cmd("Plug 'mengelbrecht/lightline-bufferline'")
vim.cmd("Plug 'mhinz/vim-startify'")
vim.cmd("Plug 'neovim/nvim-lsp'")
vim.cmd("Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }")
vim.cmd("Plug 'nvim-lua/completion-nvim'")
vim.cmd("Plug 'nvim-lua/plenary.nvim', { 'commit': '8bae2c1fadc9ed5bfcfb5ecbd0c0c4d7d40cb974' }")
vim.cmd("Plug 'nvim-lua/popup.nvim', { 'commit': '5e3bece7b4b4905f4ec89bee74c09cfd8172a16a' }")
vim.cmd("Plug 'nvim-lua/lsp-status.nvim'")
vim.cmd("Plug 'nvim-telescope/telescope.nvim', { 'commit': '5b597e7709eec08331ce71b45193117f6fb5626b' }")
vim.cmd("Plug 'rhysd/git-messenger.vim'")
vim.cmd("Plug 'romainl/vim-cool'")
vim.cmd("Plug 'romainl/vim-qf'")
vim.cmd("Plug 'terryma/vim-multiple-cursors'")
vim.cmd("Plug 'tommcdo/vim-exchange'")
vim.cmd("Plug 'tpope/vim-characterize'")
vim.cmd("Plug 'tpope/vim-commentary'")
vim.cmd("Plug 'tpope/vim-fugitive'")
vim.cmd("Plug 'tpope/vim-repeat'")
vim.cmd("Plug 'tpope/vim-surround'")
vim.fn["plug#end"]()
vim.g.gruvbox_inverse = 1
vim.g.gruvbox_contrast_dark = "soft"
vim.g.gruvbox_improved_strings = 1
vim.g.gruvbox_invert_signs = 1
vim.cmd("colorscheme gruvbox")
vim.g.completion_enable_auto_popup = 1
vim.g.completion_matching_ignore_case = 1
do
  local trouble = require("trouble")
  trouble.setup({icons = false, position = "right"})
end
vim.g.startify_custom_footer = {"   [e]  empty buffer", "   [q]  quit"}
vim.g.startify_custom_header = {}
vim.g.startify_custom_indices = {"a", "s", "d", "f", "l", "g", "h", "w", "r", "u", "o", "p", "t", "y", "z", "x", "c", "v", "m", "", ".", "/", "b", "n", "1", "2", "3", "4", "5", "6"}
vim.g.startify_enable_special = 0
vim.g.startify_enable_unsafe = 1
vim.g.startify_change_to_dir = 0
vim.g.startify_files_number = 30
vim.g.startify_lists = {{type = "files"}}
vim.g.startify_relative_path = 1
vim.g.haskell_enable_backpack = 1
vim.g.haskell_enable_pattern_synonyms = 1
vim.g.haskell_enable_quantification = 1
vim.g.haskell_enable_recursivedo = 1
vim.g.haskell_enable_static_pointers = 1
vim.g.haskell_enable_typeroles = 1
vim.g.haskell_indent_disable = 1
do
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  telescope.setup({defaults = {mappings = {i = {["<C-n>"] = false, ["<C-p>"] = false, ["<C-j>"] = actions.move_selection_next, ["<C-k>"] = actions.move_selection_previous, ["<Esc>"] = actions.close}}}})
end
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
require("fennel/mappings")
vim.cmd("augroup mitchellwrosen\nautocmd!\naugroup END")
local function _4_()
  vim.bo.modifiable = not vim.bo.readonly
  return nil
end
autocmd("mitchellwrosen", {event["after-read"]}, "*", _4_)
local function _5_()
  return vim.highlight.on_yank({higroup = "Visual", timeout = 600})
end
autocmd("mitchellwrosen", {event["after-yank"]}, "* silent!", _5_)
local function _6_()
  if (vim.fn.getcmdwintype() == "") then
    return vim.cmd("checktime")
  else
    return nil
  end
end
autocmd("mitchellwrosen", {event["cursor-hold"], event["focus-gained"]}, "?*", _6_)
local function _8_()
  if ((vim.o.buftype == "") and (vim.api.nvim_buf_get_name(0) ~= "")) then
    return vim.cmd("silent! update")
  else
    return nil
  end
end
autocmd("mitchellwrosen", {event["leave-insert-mode"], event["text-changed"]}, "*", _8_)
do
  local completion = require("completion")
  local lsp = require("lspconfig")
  local status = require("lsp-status")
  local capabilities
  local function _10_(config)
    _G.assert((nil ~= config), "Missing argument config on fennel/init.fnl:231")
    local x_1_auto = (config.capabilities or {})
    local y_2_auto = status.capabilities
    return vim.tbl_extend("keep", x_1_auto, y_2_auto)
  end
  capabilities = _10_
  local on_attach
  local function _11_(client, buf)
    _G.assert((nil ~= buf), "Missing argument buf on fennel/init.fnl:234")
    _G.assert((nil ~= client), "Missing argument client on fennel/init.fnl:234")
    vim.cmd("augroup mitchellwrosenLsp\nautocmd!\naugroup END")
    local function _12_()
      return vim.lsp.buf.formatting_sync(nil, 1000)
    end
    autocmd("mitchellwrosenLsp", {event["before-write"], event["leave-insert-mode"]}, "<buffer>", _12_)
    vim.cmd("highlight LspReference guifg=NONE guibg=#665c54 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59")
    vim.cmd("highlight! link LspReferenceText LspReference")
    vim.cmd("highlight! link LspReferenceRead LspReference")
    vim.cmd("highlight! link LspReferenceWrite LspReference")
    vim.api.nvim_buf_set_keymap(buf, "n", "<Space>a", ":lua vim.lsp.buf.code_action()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "gd", ":lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "<Space>d", ":lua vim.lsp.buf.formatting()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "<Enter>", ":lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "<Up>", ":lua vim.diagnostic.goto_prev()<CR>", {noremap = true, silent = true})
    vim.api.nvim_buf_set_keymap(buf, "n", "<Down>", ":lua vim.diagnostic.goto_next()<CR>", {noremap = true, silent = true})
    vim.bo.omnifunc = "v:lua.vim.lsp.omnifunc"
    local meaningful_head
    local function _13_(lines)
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
    meaningful_head = _13_
    local filter
    do
      local _15_ = vim.bo.filetype
      if (_15_ == "haskell") then
        local function _16_(line)
          if (-1 == vim.fn.match(line, "::")) then
            return ""
          else
            return line
          end
        end
        filter = _16_
      elseif true then
        local _ = _15_
        local function _18_(line)
          return line
        end
        filter = _18_
      else
        filter = nil
      end
    end
    local function _20_()
      if (vim.api.nvim_get_mode().mode == "n") then
        local position = vim.lsp.util.make_position_params()
        vim.lsp.buf.clear_references()
        vim.lsp.buf.document_highlight()
        vim.diagnostic.open_float()
        local function _21_(_err, result, _ctx, _config)
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
        return vim.lsp.buf_request(0, "textDocument/hover", position, _21_)
      else
        return nil
      end
    end
    autocmd("mitchellwrosenLsp", {event["cursor-moved"]}, "<buffer>", _20_)
    completion.on_attach(client)
    return status.on_attach(client)
  end
  on_attach = _11_
  status.register_progress()
  vim.diagnostic.config({float = {scope = "cursor", header = ""}, underline = {severity = vim.diagnostic.severity.ERROR}, virtual_text = false})
  local function _25_(client)
    _G.assert((nil ~= client), "Missing argument client on fennel/init.fnl:336")
    if client.config.flags then
      client.config.flags.allow_incremental_sync = true
    else
    end
    return on_attach(client)
  end
  lsp.elmls.setup({capabilities = capabilities(lsp.elmls), on_attach = _25_})
  lsp.hls.setup({capabilities = capabilities(lsp.hls), cmd = {"haskell-language-server-wrapper", "--lsp"}, settings = {haskell = {formattingProvider = "ormolu", plugin = {hlint = {globalOn = false}}, maxCompletions = 20}}, on_attach = on_attach})
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
  _G.assert((nil ~= command), "Missing argument command on fennel/init.fnl:370")
  local buf = vim.api.nvim_create_buf(false, true)
  local columns = vim.o.columns
  local lines = vim.o.lines
  local height = math.floor(((lines * 0.8) + 0.5))
  local row = math.floor((((lines - height) / 2) + 0.5))
  local width = math.floor(((columns * 0.8) + 0.5))
  local col = math.floor((((columns - width) / 2) + 0.5))
  local win = vim.api.nvim_open_win(buf, true, {col = col, height = height, relative = "editor", row = row, style = "minimal", width = width})
  local function _28_()
    return vim.cmd(("bw! " .. buf))
  end
  vim.fn.termopen(command, {on_exit = _28_})
  vim.api.nvim_buf_set_keymap(buf, "t", "<Esc>", "<Esc>", {noremap = true, nowait = true, silent = true})
  return win
end
return {lightline_status = lightline_status, run_floating = run_floating, virtual_hover = __fnl_global__virtual_2dhover}
