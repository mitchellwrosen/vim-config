; https://github.com/neovim/neovim/pull/22668
; this might become the default some day, but as of 0.9, it's not
(vim.loader.enable)

(local { : file-exists } (require "stdlib"))
(import-macros { : create-autocmd : get-cursor : in-normal-mode : nmap : set-cursor } "nvim-stdlibm")

; create-autocmd macro needs this :sweat-smile:
(vim.api.nvim_create_augroup "mitchellwrosen" {})

(include "options")
(include "plugins")
(include "mappings")

(vim.cmd.sign "define" "DiagnosticSignError" "text=✗" "texthl=DiagnosticSignError" "linehl=" "numhl=")
(vim.cmd.sign "define" "DiagnosticSignWarn" "text=⚠" "texthl=DiagnosticSignWarn" "linehl=" "numhl=")
(vim.cmd.sign "define" "DiagnosticSignInfo" "text=ℹ" "texthl=DiagnosticSignInfo" "linehl=" "numhl=")
(vim.cmd.sign "define" "DiagnosticSignHint" "text=➤" "texthl=DiagnosticSignHint" "linehl=" "numhl=")

(vim.diagnostic.config
  { :float
      { ; require cursor to be over diagnostic in order to open a float window of it
        :scope "cursor"
        ; remove the default "Diagnostics:" header
        :header ""
      }
    ; only underline errors
    :underline { "severity" vim.diagnostic.severity.ERROR }
    ; the lsp_lines plugin seems to want to configure itself by making up a new `virtual_lines` key in
    ; `vim.diagnostic.config`. seems stupid as hell but here we are.
    :virtual_lines { :only_current_line true }
    ; don't put diagnostics inline, since we use lsp_lines
    :virtual_text false
  }
)

; Restore cursor position on open
; Cribbed from https://github.com/neovim/neovim/issues/16339#issuecomment-1457394370
(create-autocmd
  "BufRead"
  {}
  (fn [opts]
    (create-autocmd
      "BufWinEnter"
      { :buffer opts.buf
        :once true
      }
      (fn []
        (local last_known_pos (vim.api.nvim_buf_get_mark opts.buf "\""))
        (local last_known_line (. last_known_pos 1))
        (when (and (> last_known_line 1) (<= last_known_line (vim.api.nvim_buf_line_count opts.buf)))
          (vim.api.nvim_feedkeys "g`\"" "nx" false)
        )
      )
    )
  )
)

; Disallow edits to read-only files
(create-autocmd "BufReadPost" {} (fn [] (set vim.bo.modifiable (not vim.bo.readonly))))

; Briefly highlight yanks
(create-autocmd "TextYankPost" {} (fn [] (vim.highlight.on_yank { :higroup "IncSearch" :timeout 300 })))

; on cursor hold or focus gained, read the buffer in case it has been modified externally
(create-autocmd
  [ "CursorHold" "FocusGained" ]
  {}
  (fn [] (when (= (vim.fn.getcmdwintype) "") (vim.cmd.checktime)))
)

; Strip trailing whitespace and save the buffer after changing it
(create-autocmd
  [ "InsertLeave" "TextChanged" ]
  {}
  (fn []
    (when (and (= vim.o.buftype "") (not= (vim.api.nvim_buf_get_name 0) ""))
      (local view (vim.fn.winsaveview))
      (vim.cmd "keeppatterns silent! %s/\\s\\+$//e")
      (vim.cmd "silent! update")
      (vim.fn.winrestview view)
    )
  )
)

; try to extract the haskell type signature from the input string, which is assumed to look like:
;
; ```haskell
; runParser :: forall e s a.
; Parsec e s a -> String -> s -> Either (ParseErrorBundle s e) a
; ```
;
; *Defined in ‘Text.Megaparsec’* *(megaparsec-9.3.0)*\
;
;
; * * *
;
; ```haskell
; _ :: Parsec Void Text (Dump, Text)
; -> String
; -> Text
; -> Either (ParseErrorBundle Text Void) (Dump, Text)
; ```
(local extract-haskell-typesig-from-markdown
  (fn [str0]
    (var str str0)
    (var i nil)

    (set i (string.find str "```haskell\n"))
    (when i
      (set str (string.sub str (+ i 11)))
      (set i (string.find str "\n```"))
      (when i
        (set str (string.sub str 1 (- i 1)))
        (set i (string.find str ":: "))
        (when i
          (set str (string.sub str (+ i 3)))
          ; chop off leading forall, if any
          (set i (string.find str "forall"))
          (when (= i 1)
            (set i (string.find str "%.")) ; need to escape '.' in lua pattern
            (set str (string.sub str (+ i 2)))
          )
          ; render entire type on one line
          (set str (string.gsub str "\n" " "))
          ; throw away multiplicity markers (well, multiplicity-1)
          (set str (string.gsub str "%%1 %->" "->")) ; need to escape '%' and '-' in lua pattern
          str
        )
      )
    )
  )
)

