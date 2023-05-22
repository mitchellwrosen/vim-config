(import-macros { : drop : take : wither } "stdlibm")
(import-macros
  {
    : cmap
    : get-previous-yank
    : get-region
    : get-visual-selection
    : imap
    : nmap
    : set-cursor
    : set-region
  }
  "nvim-stdlibm"
)

; Swap : and ;, since going to command-mode is (for me) more common than repeating the last f
(vim.keymap.set [ "n" "v" ] ";" ":")
(vim.keymap.set [ "n" "v" ] ":" ";")

; make ' jump back to mark's exact position, not just line
; this got more complicated after using which-key; simpler version left commented-out here
; (nmap "'" "`")

; very magic mode search
(nmap "/" "/\\v")
(vim.keymap.set "v" "/" "/\\v")

; Don't highlight matches *and* jump at the same time; only highlight. Also don't mess with the jumplist.
(nmap
  "*"
  (fn []
    (vim.cmd "keepjumps normal! mz*`z")
    ; laughable that lualine needs to be manually refreshed to catch these
    (local lualine (require "lualine"))
    (lualine.refresh)
  )
)

; Backspace to switch to the previously edited buffer
(nmap "<BS>" "<C-^>")

; Prevent the cursor from jumping past a wrapped line when moving up and down
(nmap "j" "gj")
(nmap "k" "gk")

; HJKL to move around the file.
(vim.keymap.set [ "n" "v" ] "J" "6j" { :remap true })
(vim.keymap.set [ "n" "v" ] "K" "6k" { :remap true })
(vim.keymap.set [ "n" "o" "v" ] "H" "^")
(vim.keymap.set [ "n" "o" ] "L" "$")
(vim.keymap.set "v" "L" "g_")

; when pasting over visual selection, don't copy that visual selection to the default register
(vim.keymap.set "v" "p" "P")

; TODO document this
; TODO make it work for V mode too
; TODO X variant that leaves cursor at end of current region
(vim.keymap.set
  "x"
  "x"
  (fn []
    (local prev-region (get-previous-yank))
    ; if there was no previous yank, first-row = first col = 0
    (when (not (and (= prev-region.start.row 0) (= prev-region.start.col 0)))
      ; v, V, or <Ctrl-v>
      ; (local prev-mode (string.sub (vim.fn.getregtype) 1 1))

      (local cur-region (get-visual-selection))
      ; (local cur-mode (. (vim.api.nvim_get_mode) "mode"))

      (local prev-contents (get-region prev-region))
      (local cur-contents (get-region cur-region))

      ; swap two regions on the same line
      (fn adjust-region [left-region right-region]
        (local right-region-len (- right-region.end.col right-region.start.col))
        (local left-region-len (- left-region.end.col left-region.start.col))
        (local delta (- right-region-len left-region-len))
        { :start { :row right-region.start.row :col (+ right-region.start.col delta) }
          :end { :row right-region.end.row :col (+ right-region.end.col delta) }
        }
      )

      ; we currently only handle single-line swaps
      (when (and (= prev-region.start.row prev-region.end.row) (= cur-region.start.row cur-region.end.row))
        (if
          ; if the first and second regions are on different lines, just swap 'em
          (not= prev-region.start.row cur-region.start.row)
          (do
            (vim.api.nvim_feedkeys "\27" "xn" false)
            (set-region prev-region cur-contents)
            (set-region cur-region prev-contents)
            (set-cursor cur-region.start)
          )
          ; otherwise, the regions are on the same line; if they don't overlap, swap 'em
          (and (< prev-region.start.col cur-region.start.col) (< prev-region.end.col cur-region.start.col))
          (do
            (vim.api.nvim_feedkeys "\27" "xn" false)
            (set-region prev-region cur-contents)
            (local adjusted-cur-region (adjust-region prev-region cur-region))
            (set-region adjusted-cur-region prev-contents)
            (set-cursor adjusted-cur-region.start)
          )
          (and (< cur-region.start.col prev-region.start.col) (< cur-region.end.col prev-region.start.col))
          (do
            (vim.api.nvim_feedkeys "\27" "xn" false)
            (set-region cur-region prev-contents)
            (local adjusted-prev-region (adjust-region cur-region prev-region))
            (set-region adjusted-prev-region cur-contents)
            (set-cursor cur-region.start)
          )
          ; otherwise, they overlap, so swapping is nonsense
        )
      )
    )
  )
)

; After visual mode yank, leave cursor at the end of the highlight
(vim.keymap.set "v" "Y" "y`>")

; U to redo
(nmap "U" "<C-r>")

; Center after every search movement
(vim.keymap.set [ "n" "v" ] "n" "nzz")
(vim.keymap.set [ "n" "v" ] "N" "Nzz")

