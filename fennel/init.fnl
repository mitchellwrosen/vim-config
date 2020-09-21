(local { "event" event "mode" mode } (include "fennel/nvim"))

(include "fennel/plugins")
(include "fennel/options")

(macro map [mode lhs rhs]
  `(vim.api.nvim_set_keymap ,mode ,lhs ,rhs {}))

(macro noremap [mode lhs rhs]
  `(vim.api.nvim_set_keymap ,mode ,lhs ,rhs { "noremap" true }))

(macro cnoremap [lhs rhs]
  `(noremap "c" ,lhs ,rhs))

(macro inoremap [lhs rhs]
  `(noremap "i" ,lhs ,rhs))

(macro nmap [lhs rhs]
  `(map "n" ,lhs ,rhs))

(macro nnoremap [lhs rhs]
  `(noremap "n" ,lhs ,rhs))

(macro nnoremap-expr [lhs rhs]
  `(vim.api.nvim_set_keymap "n" ,lhs ,rhs { "expr" true "noremap" true }))

(macro nnoremap-expr-silent [lhs rhs]
  `(vim.api.nvim_set_keymap "n" ,lhs ,rhs { "expr" true "noremap" true "silent" true }))

(macro onoremap [lhs rhs]
  `(noremap "o" ,lhs ,rhs))

(macro vnoremap [lhs rhs]
  `(noremap "v" ,lhs ,rhs))