(local hover-namespace (vim.api.nvim_create_namespace "hover"))
(macro clear-hover-namespace [buf] `(vim.api.nvim_buf_clear_namespace ,buf hover-namespace 0 -1))

(create-autocmd
  "LspAttach"
  {}
  (fn [ { : buf :data { : client_id } } ]
    (local client (vim.lsp.get_client_by_id client_id))

    (vim.cmd "highlight LspReference guifg=NONE guibg=#665c54 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59")
    (vim.cmd "highlight! link LspReferenceText LspReference")
    (vim.cmd "highlight! link LspReferenceRead LspReference")
    (vim.cmd "highlight! link LspReferenceWrite LspReference")

    (vim.cmd "highlight! link DiagnosticVirtualTextError DiagnosticSignError")
    (vim.cmd "highlight! link DiagnosticVirtualTextInfo DiagnosticSignInfo")
    (vim.cmd "highlight! link DiagnosticVirtualTextWarn DiagnosticSignWarn")

    ; overwrite n/N mappings to go to next/previous highlight, which we also set/clear on cursor move
    ; this makes it convenient to cycle through the occurrences of the thing under the cursor
    ; if we're cycling through a /search, though, make that take priority.
    (fn next-reference-index [ { :row cursor-row :col cursor-col } references]
      (var ref-ix nil)
      (each [ i ref (ipairs references) &until ref-ix ]
        (local { :range { :start { :line ref-row0 :character ref-col } } } ref)
        (local ref-row (+ ref-row0 1))
        (when (or (> ref-row cursor-row) (and (= ref-row cursor-row) (> ref-col cursor-col)))
          (set ref-ix i)
        )
      )
      (if ref-ix ref-ix 1)
    )
    (when (client.supports_method "textDocument/documentHighlight")
      (nmap
        "n"
        (fn []
          (local references (or vim.b.document-highlights {}))
          (if (and (= vim.v.hlsearch 0) (not (vim.tbl_isempty references)))
            (when (> (length references) 1)
              (local next-ref-ix (next-reference-index (get-cursor) references))
              (local { :range { :start { :line next-ref-row :character next-ref-col } } } (. references next-ref-ix))
              ; add current cursor position to jumplist before jumping
              (vim.api.nvim_feedkeys "m'" "nx" false)
              ; can't use nvim_buf_set_mark for this purpose yet
              ; https://github.com/neovim/neovim/issues/17861
              ; (vim.api.nvim_buf_set_mark 0 "'" cursor.row cursor.col {})
              (set-cursor { :row (+ next-ref-row 1) :col next-ref-col })
              (vim.cmd "silent! normal! zz")
              (set vim.b.moved-to-document-highlight true)
            )
            (vim.cmd "silent! normal! nzz")
          )
        )
      )
      (nmap
        "N"
        (fn []
          (local references (or vim.b.document-highlights {}))
          (if (and (= vim.v.hlsearch 0) (not (vim.tbl_isempty references)))
            (do
              (local num-refs (length references))
              (when (> num-refs 1)
                (local next-ref-ix (next-reference-index (get-cursor) references))
                (local prev-ref-ix
                  (case next-ref-ix
                    1 (- num-refs 1)
                    2 num-refs
                    _ (- next-ref-ix 2)
                  )
                )
                (local { :range { :start { :line prev-ref-row :character prev-ref-col } } } (. references prev-ref-ix))
                (vim.api.nvim_feedkeys "m'" "nx" false)
                (set-cursor { :row (+ prev-ref-row 1) :col prev-ref-col })
                (vim.cmd "silent! normal! zz")
                (set vim.b.moved-to-document-highlight true)
              )
            )
            (vim.cmd "silent! normal! Nzz")
          )
        )
      )
    )

    (when (client.supports_method "textDocument/codeAction")
      (nmap "<Space>la" vim.lsp.buf.code_action { :buffer buf :desc "Apply code action" :silent true })
    )
    (when (client.supports_method "textDocument/codeLens")
      ; Call vim.lsp.codelens.refresh() now and again, as recommended by the docs
      (create-autocmd
        [ "BufEnter" "CursorHold" "InsertLeave" ]
        { :buffer buf }
        (fn [] (vim.lsp.codelens.refresh))
      )
      (nmap "<Space>ll" vim.lsp.codelens.run { :buffer buf :desc "Run code lens" :silent true })
    )
    (nmap "gd" vim.lsp.buf.definition { :buffer buf :desc "Go to definition" :silent true })
    (nmap "<Space>ld" vim.lsp.buf.definition { :buffer buf :desc "Go to definition" :silent true })
    (when (client.supports_method "textDocument/formatting")
      (nmap "<Space>d" vim.lsp.buf.format { :buffer buf :desc "Format code" :silent true })
      (nmap "<Space>lf" vim.lsp.buf.format { :buffer buf :desc "Format code" :silent true })
    )
    (when (client.supports_method "textDocument/hover")
      (tset
        vim.lsp.handlers
        "textDocument/hover"
        (vim.lsp.with
          vim.lsp.handlers.hover
          { :border "rounded"
            :silent true ; don't notify "No information available" on empty response
          }
        )
      )
      (nmap "<Enter>" vim.lsp.buf.hover { :buffer buf :silent true })
    )
    (when (client.supports_method "textDocument/prepareCallHierarchy")
      (nmap "<Space>li" vim.lsp.buf.incoming_calls { :buffer buf :desc "Incoming calls" :silent true })
      (nmap "<Space>lo" vim.lsp.buf.outgoing_calls { :buffer buf :desc "Outgoing calls" :silent true })
    )
    (when (client.supports_method "textDocument/references")
      (nmap "<Space>lr" vim.lsp.buf.references { :buffer buf :desc "References" :silent true })
    )
    (when (client.supports_method "textDocument/rename")
      (nmap "<Space>ln" vim.lsp.buf.rename { :buffer buf :desc "Rename" :silent true })
    )
    (when (client.supports_method "textDocument/typeDefinition")
      (nmap "gt" vim.lsp.buf.type_definition { :buffer buf :desc "Go to type" :silent true })
      (nmap "<Space>lt" vim.lsp.buf.type_definition { :buffer buf :desc "Go to type" :silent true })
    )
    (let
      [ prev-diagnostic
          (fn []
            (local num-errors (length (vim.diagnostic.get buf { :severity vim.diagnostic.severity.ERROR })))
            (if (> num-errors 0)
              (vim.diagnostic.goto_prev { :float false :severity vim.diagnostic.severity.ERROR })
              (vim.diagnostic.goto_prev { :float false })
            )
          )
        next-diagnostic
          (fn []
            (local num-errors (length (vim.diagnostic.get buf { :severity vim.diagnostic.severity.ERROR })))
            (if (> num-errors 0)
              (vim.diagnostic.goto_next { :float false :severity vim.diagnostic.severity.ERROR })
              (vim.diagnostic.goto_next { :float false })
            )
          )
      ]
      ; float=false here means don't call vim.diagnostic.open_float once we land
      (nmap "<Up>" prev-diagnostic { :buffer buf :silent true })
      (nmap "<Down>" next-diagnostic { :buffer buf :silent true })
      (nmap "<S-Tab>" prev-diagnostic { :buffer buf :silent true })
      (nmap "<Tab>" next-diagnostic { :buffer buf :silent true })
    )

    ; temp
    (nmap "<Space>lq" vim.diagnostic.setqflist { :buffer buf :desc "Set QuickFix list" :silent true })

    ; make an autocommand group named e.g. "mitchellwrosenLsp3" for just this buffer, so we can clear it whenever it
    ; gets deleted and re-opend
    (local augroup-name (.. "mitchellwrosenLsp" buf))
    (vim.api.nvim_create_augroup augroup-name {})

    ; highlight other occurrences of the thing under the cursor
    ; the colors are determined by LspReferenceText, etc. highlight groups
    (local highlight-thing-under-cursor
      (do
        (local do-highlight
          (fn [position]
            (vim.lsp.buf.clear_references)
            (set vim.b.document-highlights {})
            (vim.lsp.buf_request buf "textDocument/documentHighlight" position nil)
          )
        )
        (case client.name
          "haskell" do-highlight
          _ (fn [] nil)
        )
      )
    )
    (local unhighlight-thing-under-cursor
      (do
        (local do-unhighlight
          (fn []
            (vim.lsp.buf.clear_references)
            (set vim.b.document-highlights {})
          )
        )
        (case client.name
          "haskell" do-unhighlight
          _ (fn [] nil)
        )
      )
    )

    (local show-hover-somehow
      (case client.name
        "haskell"
          (fn [position]
            ; try to put a type sig in the virtual text area
            (vim.lsp.buf_request
              buf
              "textDocument/hover"
              position
              (fn [_err result _ctx _config]
                (local contents (?. result :contents))
                (when (and (not (= contents nil)) (= (type contents) "table") (= "markdown" contents.kind))
                  (local line (extract-haskell-typesig-from-markdown contents.value))
                  (clear-hover-namespace buf)
                  (when line
                    (vim.api.nvim_buf_set_extmark
                      buf
                      hover-namespace
                      position.position.line
                      0 ; column (ignored unless we set :virt_text_pos to "overlay" below
                      { :virt_text [ [ line "Comment" ] ]
                      }
                    )
                  )
                )
              )
            )
          )
        _ (fn [] nil)
      )
    )
    (local unshow-hover-somehow
      (case client.name
        "haskell" (fn [] (clear-hover-namespace buf))
        _ (fn [] nil)
      )
    )

    (local on-cursor-move
      (fn []
        (local moved-to-document-highlight vim.b.moved-to-document-highlight)
        (set vim.b.moved-to-document-highlight false)
        (when (in-normal-mode)
          (local { : row : col } (get-cursor))
          (local current-line (vim.api.nvim_get_current_line))
          (local current-character (string.sub current-line (+ 1 col) (+ 1 col)))
          (if (and (not= current-character "") (not= current-character " "))
            (do
              (local position (vim.lsp.util.make_position_params))
              (when (not moved-to-document-highlight) (highlight-thing-under-cursor position))
              (show-hover-somehow position)
            )
            (do
              (unhighlight-thing-under-cursor)
              (unshow-hover-somehow)
            )
          )
        )
      )
    )

    (vim.api.nvim_create_autocmd
      "CursorMoved"
      { :buffer buf
        :callback on-cursor-move
        :group augroup-name
      }
    )

    ; forward workspace diagnostics the quickfix list
    (vim.api.nvim_create_autocmd
      "DiagnosticChanged"
      { :buffer buf
        :callback
          (fn [ { :data { : diagnostics } } ]
            (vim.fn.setqflist (vim.diagnostic.toqflist diagnostics) "r")
          )
        :group augroup-name
      }
    )

    (set vim.bo.omnifunc "v:lua.vim.lsp.omnifunc")
  )
)

; record macro with !, replay macro with 9
(create-autocmd [ "RecordingLeave" "VimEnter" ] {} (fn [] (nmap "!" "qz")))
(create-autocmd "RecordingEnter" {} (fn [] (nmap "!" "q")))
(nmap "9" "@z")

; neovim's progress handler seems like a bit of a work-in-progress, and I don't think it's a good idea to just
; overwrite it. it currently appends messages to an internal struct, emits a User LspStatusUpdate autocmd, and you can
; react to this by calling vim.lsp.util.get_client_messages, which returns a list of unseen messages
;
; that's all rather weird, so we just hook in here to do our thing (vim.notify progress updates) before passing along
; to the default handler
(do
  (local default-progress-handler (. vim.lsp.handlers "$/progress"))

  ; notifications : map client-id (map token { id : notification-id, start-ms : number, title : string })
  ;
  ; we track the notification-id for each progress update so we can update notifications in-place
  (var notifications {})

  (fn my-progress-handler [err result context config]
    (local client-id context.client_id)
    (local client (vim.lsp.get_client_by_id client-id))
    (if client
      (do
        (local token result.token)
        (local value result.value)
        (var start-ms nil)
        (case value.kind
          "begin"
            (do
              ; Ignore annoying "Processing" messages from HLS since they happen far too frequently
              (local should-notify
                (not
                  (and
                    (= client.name "haskell")
                    (= value.title "Processing")
                  )
                )
              )
              (when should-notify
                (set start-ms (vim.loop.now))
                (when (not (. notifications client-id)) (tset notifications client-id {}))
                (local
                  notification-id
                  (vim.notify
                    (..
                      "        | "
                      client.name
                      ":"
                      (if value.title (.. " " value.title) "")
                      (if value.message (.. " " value.message) "")
                    )
                    vim.log.levels.INFO
                    { :render "minimal"
                      :timeout false
                    }
                  )
                )
                (tset notifications client-id token { :id notification-id :start-ms start-ms :title value.title })
              )
            )
          "report"
            (do
              (local notification (?. notifications client-id token))
              (when notification
                (local { :id old-notification-id :title title } notification)
                (local
                  new-notification-id
                  (vim.notify
                    (..
                      "        | "
                      client.name
                      ":"
                      (if title (.. " " title) "")
                      (if value.message (.. " " value.message) "")
                    )
                    vim.log.levels.INFO
                    { :replace old-notification-id })
                )
                (tset notifications client-id token :id new-notification-id)
              )
            )
          "end"
            (do
              (local notification (?. notifications client-id token))
              (when notification
                (local { :id notification-id :start-ms start-ms :title title } notification)
                (local stop-ms (vim.loop.now))
                (vim.notify
                  (..
                    (string.format "%6.2fs" (/ (- stop-ms start-ms) 1000))
                    " | "
                    client.name
                    ":"
                    (if title (.. " " title) "")
                    (if value.message (.. " " value.message) "")
                  )
                  vim.log.levels.INFO
                  { :replace notification-id
                    :timeout (if (< (- stop-ms start-ms) 100) 0 3000)
                  }
                )
                (tset notifications client-id token nil)
              )
            )
        )
      )
      ; TODO
      (print "client died")
    )

    (default-progress-handler err result context config)
  )
  (tset vim.lsp.handlers "$/progress" my-progress-handler)
)

; default "textDocument/documentHighlight" handler, but save the ranges in a buffer-local variable
(tset
  vim.lsp.handlers
  "textDocument/documentHighlight"
  (fn [ _ references context _ ]
    (when references
      (local client-id context.client_id)
      (local client (vim.lsp.get_client_by_id client-id))
      (when client
        (local lsp-util (require "vim.lsp.util"))
        (set vim.b.document-highlights references)
        (lsp-util.buf_highlight_references context.bufnr references client.offset_encoding)
      )
    )
  )
)

; lsp capabilities: defaults plus whatever cmp_nvim_lsp wants to say it can do
(local lsp-capabilities
  (do
    (local cmp-nvim-lsp (require "cmp_nvim_lsp"))
    (cmp-nvim-lsp.update_capabilities (vim.lsp.protocol.make_client_capabilities))
  )
)

(macro make-on-init [start-ms notification-id name]
  `(fn [_client# _result#]
    (local stop-ms# (vim.loop.now))
    (vim.notify
      (.. (string.format "%6.2fs" (/ (- stop-ms# ,start-ms) 1000)) " | " ,name ": Initialized")
      vim.log.levels.INFO
      { :replace ,notification-id
        :timeout 3000
      }
    )
  )
)

(macro make-before-init [start-ms notification-id name]
  `(fn [_params# _config#]
    (set ,start-ms (vim.loop.now))
    (set
      ,notification-id
      (vim.notify
        (.. "        | " ,name ": Initializing")
        vim.log.levels.INFO
        { :render "minimal"
          :timeout false
        }
      )
    )
  )
)

; (lsp.elmls.setup
;   { :capabilities (capabilities lsp.elmls)
;     :on_attach
;       (lambda [client buf]
;         ; https://github.com/elm-tooling/elm-language-server/issues/503
;         (when client.config.flags (set client.config.flags.allow_incremental_sync true))
;       )
;   }
; )
(create-autocmd
  "FileType"
  { :pattern "elm" }
  (fn []
    (var initialize-notification-id nil)
    (var start-ms nil)
    (vim.lsp.start
      { :before_init (make-before-init start-ms initialize-notification-id "elm")
        :capabilities lsp-capabilities
        :cmd ["elm-language-server"]
        :init_options { :elmAnalyseTrigger "change" }
        :name "elm"
        ; https://github.com/elm-tooling/elm-language-server/issues/503
        :on_attach
          (fn [client _buf]
            (when client.config.flags (set client.config.flags.allow_incremental_sync true))
          )
        :on_init (make-on-init start-ms initialize-notification-id "elm")
        :root_dir (vim.loop.cwd)
        :settings {}
      }
    )
  )
)

(create-autocmd
  "FileType"
  { :pattern "fennel" }
  (fn []
    (var initialize-notification-id nil)
    (var start-ms nil)
    ; using commit f4298b02be9d3af8d27bba67dc129b9a1014fc55 of https://git.sr.ht/~xerool/fennel-ls
    (vim.lsp.start
      { :before_init (make-before-init start-ms initialize-notification-id "fennel")
        :capabilities lsp-capabilities
        :cmd ["fennel-ls"]
        :name "fennel"
        :on_init (make-on-init start-ms initialize-notification-id "fennel")
        :root_dir (vim.loop.cwd)
        :settings {}
      }
    )
  )
)

; seems-like-haskell-project returns true if there's a "cabal.project", "stack.yaml", or "*.cabal" file here
(macro seems-like-haskell-project []
  `(accumulate [acc# false name# typ# (vim.fs.dir ".") &until acc#]
    (or
      (and
        (= typ# "file")
        (or
          (= name# "cabal.project")
          (= name# "stack.yaml")
          (string.match name# "%.cabal$")
        )
      )
      acc#
    )
  )
)

(create-autocmd
  "FileType"
  { :pattern "haskell" }
  (fn []
    (when (seems-like-haskell-project)
      ; (vim.lsp.set_log_level "TRACE")
      (var initialize-notification-id nil)
      (var start-ms nil)
      (vim.lsp.start
        { :before_init (make-before-init start-ms initialize-notification-id "haskell")
          :capabilities lsp-capabilities
          :cmd ["haskell-language-server-wrapper" "--lsp"]
          ; :cmd ["haskell-language-server-wrapper" "--lsp" "--debug" "--logfile" "/home/mitchell/hls.txt"]
          :name "haskell"
          :on_init (make-on-init start-ms initialize-notification-id "haskell")
          :root_dir (vim.loop.cwd)
          :settings
            { :haskell
                { :formattingProvider "ormolu"
                  :plugin
                    { :hlint { :globalOn false }
                      :stan { :globalOn false } ; FUCK stan. all my homies HATE stan
                    }
                }
            }
        }
      )
    )
  )
)

(create-autocmd
  "FileType"
  { :pattern "python" }
  (fn []
    (when (= (vim.fn.executable "pyls") 1)
      (var initialize-notification-id nil)
      (var start-ms nil)
      (vim.lsp.start
        { :before_init (make-before-init start-ms initialize-notification-id "python")
          :capabilities lsp-capabilities
          :cmd [ "pyls" ]
          :name "python"
          :on_init (make-on-init start-ms initialize-notification-id "python")
          :root_dir (vim.loop.cwd)
          :settings {}
        }
      )
    )
  )
)

(create-autocmd
  "FileType"
  { :pattern "zig" }
  (fn []
    (var initialize-notification-id nil)
    (var start-ms nil)
    (vim.lsp.start
      { :before_init (make-before-init start-ms initialize-notification-id "zig")
        :capabilities lsp-capabilities
        :cmd [ "zls" ]
        :name "zig"
        :on_init (make-on-init start-ms initialize-notification-id "zig")
        :root_dir (vim.loop.cwd)
        :settings {}
      }
    )
  )
)

(create-autocmd
  "TermOpen"
  {}
  (fn []
    ; Esc to get into normal mode from a terminal
    (vim.keymap.set "t" "<Esc>" "<C-\\><C-n>" { :buffer true })
    ; Even in normal mode, send Ctrl+c to the terminal
    (nmap "<C-c>" "i<C-c>" { :buffer true })

    ; Start in insert mode
    (vim.cmd.startinsert)
  )
)

; restore Session.vim it it exists and and no args were provided to vim
; resources to look at later and make this better:
;   https://vim.fandom.com/wiki/Go_away_and_come_back
;   https://stackoverflow.com/questions/9281438/syntax-highlighting-doesnt-work-after-restore-a-previous-vim-session
;   https://github.com/Shatur/neovim-session-manager/blob/master/lua/session_manager/utils.lua
(create-autocmd
  "VimEnter"
  { :nested true ; fire more autocomands triggered by loading the session, like BufEnter etc
  }
  (fn []
    (when
      (and
        (= (vim.fn.argc) 0)
        (file-exists "Session.vim")
      )
      (vim.cmd { :cmd "source" :args [ "Session.vim" ] :mods { :silent true } })
    )
  )
)
