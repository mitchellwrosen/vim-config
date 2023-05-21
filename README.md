### Vim tips

### LSP debugging

1. Crank up the log level.

    ```fennel
    (vim.lsp.set_log_level "TRACE")
    ```

2. Read the logs at `(vim.lsp.get_log_path)`:

    ````
    tail -f ~/.local/state/nvim/lsp.log
    ```

### Getting stuff done in Lua with the `neovim` API

#### Concatenate an array of strings

```
:help table.concat
```

#### Escape visual mode

```fennel
(vim.api.nvim_feedkeys "\27" "xn" false)
```

#### Expand a string like `~/foo` to `/home/mitchell/foo`

```fennel
(vim.fn.expand "foo")
```

#### Get the current directory

```fennel
(vim.loop.cwd)
```

#### Get the cursor position where the current visual selection began (1,1)-indexed

```fennel
(local [_bufnum row col _off] (vim.fn.getpos "v"))
[row col]
```

#### Get the cursor position (1,0)-indexed

```fennel
(vim.api.nvim_win_get_cursor 0)
```

#### Get the word under the cursor

```fennel
(vim.fn.expand "<cword>")
```

#### Make a copy of a table

```fennel
(vim.deepcopy my-table)
```
