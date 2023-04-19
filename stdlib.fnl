(fn file-exists [name]
  (not (vim.tbl_isempty (or (vim.loop.fs_stat name) {})))
)

{ : file-exists }