; q to quit (with :bwipeout) the current buffer, or quit vim if there's only 1 listed buffer
;
; we use bwipeout rather than bdelete because then it's really fully deleted, and re-opening the buffer puts it at the
; end of the buffer list (which is kinda nice since vim doesn't let you change buffer order in any way)
;
; the docs warn to only use bwipeout if you "really know what you are doing" - but I don't really use marks or
; buffer-local options much, and I'm fine with them going away when I close a buffer
(nmap
  "q"
  (fn []
    (local buffers (vim.fn.getbufinfo))
    (local num-listed
      (accumulate [acc 0 _ buffer (ipairs buffers)]
        (if (= 1 buffer.listed) (+ acc 1) acc)
      )
    )
    (if (<= num-listed 1) (vim.cmd.q) (vim.api.nvim_buf_delete 0 { :force true }))
  )
)

; Q to save session and quit
(nmap
  "Q"
  (fn []
    (when (> (vim.fn.argc) 0) (vim.cmd "%argdel")) ; throw away arglist before saving session
    (vim.cmd { :cmd "mksession" :bang true })
    (vim.cmd.qa)
  )
)

; Follow >/< shifted text around with the cursor
; Get it to repeat with '.'
(nmap ">" "<Plug>MyRightShift" { :silent true })
(nmap "<" "<Plug>MyLeftShift" { :silent true })
(nmap "<Plug>MyRightShift" ">>ll:call repeat#set(\"\\<Plug>MyRightShift\")<CR>" { :silent true })
(nmap "<Plug>MyLeftShift" "<<hh:call repeat#set(\"\\<Plug>MyLeftShift\")<CR>" { :silent true })

; [M]erge to join (since J moves down)
(nmap "M" "m`J``")

; inner/around line text objects
(vim.keymap.set "v" "al" "$o0" { :silent true })
(vim.keymap.set "o" "al" ":<C-u>normal val<CR>" { :silent true })
(vim.keymap.set "v" "il" "g_o^" { :silent true })
(vim.keymap.set "o" "il" ":<C-u>normal vil<CR>" { :silent true })

; Ctrl+S to search-and-replace in the file
(nmap "<C-s>" ":%s/\\v//cg<Left><Left><Left><Left>")
(vim.keymap.set "v" "<C-s>" ":s/\\v//cg<Left><Left><Left><Left>")

; Move buffers with Ctrl+jk
(nmap "<C-j>" ":bn<CR>" { :silent true })
(nmap "<C-k>" ":bp<CR>" { :silent true })

; Move vertical splits with Ctrl+hl
(nmap "<C-h>" "<C-w><C-h>" {})
(nmap "<C-l>" "<C-w><C-l>" {})

; Experimenting with 1-5 to select buffer 1-5. Pretty annoying that vim doesn't support reordering buffers. I guess I
; need some custom functions and a custom bufferline to get the UX I want?
(do
  ; list *listed* buffers (matching the output of :ls) (doesn't matter if buffer is *unloaded*)
  ; this seems to be what bufferlines and such show by default
  (fn list-buffers []
    (local buffer-ids (vim.api.nvim_list_bufs))
    (wither
      buffer-ids
      [buffer-id]
      (if (vim.api.nvim_buf_get_option buffer-id "buflisted") buffer-id nil)
    )
  )
  (fn go-to-buffer [i]
    (local buffer-ids (list-buffers))
    (local buffer-id (. buffer-ids i))
    (when buffer-id (vim.cmd.buffer buffer-id))
  )

  ; (move-buffer-to-index i) moves the current buffer to index i (1-based)
  (fn move-buffer-to-index [desired-buffer-index]
    (when (>= desired-buffer-index 1)
      (local buffer-ids (list-buffers))
      (local current-buffer-id (vim.api.nvim_get_current_buf))
      (var current-buffer-index nil)
      (each [buffer-index buffer-id (ipairs buffer-ids) &until current-buffer-index]
        (when (= buffer-id current-buffer-id) (set current-buffer-index buffer-index))
      )
      (macro delete-buffer [buffer-id]
        `(vim.api.nvim_buf_delete ,buffer-id { :force true })
      )
      (if
        (< desired-buffer-index current-buffer-index)
          (do
            ; Say we have 8 buffers and we want to swap the current (5) to index 2
            ;
            ;   1 2 3 4 5 6 7 8
            ;     ^     ^

            ; First we compute the "left buffer ids to delete" by taking (5-2=3) buffers from the buffer list after
            ; dropping (2-1=1) buffers from it
            ;
            ;   1 2 3 4 5 6 7 8
            ;     ^^^^^
            (local left-buffer-ids-to-delete
              (take
                (- current-buffer-index desired-buffer-index)
                (drop (- desired-buffer-index 1) buffer-ids)))
            (local left-filenames-to-reopen
              (wither
                left-buffer-ids-to-delete
                [buffer-id]
                (vim.api.nvim_buf_get_name buffer-id)
              )
            )

            ; Next we compute the "right buffer ids to delete" by dropping 5 buffers from the buffer list
            ;
            ;   1 2 3 4 5 6 7 8
            ;             ^^^^^
            (local right-buffer-ids-to-delete (drop current-buffer-index buffer-ids))
            (local right-filenames-to-reopen
              (wither
                right-buffer-ids-to-delete
                [buffer-id]
                (vim.api.nvim_buf_get_name buffer-id)
              )
            )

            ; Now we delete those buffers
            ;
            ;   1 5
            (each [_ buffer-id (ipairs left-buffer-ids-to-delete)] (delete-buffer buffer-id))
            (each [_ buffer-id (ipairs right-buffer-ids-to-delete)] (delete-buffer buffer-id))

            ; And finally we re-open the left and right buffers
            ;
            ;   1 5 2 3 4 6 7 8
            (each [_ filename (ipairs left-filenames-to-reopen)] (vim.cmd.badd filename))
            (each [_ filename (ipairs right-filenames-to-reopen)] (vim.cmd.badd filename))

            ; without this, the buffer tabline thing doesn't update right away
            ; weirdly we don't need it when moving the buffer right. that's probably because we :edit
            (local lualine (require "lualine"))
            (lualine.refresh)
          )
        (> desired-buffer-index current-buffer-index)
          (do
            (local buffer-ids-to-delete (drop desired-buffer-index buffer-ids))
            (local filenames-to-reopen
              (wither
                buffer-ids-to-delete
                [buffer-id]
                (vim.api.nvim_buf_get_name buffer-id)
              )
            )
            (local current-filename (vim.api.nvim_buf_get_name 0))
            (delete-buffer current-buffer-id)
            (each [_ buffer-id (ipairs buffer-ids-to-delete)] (delete-buffer buffer-id))
            (vim.cmd.edit current-filename)
            (each [_ filename (ipairs filenames-to-reopen)] (vim.cmd.badd filename))
          )
      )
    )
  )
  (nmap "1" (fn [] (go-to-buffer 1)))
  (nmap "2" (fn [] (go-to-buffer 2)))
  (nmap "3" (fn [] (go-to-buffer 3)))
  (nmap "4" (fn [] (go-to-buffer 4)))
  (nmap "5" (fn [] (go-to-buffer 5)))
  (nmap "<Space>1" (fn [] (move-buffer-to-index 1)))
  (nmap "<Space>2" (fn [] (move-buffer-to-index 2)))
  (nmap "<Space>3" (fn [] (move-buffer-to-index 3)))
  (nmap "<Space>4" (fn [] (move-buffer-to-index 4)))
  (nmap "<Space>5" (fn [] (move-buffer-to-index 5)))
)

; github.com/mitchellwrosen/repld stuff
; FIXME these are useful hotkeys but I'm rarely running repld. what to do?
(nmap "<Space>s" "m`vip<Esc>:silent '<,'>w !repld-send --no-echo<CR>``" { :silent true })
(nmap "<Space>S" "m`:silent w !repld-send<CR>``" { :silent true })
(vim.keymap.set "v" "<Space>s" "m`<Esc>:silent '<,'>w !repld-send<CR>``" { :silent true })

; <C-v> to paste from * register
(imap "<C-v>" "<C-r>*")

; <C-BS> (which my terminal apparently maps to <C-h>??) to delete a word
(imap "<C-h>" "<C-w>")

; Command mode movement
(cmap "<C-h>" "<Left>")
(cmap "<C-j>" "<Down>")
(cmap "<C-k>" "<Up>")
(cmap "<C-l>" "<Right>")

; When a popup menu is visible, move thru it with tab and select with enter
; (map [ "i" ] "<Tab>" "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"" { "expr" true "noremap" true })
; (map [ "i" ] "<CR>" "pumvisible() ? \"\\<C-y>\" : \"\\<CR>\"" { "expr" true "noremap" true })

; make "n" like a number text object, with forward seeking behavior
; cn to change (inner) number, dn to delete it, etc
;
; human readable regex:
;
;   number = hex-number | decimal-number
;   hex-number = 0x hex-digit+
;   decimal-number = digit+ (. digit+)?
;
; guide to ugly escaped characters below:
;
;   \\d  digit
;   \\x  hex digit
;   \\.  literal period character
;   \\+  one or more
;   \\?  optional
;   \\(  begin group
;   \\)  end group
;   \\|  alternative
(let [number-regex "0x\\x\\+\\|\\d\\+\\(\\.\\d\\+\\)\\?"]
  (vim.keymap.set
    "o"
    "n"
    (fn []
      (local matched-line (vim.fn.search number-regex "ceW"))
      (when (not= matched-line 0)
        (vim.cmd "normal! v")
        (vim.fn.search number-regex "bcW")
      )
    )
  )
)

; unicode goodies
;
; since these take 8ms to set, only set them if we actually press i<C-u>

(imap "<C-u>"
  (fn []
    (vim.keymap.del "i" "<C-u>")

    (imap "<C-u><<" "«")
    (imap "<C-u>>>" "»")
    (imap "<C-U><<<" "⋘")
    (imap "<C-U>>>>" "⋙")
    (imap "<C-u>not" "¬")
    (imap "<C-u>+-" "±")
    (imap "<C-u>`" "´")
    (imap "<C-u>micro" "µ")
    (imap "<C-u>mult" "×")
    (imap "<C-u>div" "÷")

    (imap "<C-u>Gamma" "Γ")
    (imap "<C-u>Delta" "Δ")
    (imap "<C-u>Theta" "Θ")
    (imap "<C-u>Lambda" "Λ")
    (imap "<C-u>Xi" "Ξ")
    (imap "<C-u>Pi" "Π")
    (imap "<C-u>Sigma" "Σ")
    (imap "<C-u>Upsilon" "Υ")
    (imap "<C-u>Phi" "Φ")
    (imap "<C-u>Psi" "Ψ")
    (imap "<C-u>Omega" "Ω")

    (imap "<C-u>alpha" "α")
    (imap "<C-u>beta" "β")
    (imap "<C-u>gamma" "γ")
    (imap "<C-u>delta" "δ")
    (imap "<C-u>epsilon" "ε")
    (imap "<C-u>zeta" "ζ")
    (imap "<C-u>eta" "η")
    (imap "<C-u>theta" "θ")
    (imap "<C-u>iota" "ι")
    (imap "<C-u>kappa" "κ")
    (imap "<C-u>lambda" "λ")
    (imap "<C-u>mu" "μ")
    (imap "<C-u>nu" "ν")
    (imap "<C-u>xi" "ξ")
    (imap "<C-u>pi" "π")
    (imap "<C-u>rho" "ρ")
    (imap "<C-u>sigma" "σ")
    (imap "<C-u>tau" "τ")
    (imap "<C-u>upsilon" "υ")
    (imap "<C-u>phi" "φ")
    (imap "<C-u>chi" "χ")
    (imap "<C-u>psi" "ψ")
    (imap "<C-u>omega" "ω")

    (imap "<C-u>^0" "⁰")
    (imap "<C-u>^1" "¹")
    (imap "<C-u>^2" "²")
    (imap "<C-u>^3" "³")
    (imap "<C-u>^4" "⁴")
    (imap "<C-u>^5" "⁵")
    (imap "<C-u>^6" "⁶")
    (imap "<C-u>^7" "⁷")
    (imap "<C-u>^8" "⁸")
    (imap "<C-u>^9" "⁹")

    (imap "<C-u>^a" "ᵃ")
    (imap "<C-u>^b" "ᵇ")
    (imap "<C-u>^d" "ᵈ")
    (imap "<C-u>^e" "ᵉ")
    (imap "<C-u>^g" "ᵍ")
    (imap "<C-u>^i" "ⁱ")
    (imap "<C-u>^k" "ᵏ")
    (imap "<C-u>^m" "ᵐ")
    (imap "<C-u>^n" "ⁿ")
    (imap "<C-u>^o" "ᵒ")
    (imap "<C-u>^p" "ᵖ")
    (imap "<C-u>^t" "ᵗ")
    (imap "<C-u>^u" "ᵘ")
    (imap "<C-u>^v" "ᵛ")

    (imap "<C-u>^A" "ᴬ")
    (imap "<C-u>^B" "ᴮ")
    (imap "<C-u>^D" "ᴰ")
    (imap "<C-u>^E" "ᴱ")
    (imap "<C-u>^G" "ᴳ")
    (imap "<C-u>^H" "ᴴ")
    (imap "<C-u>^I" "ᴵ")
    (imap "<C-u>^J" "ᴶ")
    (imap "<C-u>^K" "ᴷ")
    (imap "<C-u>^L" "ᴸ")
    (imap "<C-u>^M" "ᴹ")
    (imap "<C-u>^N" "ᴺ")
    (imap "<C-u>^O" "ᴼ")
    (imap "<C-u>^P" "ᴾ")
    (imap "<C-u>^R" "ᴿ")
    (imap "<C-u>^T" "ᵀ")
    (imap "<C-u>^U" "ᵁ")
    (imap "<C-u>^W" "ᵂ")

    (imap "<C-u>^alpha" "ᵅ")
    (imap "<C-u>^beta" "ᵝ")
    (imap "<C-u>^gamma" "ᵞ")
    (imap "<C-u>^delta" "ᵟ")
    (imap "<C-u>^phi" "ᵠ")
    (imap "<C-u>^chi" "ᵡ")

    (imap "<C-u>_a" "ₐ")
    (imap "<C-u>_e" "ₑ")
    (imap "<C-u>_h" "ₕ")
    (imap "<C-u>_i" "ᵢ")
    (imap "<C-u>_k" "ₖ")
    (imap "<C-u>_l" "ₗ")
    (imap "<C-u>_m" "ₘ")
    (imap "<C-u>_n" "ₙ")
    (imap "<C-u>_o" "ₒ")
    (imap "<C-u>_p" "ₚ")
    (imap "<C-u>_r" "ᵣ")
    (imap "<C-u>_s" "ₛ")
    (imap "<C-u>_t" "ₜ")
    (imap "<C-u>_u" "ᵤ")
    (imap "<C-u>_v" "ᵥ")
    (imap "<C-u>_x" "ₓ")

    (imap "<C-u>_beta" "ᵦ")
    (imap "<C-u>_gamma" "ᵧ")
    (imap "<C-u>_rho" "ᵨ")
    (imap "<C-u>_phi" "ᵩ")
    (imap "<C-u>_chi" "ᵪ")

    (imap "<C-u>!!" "‼")
    (imap "<C-u>??" "⁇")
    (imap "<C-u>?!" "⁈")
    (imap "<C-u>!?" "⁉")
    (imap "<C-u>_*" "⁎")

    (imap "<C-u>^+" "⁺")
    (imap "<C-u>^-" "⁻")
    (imap "<C-u>^=" "⁼")
    (imap "<C-u>^(" "⁽")
    (imap "<C-u>^)" "⁾")

    (imap "<C-u>_0" "₀")
    (imap "<C-u>_1" "₁")
    (imap "<C-u>_2" "₂")
    (imap "<C-u>_3" "₃")
    (imap "<C-u>_4" "₄")
    (imap "<C-u>_5" "₅")
    (imap "<C-u>_6" "₆")
    (imap "<C-u>_7" "₇")
    (imap "<C-u>_8" "₈")
    (imap "<C-u>_9" "₉")
    (imap "<C-u>_+" "₊")
    (imap "<C-u>_-" "₋")
    (imap "<C-u>_=" "₌")
    (imap "<C-u>_(" "₍")
    (imap "<C-u>_)" "₎")

    (imap "<C-U>tm" "™")

    (imap "<C-U><-" "←")
    (imap "<C-U>-^" "↑")
    (imap "<C-U>->" "→")
    (imap "<C-U>-v" "↓")
    (imap "<C-U><~" "↜")
    (imap "<C-U>~>" "↝")
    (imap "<C-U><<-" "↞")
    (imap "<C-U>-^^" "↟")
    (imap "<C-U>->>" "↠")
    (imap "<C-U>-vv" "↡")
    (imap "<C-U><-(" "↢")
    (imap "<C-U>)->" "↣")
    (imap "<C-U><-<Bar>" "↤")
    (imap "<C-U><Bar>-^" "↥")
    (imap "<C-U><Bar>->" "↦")
    (imap "<C-U><Bar>-v" "↧")
    (imap "<C-U></" "↩")
    (imap "<C-U>\\>" "↪")
    (imap "<C-U><=" "⇐")
    (imap "<C-U>=^" "⇑")
    (imap "<C-U>=>" "⇒")
    (imap "<C-U>=v" "⇓")
    (imap "<C-U><=>" "⇔")
    (imap "<C-U>^=v" "⇕")

    (imap "<C-u>forall" "∀")
    (imap "<C-u>exists" "∃")
    (imap "<C-u>nexists" "∄")
    (imap "<C-u>empty" "∅")
    (imap "<C-u>incr" "∆")
    (imap "<C-u>nabla" "∇")
    (imap "<C-u>elem" "∈")
    (imap "<C-u>nelem" "∉")
    (imap "<C-u>selem" "∊")
    (imap "<C-u>contains" "∋")
    (imap "<C-u>ncontains" "∌")
    (imap "<C-u>scontains" "∍")

    (imap "<C-u>product" "∏")
    (imap "<C-u>coproduct" "∐")
    (imap "<C-u>sum" "∑")
    (imap "<C-u>bullet" "∙")
    (imap "<C-u>infinity" "∞")

    (imap "<C-u>and" "∧")
    (imap "<C-u>or" "∨")
    (imap "<C-u>intersection" "∩")
    (imap "<C-u>union" "∪")

    (imap "<C-U>/=" "≠")
    (imap "<C-U>=3" "≡")
    (imap "<C-U>/=3" "≢")
    (imap "<C-U>=<" "≤")
    (imap "<C-U>>=" "≥")
    (imap "<C-U>/<" "≮")
    (imap "<C-U>/>" "≯")
    (imap "<C-U>/=<" "≰")
    (imap "<C-U>/>=" "≱")

    (imap "<C-U>psubset" "⊂")
    (imap "<C-U>psuperset" "⊃")
    (imap "<C-U>/psubset" "⊄")
    (imap "<C-U>/psuperset" "⊅")
    (imap "<C-U>subset" "⊆")
    (imap "<C-U>superset" "⊇")
    (imap "<C-U>/subset" "⊈")
    (imap "<C-U>/superset" "⊉")

    (imap "<C-U>top" "⊤")
    (imap "<C-U>bottom" "⊥")

    (imap "<C-U>xor" "⊻")
    (imap "<C-U>nand" "⊼")
    (imap "<C-U>nor" "⊽")

    (imap "<C-U>n-and" "⋀")
    (imap "<C-U>n-or" "⋁")
    (imap "<C-U>n-intersect" "⋂")
    (imap "<C-U>n-union" "⋃")

    (imap "<C-U>[[" "⟦")
    (imap "<C-U>]]" "⟧")
    (imap "<C-U>[<" "⟨")
    (imap "<C-U>>]" "⟩")
    (imap "<C-U>[<<" "⟪")
    (imap "<C-U>>>]" "⟫")

    (imap "<C-U>{{" "⦃")
    (imap "<C-U>}}" "⦄")
    (imap "<C-U>((" "⦅")
    (imap "<C-U>))" "⦆")

    (imap "<C-u>;" "⨾")

    (imap "<C-U>bA" "𝐀")
    (imap "<C-U>bB" "𝐁")
    (imap "<C-U>bC" "𝐂")
    (imap "<C-U>bD" "𝐃")
    (imap "<C-U>bE" "𝐄")
    (imap "<C-U>bF" "𝐅")
    (imap "<C-U>bG" "𝐆")
    (imap "<C-U>bH" "𝐇")
    (imap "<C-U>bI" "𝐈")
    (imap "<C-U>bJ" "𝐉")
    (imap "<C-U>bK" "𝐊")
    (imap "<C-U>bL" "𝐋")
    (imap "<C-U>bM" "𝐌")
    (imap "<C-U>bN" "𝐍")
    (imap "<C-U>bO" "𝐎")
    (imap "<C-U>bP" "𝐏")
    (imap "<C-U>bQ" "𝐐")
    (imap "<C-U>bR" "𝐑")
    (imap "<C-U>bS" "𝐒")
    (imap "<C-U>bT" "𝐓")
    (imap "<C-U>bU" "𝐔")
    (imap "<C-U>bV" "𝐕")
    (imap "<C-U>bW" "𝐖")
    (imap "<C-U>bX" "𝐗")
    (imap "<C-U>bY" "𝐘")
    (imap "<C-U>bZ" "𝐙")
    (imap "<C-U>ba" "𝐚")
    (imap "<C-U>bb" "𝐛")
    (imap "<C-U>bc" "𝐜")
    (imap "<C-U>bd" "𝐝")
    (imap "<C-U>be" "𝐞")
    (imap "<C-U>bf" "𝐟")
    (imap "<C-U>bg" "𝐠")
    (imap "<C-U>bh" "𝐡")
    (imap "<C-U>bi" "𝐢")
    (imap "<C-U>bj" "𝐣")
    (imap "<C-U>bk" "𝐤")
    (imap "<C-U>bl" "𝐥")
    (imap "<C-U>bm" "𝐦")
    (imap "<C-U>bn" "𝐧")
    (imap "<C-U>bo" "𝐨")
    (imap "<C-U>bp" "𝐩")
    (imap "<C-U>bq" "𝐪")
    (imap "<C-U>br" "𝐫")
    (imap "<C-U>bs" "𝐬")
    (imap "<C-U>bt" "𝐭")
    (imap "<C-U>bu" "𝐮")
    (imap "<C-U>bv" "𝐯")
    (imap "<C-U>bw" "𝐰")
    (imap "<C-U>bx" "𝐱")
    (imap "<C-U>by" "𝐲")
    (imap "<C-U>bz" "𝐳")

    (imap "<C-U>iA" "𝐴")
    (imap "<C-U>iB" "𝐵")
    (imap "<C-U>iC" "𝐶")
    (imap "<C-U>iD" "𝐷")
    (imap "<C-U>iE" "𝐸")
    (imap "<C-U>iF" "𝐹")
    (imap "<C-U>iG" "𝐺")
    (imap "<C-U>iH" "𝐻")
    (imap "<C-U>iI" "𝐼")
    (imap "<C-U>iJ" "𝐽")
    (imap "<C-U>iK" "𝐾")
    (imap "<C-U>iL" "𝐿")
    (imap "<C-U>iM" "𝑀")
    (imap "<C-U>iN" "𝑁")
    (imap "<C-U>iO" "𝑂")
    (imap "<C-U>iP" "𝑃")
    (imap "<C-U>iQ" "𝑄")
    (imap "<C-U>iR" "𝑅")
    (imap "<C-U>iS" "𝑆")
    (imap "<C-U>iT" "𝑇")
    (imap "<C-U>iU" "𝑈")
    (imap "<C-U>iV" "𝑉")
    (imap "<C-U>iW" "𝑊")
    (imap "<C-U>iX" "𝑋")
    (imap "<C-U>iY" "𝑌")
    (imap "<C-U>iZ" "𝑍")
    (imap "<C-U>ia" "𝑎")
    (imap "<C-U>ib" "𝑏")
    (imap "<C-U>ic" "𝑐")
    (imap "<C-U>id" "𝑑")
    (imap "<C-U>ie" "𝑒")
    (imap "<C-U>if" "𝑓")
    (imap "<C-U>ig" "𝑔")
    (imap "<C-U>ih" "ℎ")
    (imap "<C-U>ii" "𝑖")
    (imap "<C-U>ij" "𝑗")
    (imap "<C-U>ik" "𝑘")
    (imap "<C-U>il" "𝑙")
    (imap "<C-U>im" "𝑚")
    (imap "<C-U>in" "𝑛")
    (imap "<C-U>io" "𝑜")
    (imap "<C-U>ip" "𝑝")
    (imap "<C-U>iq" "𝑞")
    (imap "<C-U>ir" "𝑟")
    (imap "<C-U>is" "𝑠")
    (imap "<C-U>it" "𝑡")
    (imap "<C-U>iu" "𝑢")
    (imap "<C-U>iv" "𝑣")
    (imap "<C-U>iw" "𝑤")
    (imap "<C-U>ix" "𝑥")
    (imap "<C-U>iy" "𝑦")
    (imap "<C-U>iz" "𝑧")

    (imap "<C-U>biA" "𝑨")
    (imap "<C-U>biB" "𝑩")
    (imap "<C-U>biC" "𝑪")
    (imap "<C-U>biD" "𝑫")
    (imap "<C-U>biE" "𝑬")
    (imap "<C-U>biF" "𝑭")
    (imap "<C-U>biG" "𝑮")
    (imap "<C-U>biH" "𝑯")
    (imap "<C-U>biI" "𝑰")
    (imap "<C-U>biJ" "𝑱")
    (imap "<C-U>biK" "𝑲")
    (imap "<C-U>biL" "𝑳")
    (imap "<C-U>biM" "𝑴")
    (imap "<C-U>biN" "𝑵")
    (imap "<C-U>biO" "𝑶")
    (imap "<C-U>biP" "𝑷")
    (imap "<C-U>biQ" "𝑸")
    (imap "<C-U>biR" "𝑹")
    (imap "<C-U>biS" "𝑺")
    (imap "<C-U>biT" "𝑻")
    (imap "<C-U>biU" "𝑼")
    (imap "<C-U>biV" "𝑽")
    (imap "<C-U>biW" "𝑾")
    (imap "<C-U>biX" "𝑿")
    (imap "<C-U>biY" "𝒀")
    (imap "<C-U>biZ" "𝒁")
    (imap "<C-U>bia" "𝒂")
    (imap "<C-U>bib" "𝒃")
    (imap "<C-U>bic" "𝒄")
    (imap "<C-U>bid" "𝒅")
    (imap "<C-U>bie" "𝒆")
    (imap "<C-U>bif" "𝒇")
    (imap "<C-U>big" "𝒈")
    (imap "<C-U>bih" "𝒉")
    (imap "<C-U>bii" "𝒊")
    (imap "<C-U>bij" "𝒋")
    (imap "<C-U>bik" "𝒌")
    (imap "<C-U>bil" "𝒍")
    (imap "<C-U>bim" "𝒎")
    (imap "<C-U>bin" "𝒏")
    (imap "<C-U>bio" "𝒐")
    (imap "<C-U>bip" "𝒑")
    (imap "<C-U>biq" "𝒒")
    (imap "<C-U>bir" "𝒓")
    (imap "<C-U>bis" "𝒔")
    (imap "<C-U>bit" "𝒕")
    (imap "<C-U>biu" "𝒖")
    (imap "<C-U>biv" "𝒗")
    (imap "<C-U>biw" "𝒘")
    (imap "<C-U>bix" "𝒙")
    (imap "<C-U>biy" "𝒚")
    (imap "<C-U>biz" "𝒛")

    (imap "<C-U>sA" "𝒜")
    (imap "<C-U>sB" "ℬ")
    (imap "<C-U>sC" "𝒞")
    (imap "<C-U>sD" "𝒟")
    (imap "<C-U>sE" "ℰ")
    (imap "<C-U>sF" "ℱ")
    (imap "<C-U>sG" "𝒢")
    (imap "<C-U>sH" "ℋ")
    (imap "<C-U>sI" "ℐ")
    (imap "<C-U>sJ" "𝒥")
    (imap "<C-U>sK" "𝒦")
    (imap "<C-U>sL" "ℒ")
    (imap "<C-U>sM" "ℳ")
    (imap "<C-U>sN" "𝒩")
    (imap "<C-U>sO" "𝒪")
    (imap "<C-U>sP" "𝒫")
    (imap "<C-U>sQ" "𝒬")
    (imap "<C-U>sR" "ℛ")
    (imap "<C-U>sS" "𝒮")
    (imap "<C-U>sT" "𝒯")
    (imap "<C-U>sU" "𝒰")
    (imap "<C-U>sV" "𝒱")
    (imap "<C-U>sW" "𝒲")
    (imap "<C-U>sX" "𝒳")
    (imap "<C-U>sY" "𝒴")
    (imap "<C-U>sZ" "𝒵")
    (imap "<C-U>sa" "𝒶")
    (imap "<C-U>sb" "𝒷")
    (imap "<C-U>sc" "𝒸")
    (imap "<C-U>sd" "𝒹")
    (imap "<C-U>se" "ℯ")
    (imap "<C-U>sf" "𝒻")
    (imap "<C-U>sg" "ℊ")
    (imap "<C-U>sh" "𝒽")
    (imap "<C-U>si" "𝒾")
    (imap "<C-U>sj" "𝒿")
    (imap "<C-U>sk" "𝓀")
    (imap "<C-U>sl" "ℓ")
    (imap "<C-U>sm" "𝓂")
    (imap "<C-U>sn" "𝓃")
    (imap "<C-U>so" "ℴ")
    (imap "<C-U>sp" "𝓅")
    (imap "<C-U>sq" "𝓆")
    (imap "<C-U>sr" "𝓇")
    (imap "<C-U>ss" "𝓈")
    (imap "<C-U>st" "𝓉")
    (imap "<C-U>su" "𝓊")
    (imap "<C-U>sv" "𝓋")
    (imap "<C-U>sw" "𝓌")
    (imap "<C-U>sx" "𝓍")
    (imap "<C-U>sy" "𝓎")
    (imap "<C-U>sz" "𝓏")

    (imap "<C-U>sbA" "𝓐")
    (imap "<C-U>sbB" "𝓑")
    (imap "<C-U>sbC" "𝓒")
    (imap "<C-U>sbD" "𝓓")
    (imap "<C-U>sbE" "𝓔")
    (imap "<C-U>sbF" "𝓕")
    (imap "<C-U>sbG" "𝓖")
    (imap "<C-U>sbH" "𝓗")
    (imap "<C-U>sbI" "𝓘")
    (imap "<C-U>sbJ" "𝓙")
    (imap "<C-U>sbK" "𝓚")
    (imap "<C-U>sbL" "𝓛")
    (imap "<C-U>sbM" "𝓜")
    (imap "<C-U>sbN" "𝓝")
    (imap "<C-U>sbO" "𝓞")
    (imap "<C-U>sbP" "𝓟")
    (imap "<C-U>sbQ" "𝓠")
    (imap "<C-U>sbR" "𝓡")
    (imap "<C-U>sbS" "𝓢")
    (imap "<C-U>sbT" "𝓣")
    (imap "<C-U>sbU" "𝓤")
    (imap "<C-U>sbV" "𝓥")
    (imap "<C-U>sbW" "𝓦")
    (imap "<C-U>sbX" "𝓧")
    (imap "<C-U>sbY" "𝓨")
    (imap "<C-U>sbZ" "𝓩")
    (imap "<C-U>sba" "𝓪")
    (imap "<C-U>sbb" "𝓫")
    (imap "<C-U>sbc" "𝓬")
    (imap "<C-U>sbd" "𝓭")
    (imap "<C-U>sbe" "𝓮")
    (imap "<C-U>sbf" "𝓯")
    (imap "<C-U>sbg" "𝓰")
    (imap "<C-U>sbh" "𝓱")
    (imap "<C-U>sbi" "𝓲")
    (imap "<C-U>sbj" "𝓳")
    (imap "<C-U>sbk" "𝓴")
    (imap "<C-U>sbl" "𝓵")
    (imap "<C-U>sbm" "𝓶")
    (imap "<C-U>sbn" "𝓷")
    (imap "<C-U>sbo" "𝓸")
    (imap "<C-U>sbp" "𝓹")
    (imap "<C-U>sbq" "𝓺")
    (imap "<C-U>sbr" "𝓻")
    (imap "<C-U>sbs" "𝓼")
    (imap "<C-U>sbt" "𝓽")
    (imap "<C-U>sbu" "𝓾")
    (imap "<C-U>sbv" "𝓿")
    (imap "<C-U>sbw" "𝔀")
    (imap "<C-U>sbx" "𝔁")
    (imap "<C-U>sby" "𝔂")
    (imap "<C-U>sbz" "𝔃")

    (imap "<C-U>bAlpha" "𝚨")
    (imap "<C-U>bBeta" "𝚩")
    (imap "<C-U>bGamma" "𝚪")
    (imap "<C-U>bDelta" "𝚫")
    (imap "<C-U>bEpsilon" "𝚬")
    (imap "<C-U>bZeta" "𝚭")
    (imap "<C-U>bEta" "𝚮")
    (imap "<C-U>bTheta" "𝚯")
    (imap "<C-U>bIota" "𝚰")
    (imap "<C-U>bKappa" "𝚱")
    (imap "<C-U>bLambda" "𝚲")
    (imap "<C-U>bMu" "𝚳")
    (imap "<C-U>bNu" "𝚴")
    (imap "<C-U>bXi" "𝚵")
    (imap "<C-U>bOmnicron" "𝚶")
    (imap "<C-U>bPi" "𝚷")
    (imap "<C-U>bRho" "𝚸")
    (imap "<C-U>bSigma" "𝚺")
    (imap "<C-U>bTau" "𝚻")
    (imap "<C-U>bUpsilon" "𝚼")
    (imap "<C-U>bPhi" "𝚽")
    (imap "<C-U>bChi" "𝚾")
    (imap "<C-U>bPsi" "𝚿")
    (imap "<C-U>bOmega" "𝛀")
    (imap "<C-U>bNabla" "𝛁")
    (imap "<C-U>balpha" "𝛂")
    (imap "<C-U>bbeta" "𝛃")
    (imap "<C-U>bgamma" "𝛄")
    (imap "<C-U>bdelta" "𝛅")
    (imap "<C-U>bepsilon" "𝛆")
    (imap "<C-U>bzeta" "𝛇")
    ; inoremap <C-U>beta 𝛈
    (imap "<C-U>btheta" "𝛉")
    (imap "<C-U>biota" "𝛊")
    (imap "<C-U>bkappa" "𝛋")
    (imap "<C-U>blambda" "𝛌")
    (imap "<C-U>bmu" "𝛍")
    (imap "<C-U>bnu" "𝛎")
    (imap "<C-U>bxi" "𝛏")
    (imap "<C-U>bomnicron" "𝛐")
    (imap "<C-U>bpi" "𝛑")
    (imap "<C-U>brho" "𝛒")
    (imap "<C-U>bfsigma" "𝛓")
    (imap "<C-U>bsigma" "𝛔")
    (imap "<C-U>btau" "𝛕")
    (imap "<C-U>bupsilon" "𝛖")
    (imap "<C-U>bphi" "𝛗")
    (imap "<C-U>bchi" "𝛘")
    (imap "<C-U>bpsi" "𝛙")
    (imap "<C-U>bomega" "𝛚")
    (imap "<C-U>bpdiff" "𝛛")

    (imap "<C-U>iAlpha" "𝛢")
    (imap "<C-U>iBeta" "𝛣")
    (imap "<C-U>iGamma" "𝛤")
    (imap "<C-U>iDelta" "𝛥")
    (imap "<C-U>iEpsilon" "𝛦")
    (imap "<C-U>iZeta" "𝛧")
    (imap "<C-U>iEta" "𝛨")
    (imap "<C-U>iTheta" "𝛩")
    (imap "<C-U>iIota" "𝛪")
    (imap "<C-U>iKappa" "𝛫")
    (imap "<C-U>iLambda" "𝛬")
    (imap "<C-U>iMu" "𝛭")
    (imap "<C-U>iNu" "𝛮")
    (imap "<C-U>iXi" "𝛯")
    (imap "<C-U>iOmnicron" "𝛰")
    (imap "<C-U>iPi" "𝛱")
    (imap "<C-U>iRho" "𝛲")
    (imap "<C-U>iSigma" "𝛴")
    (imap "<C-U>iTau" "𝛵")
    (imap "<C-U>iUpsilon" "𝛶")
    (imap "<C-U>iPhi" "𝛷")
    (imap "<C-U>iChi" "𝛸")
    (imap "<C-U>iPsi" "𝛹")
    (imap "<C-U>iOmega" "𝛺")
    (imap "<C-U>iNabla" "𝛻")
    (imap "<C-U>ialpha" "𝛼")
    (imap "<C-U>ibeta" "𝛽")
    (imap "<C-U>igamma" "𝛾")
    (imap "<C-U>idelta" "𝛿")
    (imap "<C-U>iepsilon" "𝜀")
    (imap "<C-U>izeta" "𝜁")
    (imap "<C-U>ieta" "𝜂")
    (imap "<C-U>itheta" "𝜃")
    (imap "<C-U>iiota" "𝜄")
    (imap "<C-U>ikappa" "𝜅")
    (imap "<C-U>ilambda" "𝜆")
    (imap "<C-U>imu" "𝜇")
    (imap "<C-U>inu" "𝜈")
    (imap "<C-U>ixi" "𝜉")
    (imap "<C-U>iomnicron" "𝜊")
    (imap "<C-U>ipi" "𝜋")
    (imap "<C-U>irho" "𝜌")
    (imap "<C-U>ifsigma" "𝜍")
    (imap "<C-U>isigma" "𝜎")
    (imap "<C-U>itau" "𝜏")
    (imap "<C-U>iupsilon" "𝜐")
    (imap "<C-U>iphi" "𝜑")
    (imap "<C-U>ichi" "𝜒")
    (imap "<C-U>ipsi" "𝜓")
    (imap "<C-U>iomega" "𝜔")
    (imap "<C-U>ipdiff" "𝜕")

    (imap "<C-U>biAlpha" "𝜜")
    (imap "<C-U>biBeta" "𝜝")
    (imap "<C-U>biGamma" "𝜞")
    (imap "<C-U>biDelta" "𝜟")
    (imap "<C-U>biEpsilon" "𝜠")
    (imap "<C-U>biZeta" "𝜡")
    (imap "<C-U>biEta" "𝜢")
    (imap "<C-U>biTheta" "𝜣")
    (imap "<C-U>biIota" "𝜤")
    (imap "<C-U>biKappa" "𝜥")
    (imap "<C-U>biLambda" "𝜦")
    (imap "<C-U>biMu" "𝜧")
    (imap "<C-U>biNu" "𝜨")
    (imap "<C-U>biXi" "𝜩")
    (imap "<C-U>biOmnicron" "𝜪")
    (imap "<C-U>biPi" "𝜫")
    (imap "<C-U>biRho" "𝜬")
    (imap "<C-U>biSigma" "𝜮")
    (imap "<C-U>biTau" "𝜯")
    (imap "<C-U>biUpsilon" "𝜰")
    (imap "<C-U>biPhi" "𝜱")
    (imap "<C-U>biChi" "𝜲")
    (imap "<C-U>biPsi" "𝜳")
    (imap "<C-U>biOmega" "𝜴")
    (imap "<C-U>biNabla" "𝜵")
    (imap "<C-U>bialpha" "𝜶")
    (imap "<C-U>bibeta" "𝜷")
    (imap "<C-U>bigamma" "𝜸")
    (imap "<C-U>bidelta" "𝜹")
    (imap "<C-U>biepsilon" "𝜺")
    (imap "<C-U>bizeta" "𝜻")
    (imap "<C-U>bieta" "𝜼")
    (imap "<C-U>bitheta" "𝜽")
    (imap "<C-U>biiota" "𝜾")
    (imap "<C-U>bikappa" "𝜿")
    (imap "<C-U>bilambda" "𝝀")
    (imap "<C-U>bimu" "𝝁")
    (imap "<C-U>binu" "𝝂")
    (imap "<C-U>bixi" "𝝃")
    (imap "<C-U>biomnicron" "𝝄")
    (imap "<C-U>bipi" "𝝅")
    (imap "<C-U>birho" "𝝆")
    (imap "<C-U>bifsigma" "𝝇")
    (imap "<C-U>bisigma" "𝝈")
    (imap "<C-U>bitau" "𝝉")
    (imap "<C-U>biupsilon" "𝝊")
    (imap "<C-U>biphi" "𝝋")
    (imap "<C-U>bichi" "𝝌")
    (imap "<C-U>bipsi" "𝝍")
    (imap "<C-U>biomega" "𝝎")
    (imap "<C-U>bipdiff" "𝝏")

    (imap "<C-U>b0" "𝟎")
    (imap "<C-U>b1" "𝟏")
    (imap "<C-U>b2" "𝟐")
    (imap "<C-U>b3" "𝟑")
    (imap "<C-U>b4" "𝟒")
    (imap "<C-U>b5" "𝟓")
    (imap "<C-U>b6" "𝟔")
    (imap "<C-U>b7" "𝟕")
    (imap "<C-U>b8" "𝟖")
    (imap "<C-U>b9" "𝟗")

    (vim.notify "Set Unicode mappings.")
  )
)
