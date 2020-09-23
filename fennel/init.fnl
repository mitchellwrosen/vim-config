(local { "event" event "mode" mode } (include "fennel/nvim"))
(import-macros { "buf-map" buf-map "left-merge" left-merge } "fennel/nvim-macros")

(include "fennel/plugins")
(include "fennel/options")
(include "fennel/mappings")

(local utils (require "utils"))

(macro autocmd [events pattern action]
  `(utils.autocmd "mitchellwrosen" ,events ,pattern ,action))

(autocmd [event.bufEnter event.insertLeave] "*" (lambda [] (set vim.wo.relativenumber true)))
(autocmd [event.bufLeave event.insertEnter] "*" (lambda [] (set vim.wo.relativenumber false)))

(let
  [default-code-action-callback (. vim.lsp.callbacks "textDocument/codeAction")]
  (tset
    vim.lsp.callbacks
    "textDocument/codeAction"
    (fn [x y actions]
      (if
        (= (length actions) 1)
        ; Below was translated directly from default code action callback.
        ;
        ; textDocument/codeAction can return either Command[] or CodeAction[].
        ; If it is a CodeAction, it can have either an edit, a command or both.
        ; Edits should be executed first
        (let
          [ action (. actions 1)
            command (= (type action.command) "table")
            edit action.edit
          ]
          (if
            (or edit (= (type command) "table"))
            (do
              (when edit (vim.lsp.util.apply_workspace_edit edit))
              (when (= (type command) "table") (vim.lsp.buf.execute_command command)))
            (vim.lsp.buf.execute_command action)))
        (default-code-action-callback x y actions)))))

(fn lsp-setup []
  (let
    [completion (require "completion")
     ; configs (require "nvim_lsp/configs")
     lsp (require "nvim_lsp")
     status (require "lsp-status")]

    ; Uh, just kind of following https://github.com/nvim-lua/lsp-status.nvim here...
    (status.register_progress)

    (let
      [
        capabilities (lambda [config] (left-merge (or config.capabilities {}) status.capabilities))
        on-attach
          (lambda [client]
            (buf-map [ "n" ] "<Space>lca" ":lua vim.lsp.buf.code_action()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lcr" ":lua vim.lsp.buf.clear_references<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>ldec" ":lua vim.lsp.buf.declaration()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>ldef" ":lua vim.lsp.buf.definition()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lds" ":lua vim.lsp.buf.document_symbol()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>d" ":lua vim.lsp.buf.formatting()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lh" ":lua vim.lsp.buf.hover()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lic" ":lua vim.lsp.buf.incoming_calls()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lim" ":lua vim.lsp.buf.implementation()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lo" ":lua vim.lsp.buf.outgoing_calls()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lref" ":lua vim.lsp.buf.references()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lren" ":lua vim.lsp.buf.rename()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lsh" ":lua vim.lsp.buf.signature_help()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lsl" ":lua vim.lsp.util.show_line_diagnostics()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lt" ":lua vim.lsp.buf.type_definition()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lw" ":lua vim.lsp.buf.workspace_symbol()<CR>" { "noremap" true "silent" true })
            (vim.cmd "setlocal omnifunc=v:lua.vim.lsp.omnifunc")
            (completion.on_attach client)
            (status.on_attach client))]
      (lsp.hls.setup
        { "capabilities" (capabilities lsp.hls)
          "init_options" {
            "haskell" {
              "completionSnippetsOn" true
              ; diagnosticsDebounceDuration 350000
              "diagnosticsOnChange" true
              "formatOnImportOn" true
              "formattingProvider" "ormolu"
              "hlintOn" false
              "liquidOn" false
              ; "maxNumberOfProblems" 100
            }
          }
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
    (vim.api.nvim_buf_set_keymap buf "t" "<Esc>" "<Esc>" { "noremap" true "nowait" true "silent" true })
    win))

{ "lightline_status" lightline-status
  "run_floating" run-floating }
