## Vim tips

## Getting stuff done in Lua with the `neovim` API

### Expand a string like `~/foo` to `/home/mitchell/foo`

```fennel
(vim.fn.expand "foo")
```

### Get the current directory

```fennel
(vim.loop.cwd)
```

### Get the word under the cursor

```fennel
(vim.fn.expand "<cword>")
```
