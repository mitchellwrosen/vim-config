(local
  { "autocmd" autocmd
    "event" event
  }
  (include "fennel/nvim")
)
(import-macros
  { "buf-map" buf-map
    "left-merge" left-merge
    "map" map
  }
  "fennel/nvim-macros"
)

; Some ggandor/lightspeed.nvim mappings. These need to come before the plugin is loaded, because that's how the plugin
; documentation says you are meant to override the defaults.
(map [ "o" ] "s" "<Plug>Lightspeed_s" {}) ; default = z (why?)
(map [ "o" ] "S" "<Plug>Lightspeed_S" {}) ; default = Z (why?)
; Workaround (documented in lightspeed readme) for the fact that when recording macros, we want normal fFtT, not
; lightspeed's fancy fFtT.
(map [ "n" "o" "v" ] "f" "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_f' : 'f'" { "expr" true })
(map [ "n" "o" "v" ] "F" "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_F' : 'F'" { "expr" true })
(map [ "n" "o" "v" ] "t" "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_t' : 't'" { "expr" true })
(map [ "n" "o" "v" ] "T" "reg_recording() . reg_executing() == '' ? '<Plug>Lightspeed_T' : 'T'" { "expr" true })

; plugins
((. vim.fn "plug#begin") (.. (vim.fn.stdpath "data") "/plugged"))

(vim.cmd "Plug 'Yggdroot/indentLine'") ; show markers every 2 columns of leading whitespace
(vim.cmd "Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }")
(vim.cmd "Plug 'folke/trouble.nvim', { 'commit': '7de8bc46164ec1f787dee34b6843b61251b1ea91' }")
(vim.cmd "Plug 'ggandor/lightspeed.nvim', { 'commit': '1cbd25bd666f2bfbad480a5b9b308e64dbefdf71' }")
(vim.cmd "Plug 'godlygeek/tabular'") ; align on words
(vim.cmd "Plug 'itchyny/lightline.vim'")
(vim.cmd "Plug 'junegunn/fzf.vim'") ; fuzzy search source code, files, etc
(vim.cmd "Plug 'mengelbrecht/lightline-bufferline'")
(vim.cmd "Plug 'mhinz/vim-startify'") ; startup screen
(vim.cmd "Plug 'neovim/nvim-lsp'")
(vim.cmd "Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }")
(vim.cmd "Plug 'nvim-lua/completion-nvim'")
(vim.cmd "Plug 'nvim-lua/lsp-status.nvim'")
(vim.cmd "Plug 'rhysd/git-messenger.vim'") ; git blame the line under the cursor
(vim.cmd "Plug 'romainl/vim-cool'") ; automatically unhighlight when cursor moves
(vim.cmd "Plug 'romainl/vim-qf'") ; vim quickfix improvements
(vim.cmd "Plug 'rrethy/vim-illuminate'") ; highlight occurrences of the word under the cursor
(vim.cmd "Plug 'sdiehl/vim-ormolu', { 'for': 'haskell' }")
(vim.cmd "Plug 'terryma/vim-multiple-cursors'") ; multiple cursors for quick and dirty renaming
(vim.cmd "Plug 'tommcdo/vim-exchange'") ; swap the location of two selections
(vim.cmd "Plug 'tpope/vim-characterize'") ; improved "ga"
(vim.cmd "Plug 'tpope/vim-commentary'") ; quick (un-)commenting
(vim.cmd "Plug 'tpope/vim-fugitive'")
(vim.cmd "Plug 'tpope/vim-repeat'") ; make "." repeat more things out of the box
(vim.cmd "Plug 'tpope/vim-surround'") ; some surround helpers
; (vim.cmd "Plug 'unblevable/quick-scope'") ; highlight characters for f, F, t, T
; (vim.cmd "Plug 'nvim-lua/plenary.nvim'")
; (vim.cmd "Plug 'nvim-lua/popup.nvim'")
((. vim.fn "plug#end"))

; colorscheme settings
(set vim.g.gruvbox_inverse 1)
(set vim.g.gruvbox_contrast_dark "soft")
(set vim.g.gruvbox_improved_strings 1) ; extra-highlight strings
(set vim.g.gruvbox_invert_signs 1)
(vim.cmd "colorscheme gruvbox")

(set vim.g.completion_enable_auto_popup 1)
(set vim.g.completion_matching_ignore_case 1)

; tommcdo/vim-exchange
(set vim.g.exchange_no_mappings 1) ; Don't make any key mappings

; rrethy/vim-illuminate
(set vim.g.Illuminate_delay 0) ; highlight immediately
(set vim.g.Illuminate_highlightUnderCursor 0) ; don't highlight the word under the cursor

; Yggdroot/indentLine
(set vim.g.indentLine_color_term 239)
(set vim.g.indentLine_char "│")

; ggandor/lightspeed.nvim
(let
  [lightspeed (require "lightspeed")]
  (lightspeed.setup {
    ; Milliseconds until the follow-up character is "swallowed" when jumping to a unique character right after the first
    ; input
    "jump_on_partial_input_safety_timeout" 400
    ; Jump to the first match automatically, without having to select a label.
    "jump_to_first_match" true
    "grey_out_search_area" true
    ; Before the first character is pressed, highlight characters that would be jumped to immediately. The docs say this
    ; can get slow, so consider disabling.
    "highlight_unique_chars" true
    ; Only jump to e.g. the first '=' character in a sequence like '==='
    "match_only_the_start_of_same_char_seqs" true
  })
)

; folke/trouble.nvim
(let
  [trouble (require "trouble")]
  (trouble.setup {
    ; don't use some fancy icons that require a separate plugin
    "icons" false
  })
)

(set vim.g.startify_custom_footer [ "   [e]  empty buffer" "   [q]  quit" ])
(set vim.g.startify_custom_header {})
(set vim.g.startify_custom_indices
  ["a" "s" "d" "f" "l" "g" "h" "w" "r" "u" "o" "p" "t" "y" "z"
   "x" "c" "v" "m" "" "." "/" "b" "n" "1" "2" "3" "4" "5" "6"])
(set vim.g.startify_enable_special 0)
(set vim.g.startify_enable_unsafe 1) ; faster startup
(set vim.g.startify_change_to_dir 0) ; don't cd to where file is
(set vim.g.startify_files_number 30)
(set vim.g.startify_lists [{ "type" "files" }])
(set vim.g.startify_relative_path 1)

(include "fennel/options")
(include "fennel/mappings")
(include "fennel/autocommands")

; configure

(let
  [default-code-action-callback (. vim.lsp.handlers "textDocument/codeAction")]
  (tset
    vim.lsp.handlers
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
     lsp (require "lspconfig")
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
                        (when (and (not (= result nil)) (= (type result) "table"))
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
      (lsp.elmls.setup
        { "capabilities" (capabilities lsp.elmls)
          "on_attach"
            (lambda [client]
              ; https://github.com/elm-tooling/elm-language-server/issues/503
              (when client.config.flags (set client.config.flags.allow_incremental_sync true))
              (on-attach client))
        })
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