(macro buf-nnoremap-silent [lhs rhs]
  `(vim.api.nvim_buf_set_keymap 0 "n" ,lhs ,rhs { "noremap" true "silent" true }))

; Swap : and ;
(nnoremap ";" ":")
(nnoremap ":" ";")
(onoremap ";" ":")
(onoremap ":" ";")
(vnoremap ";" ":")
(vnoremap ":" ";")
(nnoremap "r;" "r:")
(nnoremap "r:" "r;")
(inoremap ";" ":")
(inoremap ":" ";")
(cnoremap ":" ";")
(cnoremap ";" ":")

; make ' jump back to mark's exact position, not just line
(nnoremap "'" "`")

; very magic mode search
(nnoremap "/" "/\\v")
(vnoremap "/" "/\\v")

; Don't highlight matches *and* jump at the same time; only highlight
(nnoremap "*" "*``")

; Wean myself off tab for now... hm, find a use for this.
(nnoremap "<Tab>" "<Nop>")

; Backspace to switch to the previously edited buffer
(nnoremap "<BS>" "<C-^>")

; Prevent the cursor from jumping past a wrapped line when moving up and down
(nnoremap "j" "gj")
(nnoremap "k" "gk")

; HJKL to move around the file.
(nmap "J" "5j")
(nmap "K" "5k")
(vnoremap "J" "5j")
(vnoremap "K" "5k")
(nnoremap "H" "^")
(nnoremap "L" "$")
(onoremap "H" "^")
(onoremap "L" "$")
(vnoremap "H" "^")
(vnoremap "L" "g_")

; Make Y yank to the end of line, similar to how C and D behave
(nnoremap "Y" "y$")

; After visual mode delete/yank, leave cursor at the end of the highlight
(vnoremap "D" "d`>")
(vnoremap "Y" "y`>")

; Select last changed or yanked area
(nnoremap-expr "gV" "'`[' . strpart(getregtype(), 0, 1) . '`]'")

; U to redo. <C-r> comes from some plugin, maybe vim-repeat? (annoying)
(nnoremap "U" "<C-r>")
; Weaning myself of <C-R> to redo
(nnoremap "<C-r>" "<Nop>")

; Refactor word under cursor
; nnoremap c* /\<<C-r>=expand('<cWORD>')<CR>\>\C<CR>``cgn
; nnoremap c# ?\<<C-r>=expand('<cWORD>')<CR>\>\C<CR>``cgN

; Center after every search movement
(nnoremap "n" "nzz")
(nnoremap "N" "Nzz")
(vnoremap "n" "nzz")
(vnoremap "N" "Nzz")

; q to quit the current buffer, or quit vim if there's only 1 listed buffer
(nnoremap-expr-silent "q" "len(getbufinfo({'buflisted': 1})) ==? 1 ? \":q\\<CR>\" : \":bd\\<CR>\"")

; Disable annoying command search 'q:' that I never use
; (nnoremap "q:" "<Nop>")

; ,q to record a macro
(nnoremap ",q" "q")

; Q to apply macro recorded into q
(nnoremap "Q" "@q")

(local utils (require "utils"))

(macro autocmd [events pattern action]
  `(utils.autocmd "mitchellwrosen" ,events ,pattern ,action))

(autocmd [event.bufEnter event.insertLeave] "*" (lambda [] (set vim.wo.relativenumber true)))
(autocmd [event.bufLeave event.insertEnter] "*" (lambda [] (set vim.wo.relativenumber false)))

(fn lsp-setup []
  (let
    [completion (require "completion")
     configs    (require "nvim_lsp/configs")
     lsp        (require "nvim_lsp")
     status     (require "lsp-status")]

    ; Uh, just kind of following https://github.com/nvim-lua/lsp-status.nvim here...
    (status.register_progress)

    (set
      configs.ghcide
      { "default_config"
        { "cmd" [ "ghcide-wrapper" "--lsp" ]
          "filetypes" [ "haskell" ]
          "root_dir" (lsp.util.root_pattern ".git" "cabal.project" "stack.yaml")
          "settings" {}
        }
      }
    )

    (let
      [ capabilities (lambda [config] (vim.tbl_extend "keep" (or config.capabilities {}) status.capabilities))
        on-attach
          (lambda [client]
            (buf-nnoremap-silent "<Space>lca" ":lua vim.lsp.buf.code_action()<CR>")
            (buf-nnoremap-silent "<Space>lcr" ":lua vim.lsp.buf.clear_references<CR>")
            (buf-nnoremap-silent "<Space>ldec" ":lua vim.lsp.buf.declaration()<CR>")
            (buf-nnoremap-silent "<Space>ldef" ":lua vim.lsp.buf.definition()<CR>")
            (buf-nnoremap-silent "<Space>lds" ":lua vim.lsp.buf.document_symbol()<CR>")
            (buf-nnoremap-silent "<Space>lh" ":lua vim.lsp.buf.hover()<CR>")
            (buf-nnoremap-silent "<Space>lic" ":lua vim.lsp.buf.incoming_calls()<CR>")
            (buf-nnoremap-silent "<Space>lim" ":lua vim.lsp.buf.implementation()<CR>")
            (buf-nnoremap-silent "<Space>lo" ":lua vim.lsp.buf.outgoing_calls()<CR>")
            (buf-nnoremap-silent "<Space>lref" ":lua vim.lsp.buf.references()<CR>")
            (buf-nnoremap-silent "<Space>lren" ":lua vim.lsp.buf.rename()<CR>")
            (buf-nnoremap-silent "<Space>lsh" ":lua vim.lsp.buf.signature_help()<CR>")
            (buf-nnoremap-silent "<Space>lsl" ":lua vim.lsp.util.show_line_diagnostics()<CR>")
            (buf-nnoremap-silent "<Space>lt" ":lua vim.lsp.buf.type_definition()<CR>")
            (buf-nnoremap-silent "<Space>lw" ":lua vim.lsp.buf.workspace_symbol()<CR>")
            (vim.cmd "setlocal omnifunc=v:lua.vim.lsp.omnifunc")
            (completion.on_attach client)
            (status.on_attach client))]
      (lsp.ghcide.setup
        { "capabilities" (capabilities lsp.ghcide)
          "on_attach" on-attach })
      (lsp.sumneko_lua.setup
        { "capabilities" (capabilities lsp.sumneko_lua)
          "on_attach" on-attach })
      (lsp.vimls.setup
        { "capabilities" (capabilities lsp.vimls)
          "on_attach" on-attach }))
      status.status))

(local lsp-status (lsp-setup))

(lambda lightline-status []
  (if (> (length (vim.lsp.buf_get_clients)) 0)
    (lsp-status)
    ""))

; Run the given command in a centered floating terminal.
(lambda run-floating [command]
  (let [buf (vim.api.nvim_create_buf false true)
        columns vim.o.columns
        lines vim.o.lines
        height (math.floor (+ (* lines 0.8) 0.5))
        row (math.floor (+ (/ (- lines height) 2) 0.5))
        width (math.floor (+ (* columns 0.8) 0.5))
        col (math.floor (+ (/ (- columns width) 2) 0.5))
        win (vim.api.nvim_open_win
              buf
              true
              { "col" col
                "height" height
                "relative" "editor"
                "row" row
                "style" "minimal"
                "width" width })]
    (vim.fn.termopen command { "on_exit" (lambda [] (vim.cmd (.. "bw! " buf))) })
    ; Awkward, undo the remapping of <Esc> to <C-\><C-n> in init.vim
    (vim.api.nvim_buf_set_keymap buf "t" "<Esc>" "<Esc>" { "nowait" true "noremap" true "silent" true })
    win))

{ "lightline_status" lightline-status
  "run_floating" run-floating }
