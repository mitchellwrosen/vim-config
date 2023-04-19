local function file_exists(name)
  return not vim.tbl_isempty((vim.loop.fs_stat(name) or {}))
end
return {["file-exists"] = file_exists}
