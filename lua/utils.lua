local export = {}

local lambdaN = 0
Lambda = {}

-- autocmd : string -> list string -> string -> vim () -> vim ()
function export.autocmd(group, events, pattern, f)
  local name = 'lambda' .. tostring(lambdaN)
  Lambda[name] = f
  lambdaN = lambdaN + 1

  vim.cmd('autocmd ' .. group .. ' ' .. table.concat(events, ',') .. ' ' .. pattern .. ' lua Lambda.' .. name .. '()')
end

function export.buf_nnoremap(lhs, rhs)
  vim.api.nvim_buf_set_keymap(0, 'n', lhs, rhs, { noremap = true, silent = true })
end

function export.buf_nnoremap_func(lhs, rhs)
  local name = 'lambda' .. tostring(lambdaN)
  Lambda[name] = rhs
  lambdaN = lambdaN + 1

  vim.api.nvim_buf_set_keymap(0, 'n', lhs, ':lua Lambda.' .. name .. '()<CR>', { noremap = true, silent = true })
end

local function overwrite_buffer(contents)
  if vim.bo.modifiable then
    local w = vim.fn.winsaveview()
    vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.fn.split(contents, '\n'))
    vim.fn.winrestview(w)
  else
    print('Cannot write to non-modifiable buffer')
  end
end

-- autoformat : string -> vim ()
function export.format_buffer(program)
  local output = vim.fn.system(program .. ' ' .. vim.api.nvim_buf_get_name(0))
  if vim.v.shell_error == 0 then
    overwrite_buffer(output)
    vim.cmd("update")
  end
end

function export.cmap(lhs, rhs, opts)
  vim.api.nvim_set_keymap('c', lhs, rhs, opts)
end

function export.imap(lhs, rhs, opts)
  vim.api.nvim_set_keymap('i', lhs, rhs, opts)
end

function export.nmap(lhs, rhs, opts)
  vim.api.nvim_set_keymap('n', lhs, rhs, opts)
end

function export.omap(lhs, rhs, opts)
  vim.api.nvim_set_keymap('o', lhs, rhs, opts)
end

function export.vmap(lhs, rhs, opts)
  vim.api.nvim_set_keymap('v', lhs, rhs, opts)
end

return export
