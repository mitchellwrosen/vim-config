(local { "autocmd" autocmd "event" event } (include "fennel/nvim"))
(import-macros { "buf-map" buf-map "left-merge" left-merge } "fennel/nvim-macros")

(include "fennel/colors")
(include "fennel/settings")
(include "fennel/plugins")
(include "fennel/options")
(include "fennel/mappings")
(include "fennel/autocommands")

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
      [ capabilities (lambda [config] (left-merge (or config.capabilities {}) status.capabilities))
        on-attach
          (lambda [client]
            (buf-map [ "n" ] "<Space>a" ":lua vim.lsp.buf.code_action()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lcr" ":lua vim.lsp.buf.clear_references()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>ldec" ":lua vim.lsp.buf.declaration()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>ldef" ":lua vim.lsp.buf.definition()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lds" ":lua vim.lsp.buf.document_symbol()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>d" ":lua vim.lsp.buf.formatting()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Enter>" ":lua vim.lsp.buf.hover()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lic" ":lua vim.lsp.buf.incoming_calls()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lim" ":lua vim.lsp.buf.implementation()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lo" ":lua vim.lsp.buf.outgoing_calls()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lref" ":lua vim.lsp.buf.references()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lren" ":lua vim.lsp.buf.rename()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lsh" ":lua vim.lsp.buf.signature_help()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lsl" ":lua vim.lsp.util.show_line_diagnostics()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lt" ":lua vim.lsp.buf.type_definition()<CR>" { "noremap" true "silent" true })
            (buf-map [ "n" ] "<Space>lw" ":lua vim.lsp.buf.workspace_symbol()<CR>" { "noremap" true "silent" true })
            (set vim.bo.omnifunc "v:lua.vim.lsp.omnifunc")

            (let
              [ ; extract the "meaningful head" of a list of (markdown) strings, where "meaningful" means not the empty
                ; string, and not beginning with ```
                meaningful-head
                  (fn [lines]
                    (var ret "")
                    (var i 1)
                    (while (<= i (length lines))
                      (let [l (. lines i)]
                        (if
                          (or (= l "") (= 0 (vim.fn.match l "^```")))
                          (set i (+ i 1))
                          (do
                            (set i (+ (length lines) 1))
                            (set ret l)))))
                    ret)

                ; filter : io (string -> string)
                ;
                ; Per the current buffer's filetype, return a function that mutates a line to set as virtual text, where
                ; the empty string means "don't annotate".
                ;
                ; For example, in Haskell we only care about lines that contain "::" (type signatures), because
                ; otherwise we'd end up annotating types with their own names on hover (for whatever reason,
                ; haskell-language-server currently returns "Bool" as the first line of a hover request, rather than
                ; something like "Bool :: Type")
                filter
                  (match vim.bo.filetype
                    "haskell"
                      (fn [line] (if (= -1 (vim.fn.match line "::")) "" line))
                    _ (fn [line] line))

                ; virtual-hover : io (string -> string) -> io ()
                ;
                ; Call "textDocument/hover" and set the first meaningful line of the returned markdown (after filtering)
                ; as virtual text of the current line (namespace "hover"). Clears any previously set virtual text.
                virtual-hover
                  (fn [filter]
                    (local position (vim.lsp.util.make_position_params))
                    (vim.lsp.buf_request 0 "textDocument/hover" position
                      (fn [_err _method result _client]
                        (local namespace (vim.api.nvim_create_namespace "hover"))
                        (when (not (= result nil))
                          (local line (meaningful-head (vim.lsp.util.convert_input_to_markdown_lines result.contents)))
                          (vim.api.nvim_buf_clear_namespace 0 namespace 0 -1)
                          (when (not (= (filter line) ""))
                            (vim.api.nvim_buf_set_virtual_text
                              0
                              namespace
                              position.position.line
                              [ [ (.. "∙ " line) "Comment" ] ] {}))))))

              ]
              (autocmd "mitchellwrosen" [event.cursor-moved] "<buffer>" (fn [] (virtual-hover filter))))

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
  "run_floating" run-floating
  "virtual_hover" virtual-hover }
