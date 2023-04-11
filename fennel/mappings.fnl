; Swap : and ;
(vim.keymap.set [ "c" "i" "n" "o" "v" ] ";" ":")
(vim.keymap.set [ "c" "i" "n" "o" "v" ] ":" ";")
(vim.keymap.set "n" "r;" "r:")
(vim.keymap.set "n" "r:" "r;")

; make ' jump back to mark's exact position, not just line
(vim.keymap.set "n" "'" "`")

; very magic mode search
(vim.keymap.set "n" "/" "/\\v")
(vim.keymap.set "v" "/" "/\\v")

; Don't highlight matches *and* jump at the same time; only highlight
(vim.keymap.set "n" "*" "*``")

; Backspace to switch to the previously edited buffer
(vim.keymap.set "n" "<BS>" "<C-^>")

; Prevent the cursor from jumping past a wrapped line when moving up and down
(vim.keymap.set "n" "j" "gj")
(vim.keymap.set "n" "k" "gk")

; HJKL to move around the file.
(vim.keymap.set [ "n" "v" ] "J" "6j" { :remap true })
(vim.keymap.set [ "n" "v" ] "K" "6k" { :remap true })
(vim.keymap.set [ "n" "o" "v" ] "H" "^")
(vim.keymap.set [ "n" "o" ] "L" "$")
(vim.keymap.set "v" "L" "g_")

; when pasting over visual selection, don't copy that visual selection to the default register
(vim.keymap.set "v" "p" "\"0p")

; After visual mode yank, leave cursor at the end of the highlight
(vim.keymap.set "v" "Y" "y`>")

; Select last changed or yanked area
(vim.keymap.set "n" "gV" "'`[' . strpart(getregtype(), 0, 1) . '`]'" { :expr true })

; U to redo. <C-r> comes from some plugin, maybe vim-repeat? (annoying)
(vim.keymap.set "n" "U" "<C-r>")
; Weaning myself of <C-R> to redo
(vim.keymap.set "n" "<C-r>" "<Nop>")

; Center after every search movement
(vim.keymap.set [ "n" "v" ] "n" "nzz")
(vim.keymap.set [ "n" "v" ] "N" "Nzz")

; q to quit the current buffer, or quit vim if there's only 1 listed buffer
(vim.keymap.set
  "n"
  "q"
  (fn []
    (local buffers (vim.fn.getbufinfo))
    (local num-listed
      (accumulate [acc 0 _ buffer (ipairs buffers)]
        (if (= 1 buffer.listed) (+ acc 1) acc)
      )
    )
    (vim.cmd (if (<= num-listed 1) "q" "bd"))
  )
)

; Follow >/< shifted text around with the cursor
; Get it to repeat with '.'
(vim.keymap.set "n" ">" "<Plug>MyRightShift" { :silent true })
(vim.keymap.set "n" "<" "<Plug>MyLeftShift" { :silent true })
(vim.keymap.set "n" "<Plug>MyRightShift" ">>ll:call repeat#set(\"\\<Plug>MyRightShift\")<CR>" { :silent true })
(vim.keymap.set "n" "<Plug>MyLeftShift" "<<hh:call repeat#set(\"\\<Plug>MyLeftShift\")<CR>" { :silent true })

; [M]erge to join (since J moves down)
(vim.keymap.set "n" "M" "m`J``")

; inner/around line text objects
(vim.keymap.set "v" "al" "$o0" { :silent true })
(vim.keymap.set "o" "al" ":<C-u>normal val<CR>" { :silent true })
(vim.keymap.set "v" "il" "g_o^" { :silent true })
(vim.keymap.set "o" "il" ":<C-u>normal vil<CR>" { :silent true })

; Ctrl+S to search-and-replace in the file
(vim.keymap.set "n" "<C-s>" ":%s/\\v//cg<Left><Left><Left><Left>")
(vim.keymap.set "v" "<C-s>" ":s/\\v//cg<Left><Left><Left><Left>")

; Move buffers with Ctrl+jk
(vim.keymap.set "n" "<C-j>" ":bn<CR>" { :silent true })
(vim.keymap.set "n" "<C-k>" ":bp<CR>" { :silent true })

; " github.com/mitchellwrosen/repld stuff
(vim.keymap.set "n" "<Space>s" "m`vip<Esc>:silent '<,'>w !repld-send --no-echo<CR>``" { :silent true })
(vim.keymap.set "n" "<Space>S" "m`:silent w !repld-send<CR>``" { :silent true })
(vim.keymap.set "v" "<Space>s" "m`<Esc>:silent '<,'>w !repld-send<CR>``" { :silent true })

; <C-v> to paste from * register
(vim.keymap.set "i" "<C-v>" "<C-r>*")

; Command mode movement
(vim.keymap.set "c" "<C-h>" "<Left>")
(vim.keymap.set "c" "<C-j>" "<Down>")
(vim.keymap.set "c" "<C-k>" "<Up>")
(vim.keymap.set "c" "<C-l>" "<Right>")

; When a popup menu is visible, move thru it with tab and select with enter
; (map [ "i" ] "<Tab>" "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"" { "expr" true "noremap" true })
; (map [ "i" ] "<CR>" "pumvisible() ? \"\\<C-y>\" : \"\\<CR>\"" { "expr" true "noremap" true })

; make tilde toggle the capitalization of the first letter of the current word (not sure i like this)
(vim.keymap.set "n" "~" "mzlblgueh~`z" { :silent true })

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

;; unicode goodies

(vim.keymap.set "i" "<C-u><<" "«")
(vim.keymap.set "i" "<C-u>>>" "»")
(vim.keymap.set "i" "<C-U><<<" "⋘")
(vim.keymap.set "i" "<C-U>>>>" "⋙")
(vim.keymap.set "i" "<C-u>not" "¬")
(vim.keymap.set "i" "<C-u>+-" "±")
(vim.keymap.set "i" "<C-u>`" "´")
(vim.keymap.set "i" "<C-u>micro" "µ")
(vim.keymap.set "i" "<C-u>mult" "×")
(vim.keymap.set "i" "<C-u>div" "÷")

(vim.keymap.set "i" "<C-u>Gamma" "Γ")
(vim.keymap.set "i" "<C-u>Delta" "Δ")
(vim.keymap.set "i" "<C-u>Theta" "Θ")
(vim.keymap.set "i" "<C-u>Lambda" "Λ")
(vim.keymap.set "i" "<C-u>Xi" "Ξ")
(vim.keymap.set "i" "<C-u>Pi" "Π")
(vim.keymap.set "i" "<C-u>Sigma" "Σ")
(vim.keymap.set "i" "<C-u>Upsilon" "Υ")
(vim.keymap.set "i" "<C-u>Phi" "Φ")
(vim.keymap.set "i" "<C-u>Psi" "Ψ")
(vim.keymap.set "i" "<C-u>Omega" "Ω")

(vim.keymap.set "i" "<C-u>alpha" "α")
(vim.keymap.set "i" "<C-u>beta" "β")
(vim.keymap.set "i" "<C-u>gamma" "γ")
(vim.keymap.set "i" "<C-u>delta" "δ")
(vim.keymap.set "i" "<C-u>epsilon" "ε")
(vim.keymap.set "i" "<C-u>zeta" "ζ")
(vim.keymap.set "i" "<C-u>eta" "η")
(vim.keymap.set "i" "<C-u>theta" "θ")
(vim.keymap.set "i" "<C-u>iota" "ι")
(vim.keymap.set "i" "<C-u>kappa" "κ")
(vim.keymap.set "i" "<C-u>lambda" "λ")
(vim.keymap.set "i" "<C-u>mu" "μ")
(vim.keymap.set "i" "<C-u>nu" "ν")
(vim.keymap.set "i" "<C-u>xi" "ξ")
(vim.keymap.set "i" "<C-u>pi" "π")
(vim.keymap.set "i" "<C-u>rho" "ρ")
(vim.keymap.set "i" "<C-u>sigma" "σ")
(vim.keymap.set "i" "<C-u>tau" "τ")
(vim.keymap.set "i" "<C-u>upsilon" "υ")
(vim.keymap.set "i" "<C-u>phi" "φ")
(vim.keymap.set "i" "<C-u>chi" "χ")
(vim.keymap.set "i" "<C-u>psi" "ψ")
(vim.keymap.set "i" "<C-u>omega" "ω")

(vim.keymap.set "i" "<C-u>^0" "⁰")
(vim.keymap.set "i" "<C-u>^1" "¹")
(vim.keymap.set "i" "<C-u>^2" "²")
(vim.keymap.set "i" "<C-u>^3" "³")
(vim.keymap.set "i" "<C-u>^4" "⁴")
(vim.keymap.set "i" "<C-u>^5" "⁵")
(vim.keymap.set "i" "<C-u>^6" "⁶")
(vim.keymap.set "i" "<C-u>^7" "⁷")
(vim.keymap.set "i" "<C-u>^8" "⁸")
(vim.keymap.set "i" "<C-u>^9" "⁹")

(vim.keymap.set "i" "<C-u>^a" "ᵃ")
(vim.keymap.set "i" "<C-u>^b" "ᵇ")
(vim.keymap.set "i" "<C-u>^d" "ᵈ")
(vim.keymap.set "i" "<C-u>^e" "ᵉ")
(vim.keymap.set "i" "<C-u>^g" "ᵍ")
(vim.keymap.set "i" "<C-u>^i" "ⁱ")
(vim.keymap.set "i" "<C-u>^k" "ᵏ")
(vim.keymap.set "i" "<C-u>^m" "ᵐ")
(vim.keymap.set "i" "<C-u>^n" "ⁿ")
(vim.keymap.set "i" "<C-u>^o" "ᵒ")
(vim.keymap.set "i" "<C-u>^p" "ᵖ")
(vim.keymap.set "i" "<C-u>^t" "ᵗ")
(vim.keymap.set "i" "<C-u>^u" "ᵘ")
(vim.keymap.set "i" "<C-u>^v" "ᵛ")

(vim.keymap.set "i" "<C-u>^A" "ᴬ")
(vim.keymap.set "i" "<C-u>^B" "ᴮ")
(vim.keymap.set "i" "<C-u>^D" "ᴰ")
(vim.keymap.set "i" "<C-u>^E" "ᴱ")
(vim.keymap.set "i" "<C-u>^G" "ᴳ")
(vim.keymap.set "i" "<C-u>^H" "ᴴ")
(vim.keymap.set "i" "<C-u>^I" "ᴵ")
(vim.keymap.set "i" "<C-u>^J" "ᴶ")
(vim.keymap.set "i" "<C-u>^K" "ᴷ")
(vim.keymap.set "i" "<C-u>^L" "ᴸ")
(vim.keymap.set "i" "<C-u>^M" "ᴹ")
(vim.keymap.set "i" "<C-u>^N" "ᴺ")
(vim.keymap.set "i" "<C-u>^O" "ᴼ")
(vim.keymap.set "i" "<C-u>^P" "ᴾ")
(vim.keymap.set "i" "<C-u>^R" "ᴿ")
(vim.keymap.set "i" "<C-u>^T" "ᵀ")
(vim.keymap.set "i" "<C-u>^U" "ᵁ")
(vim.keymap.set "i" "<C-u>^W" "ᵂ")

(vim.keymap.set "i" "<C-u>^alpha" "ᵅ")
(vim.keymap.set "i" "<C-u>^beta" "ᵝ")
(vim.keymap.set "i" "<C-u>^gamma" "ᵞ")
(vim.keymap.set "i" "<C-u>^delta" "ᵟ")
(vim.keymap.set "i" "<C-u>^phi" "ᵠ")
(vim.keymap.set "i" "<C-u>^chi" "ᵡ")

(vim.keymap.set "i" "<C-u>_a" "ₐ")
(vim.keymap.set "i" "<C-u>_e" "ₑ")
(vim.keymap.set "i" "<C-u>_h" "ₕ")
(vim.keymap.set "i" "<C-u>_i" "ᵢ")
(vim.keymap.set "i" "<C-u>_k" "ₖ")
(vim.keymap.set "i" "<C-u>_l" "ₗ")
(vim.keymap.set "i" "<C-u>_m" "ₘ")
(vim.keymap.set "i" "<C-u>_n" "ₙ")
(vim.keymap.set "i" "<C-u>_o" "ₒ")
(vim.keymap.set "i" "<C-u>_p" "ₚ")
(vim.keymap.set "i" "<C-u>_r" "ᵣ")
(vim.keymap.set "i" "<C-u>_s" "ₛ")
(vim.keymap.set "i" "<C-u>_t" "ₜ")
(vim.keymap.set "i" "<C-u>_u" "ᵤ")
(vim.keymap.set "i" "<C-u>_v" "ᵥ")
(vim.keymap.set "i" "<C-u>_x" "ₓ")

(vim.keymap.set "i" "<C-u>_beta" "ᵦ")
(vim.keymap.set "i" "<C-u>_gamma" "ᵧ")
(vim.keymap.set "i" "<C-u>_rho" "ᵨ")
(vim.keymap.set "i" "<C-u>_phi" "ᵩ")
(vim.keymap.set "i" "<C-u>_chi" "ᵪ")

(vim.keymap.set "i" "<C-u>!!" "‼")
(vim.keymap.set "i" "<C-u>??" "⁇")
(vim.keymap.set "i" "<C-u>?!" "⁈")
(vim.keymap.set "i" "<C-u>!?" "⁉")
(vim.keymap.set "i" "<C-u>_*" "⁎")

(vim.keymap.set "i" "<C-u>^+" "⁺")
(vim.keymap.set "i" "<C-u>^-" "⁻")
(vim.keymap.set "i" "<C-u>^=" "⁼")
(vim.keymap.set "i" "<C-u>^(" "⁽")
(vim.keymap.set "i" "<C-u>^)" "⁾")

(vim.keymap.set "i" "<C-u>_0" "₀")
(vim.keymap.set "i" "<C-u>_1" "₁")
(vim.keymap.set "i" "<C-u>_2" "₂")
(vim.keymap.set "i" "<C-u>_3" "₃")
(vim.keymap.set "i" "<C-u>_4" "₄")
(vim.keymap.set "i" "<C-u>_5" "₅")
(vim.keymap.set "i" "<C-u>_6" "₆")
(vim.keymap.set "i" "<C-u>_7" "₇")
(vim.keymap.set "i" "<C-u>_8" "₈")
(vim.keymap.set "i" "<C-u>_9" "₉")
(vim.keymap.set "i" "<C-u>_+" "₊")
(vim.keymap.set "i" "<C-u>_-" "₋")
(vim.keymap.set "i" "<C-u>_=" "₌")
(vim.keymap.set "i" "<C-u>_(" "₍")
(vim.keymap.set "i" "<C-u>_)" "₎")

(vim.keymap.set "i" "<C-U>tm" "™")

(vim.keymap.set "i" "<C-U><-" "←")
(vim.keymap.set "i" "<C-U>-^" "↑")
(vim.keymap.set "i" "<C-U>->" "→")
(vim.keymap.set "i" "<C-U>-v" "↓")
(vim.keymap.set "i" "<C-U><~" "↜")
(vim.keymap.set "i" "<C-U>~>" "↝")
(vim.keymap.set "i" "<C-U><<-" "↞")
(vim.keymap.set "i" "<C-U>-^^" "↟")
(vim.keymap.set "i" "<C-U>->>" "↠")
(vim.keymap.set "i" "<C-U>-vv" "↡")
(vim.keymap.set "i" "<C-U><-(" "↢")
(vim.keymap.set "i" "<C-U>)->" "↣")
(vim.keymap.set "i" "<C-U><-<Bar>" "↤")
(vim.keymap.set "i" "<C-U><Bar>-^" "↥")
(vim.keymap.set "i" "<C-U><Bar>->" "↦")
(vim.keymap.set "i" "<C-U><Bar>-v" "↧")
(vim.keymap.set "i" "<C-U></" "↩")
(vim.keymap.set "i" "<C-U>\\>" "↪")
(vim.keymap.set "i" "<C-U><=" "⇐")
(vim.keymap.set "i" "<C-U>=^" "⇑")
(vim.keymap.set "i" "<C-U>=>" "⇒")
(vim.keymap.set "i" "<C-U>=v" "⇓")
(vim.keymap.set "i" "<C-U><=>" "⇔")
(vim.keymap.set "i" "<C-U>^=v" "⇕")

(vim.keymap.set "i" "<C-u>forall" "∀")
(vim.keymap.set "i" "<C-u>exists" "∃")
(vim.keymap.set "i" "<C-u>nexists" "∄")
(vim.keymap.set "i" "<C-u>empty" "∅")
(vim.keymap.set "i" "<C-u>incr" "∆")
(vim.keymap.set "i" "<C-u>nabla" "∇")
(vim.keymap.set "i" "<C-u>elem" "∈")
(vim.keymap.set "i" "<C-u>nelem" "∉")
(vim.keymap.set "i" "<C-u>selem" "∊")
(vim.keymap.set "i" "<C-u>contains" "∋")
(vim.keymap.set "i" "<C-u>ncontains" "∌")
(vim.keymap.set "i" "<C-u>scontains" "∍")

(vim.keymap.set "i" "<C-u>product" "∏")
(vim.keymap.set "i" "<C-u>coproduct" "∐")
(vim.keymap.set "i" "<C-u>sum" "∑")
(vim.keymap.set "i" "<C-u>bullet" "∙")
(vim.keymap.set "i" "<C-u>infinity" "∞")

(vim.keymap.set "i" "<C-u>and" "∧")
(vim.keymap.set "i" "<C-u>or" "∨")
(vim.keymap.set "i" "<C-u>intersection" "∩")
(vim.keymap.set "i" "<C-u>union" "∪")

(vim.keymap.set "i" "<C-U>/=" "≠")
(vim.keymap.set "i" "<C-U>=3" "≡")
(vim.keymap.set "i" "<C-U>/=3" "≢")
(vim.keymap.set "i" "<C-U>=<" "≤")
(vim.keymap.set "i" "<C-U>>=" "≥")
(vim.keymap.set "i" "<C-U>/<" "≮")
(vim.keymap.set "i" "<C-U>/>" "≯")
(vim.keymap.set "i" "<C-U>/=<" "≰")
(vim.keymap.set "i" "<C-U>/>=" "≱")

(vim.keymap.set "i" "<C-U>psubset" "⊂")
(vim.keymap.set "i" "<C-U>psuperset" "⊃")
(vim.keymap.set "i" "<C-U>/psubset" "⊄")
(vim.keymap.set "i" "<C-U>/psuperset" "⊅")
(vim.keymap.set "i" "<C-U>subset" "⊆")
(vim.keymap.set "i" "<C-U>superset" "⊇")
(vim.keymap.set "i" "<C-U>/subset" "⊈")
(vim.keymap.set "i" "<C-U>/superset" "⊉")

(vim.keymap.set "i" "<C-U>top" "⊤")
(vim.keymap.set "i" "<C-U>bottom" "⊥")

(vim.keymap.set "i" "<C-U>xor" "⊻")
(vim.keymap.set "i" "<C-U>nand" "⊼")
(vim.keymap.set "i" "<C-U>nor" "⊽")

(vim.keymap.set "i" "<C-U>n-and" "⋀")
(vim.keymap.set "i" "<C-U>n-or" "⋁")
(vim.keymap.set "i" "<C-U>n-intersect" "⋂")
(vim.keymap.set "i" "<C-U>n-union" "⋃")

(vim.keymap.set "i" "<C-U>[[" "⟦")
(vim.keymap.set "i" "<C-U>]]" "⟧")
(vim.keymap.set "i" "<C-U>[<" "⟨")
(vim.keymap.set "i" "<C-U>>]" "⟩")
(vim.keymap.set "i" "<C-U>[<<" "⟪")
(vim.keymap.set "i" "<C-U>>>]" "⟫")

(vim.keymap.set "i" "<C-U>{{" "⦃")
(vim.keymap.set "i" "<C-U>}}" "⦄")
(vim.keymap.set "i" "<C-U>((" "⦅")
(vim.keymap.set "i" "<C-U>))" "⦆")

(vim.keymap.set "i" "<C-u>;" "⨾")

(vim.keymap.set "i" "<C-U>bA" "𝐀")
(vim.keymap.set "i" "<C-U>bB" "𝐁")
(vim.keymap.set "i" "<C-U>bC" "𝐂")
(vim.keymap.set "i" "<C-U>bD" "𝐃")
(vim.keymap.set "i" "<C-U>bE" "𝐄")
(vim.keymap.set "i" "<C-U>bF" "𝐅")
(vim.keymap.set "i" "<C-U>bG" "𝐆")
(vim.keymap.set "i" "<C-U>bH" "𝐇")
(vim.keymap.set "i" "<C-U>bI" "𝐈")
(vim.keymap.set "i" "<C-U>bJ" "𝐉")
(vim.keymap.set "i" "<C-U>bK" "𝐊")
(vim.keymap.set "i" "<C-U>bL" "𝐋")
(vim.keymap.set "i" "<C-U>bM" "𝐌")
(vim.keymap.set "i" "<C-U>bN" "𝐍")
(vim.keymap.set "i" "<C-U>bO" "𝐎")
(vim.keymap.set "i" "<C-U>bP" "𝐏")
(vim.keymap.set "i" "<C-U>bQ" "𝐐")
(vim.keymap.set "i" "<C-U>bR" "𝐑")
(vim.keymap.set "i" "<C-U>bS" "𝐒")
(vim.keymap.set "i" "<C-U>bT" "𝐓")
(vim.keymap.set "i" "<C-U>bU" "𝐔")
(vim.keymap.set "i" "<C-U>bV" "𝐕")
(vim.keymap.set "i" "<C-U>bW" "𝐖")
(vim.keymap.set "i" "<C-U>bX" "𝐗")
(vim.keymap.set "i" "<C-U>bY" "𝐘")
(vim.keymap.set "i" "<C-U>bZ" "𝐙")
(vim.keymap.set "i" "<C-U>ba" "𝐚")
(vim.keymap.set "i" "<C-U>bb" "𝐛")
(vim.keymap.set "i" "<C-U>bc" "𝐜")
(vim.keymap.set "i" "<C-U>bd" "𝐝")
(vim.keymap.set "i" "<C-U>be" "𝐞")
(vim.keymap.set "i" "<C-U>bf" "𝐟")
(vim.keymap.set "i" "<C-U>bg" "𝐠")
(vim.keymap.set "i" "<C-U>bh" "𝐡")
(vim.keymap.set "i" "<C-U>bi" "𝐢")
(vim.keymap.set "i" "<C-U>bj" "𝐣")
(vim.keymap.set "i" "<C-U>bk" "𝐤")
(vim.keymap.set "i" "<C-U>bl" "𝐥")
(vim.keymap.set "i" "<C-U>bm" "𝐦")
(vim.keymap.set "i" "<C-U>bn" "𝐧")
(vim.keymap.set "i" "<C-U>bo" "𝐨")
(vim.keymap.set "i" "<C-U>bp" "𝐩")
(vim.keymap.set "i" "<C-U>bq" "𝐪")
(vim.keymap.set "i" "<C-U>br" "𝐫")
(vim.keymap.set "i" "<C-U>bs" "𝐬")
(vim.keymap.set "i" "<C-U>bt" "𝐭")
(vim.keymap.set "i" "<C-U>bu" "𝐮")
(vim.keymap.set "i" "<C-U>bv" "𝐯")
(vim.keymap.set "i" "<C-U>bw" "𝐰")
(vim.keymap.set "i" "<C-U>bx" "𝐱")
(vim.keymap.set "i" "<C-U>by" "𝐲")
(vim.keymap.set "i" "<C-U>bz" "𝐳")

(vim.keymap.set "i" "<C-U>iA" "𝐴")
(vim.keymap.set "i" "<C-U>iB" "𝐵")
(vim.keymap.set "i" "<C-U>iC" "𝐶")
(vim.keymap.set "i" "<C-U>iD" "𝐷")
(vim.keymap.set "i" "<C-U>iE" "𝐸")
(vim.keymap.set "i" "<C-U>iF" "𝐹")
(vim.keymap.set "i" "<C-U>iG" "𝐺")
(vim.keymap.set "i" "<C-U>iH" "𝐻")
(vim.keymap.set "i" "<C-U>iI" "𝐼")
(vim.keymap.set "i" "<C-U>iJ" "𝐽")
(vim.keymap.set "i" "<C-U>iK" "𝐾")
(vim.keymap.set "i" "<C-U>iL" "𝐿")
(vim.keymap.set "i" "<C-U>iM" "𝑀")
(vim.keymap.set "i" "<C-U>iN" "𝑁")
(vim.keymap.set "i" "<C-U>iO" "𝑂")
(vim.keymap.set "i" "<C-U>iP" "𝑃")
(vim.keymap.set "i" "<C-U>iQ" "𝑄")
(vim.keymap.set "i" "<C-U>iR" "𝑅")
(vim.keymap.set "i" "<C-U>iS" "𝑆")
(vim.keymap.set "i" "<C-U>iT" "𝑇")
(vim.keymap.set "i" "<C-U>iU" "𝑈")
(vim.keymap.set "i" "<C-U>iV" "𝑉")
(vim.keymap.set "i" "<C-U>iW" "𝑊")
(vim.keymap.set "i" "<C-U>iX" "𝑋")
(vim.keymap.set "i" "<C-U>iY" "𝑌")
(vim.keymap.set "i" "<C-U>iZ" "𝑍")
(vim.keymap.set "i" "<C-U>ia" "𝑎")
(vim.keymap.set "i" "<C-U>ib" "𝑏")
(vim.keymap.set "i" "<C-U>ic" "𝑐")
(vim.keymap.set "i" "<C-U>id" "𝑑")
(vim.keymap.set "i" "<C-U>ie" "𝑒")
(vim.keymap.set "i" "<C-U>if" "𝑓")
(vim.keymap.set "i" "<C-U>ig" "𝑔")
(vim.keymap.set "i" "<C-U>ih" "ℎ")
(vim.keymap.set "i" "<C-U>ii" "𝑖")
(vim.keymap.set "i" "<C-U>ij" "𝑗")
(vim.keymap.set "i" "<C-U>ik" "𝑘")
(vim.keymap.set "i" "<C-U>il" "𝑙")
(vim.keymap.set "i" "<C-U>im" "𝑚")
(vim.keymap.set "i" "<C-U>in" "𝑛")
(vim.keymap.set "i" "<C-U>io" "𝑜")
(vim.keymap.set "i" "<C-U>ip" "𝑝")
(vim.keymap.set "i" "<C-U>iq" "𝑞")
(vim.keymap.set "i" "<C-U>ir" "𝑟")
(vim.keymap.set "i" "<C-U>is" "𝑠")
(vim.keymap.set "i" "<C-U>it" "𝑡")
(vim.keymap.set "i" "<C-U>iu" "𝑢")
(vim.keymap.set "i" "<C-U>iv" "𝑣")
(vim.keymap.set "i" "<C-U>iw" "𝑤")
(vim.keymap.set "i" "<C-U>ix" "𝑥")
(vim.keymap.set "i" "<C-U>iy" "𝑦")
(vim.keymap.set "i" "<C-U>iz" "𝑧")

(vim.keymap.set "i" "<C-U>biA" "𝑨")
(vim.keymap.set "i" "<C-U>biB" "𝑩")
(vim.keymap.set "i" "<C-U>biC" "𝑪")
(vim.keymap.set "i" "<C-U>biD" "𝑫")
(vim.keymap.set "i" "<C-U>biE" "𝑬")
(vim.keymap.set "i" "<C-U>biF" "𝑭")
(vim.keymap.set "i" "<C-U>biG" "𝑮")
(vim.keymap.set "i" "<C-U>biH" "𝑯")
(vim.keymap.set "i" "<C-U>biI" "𝑰")
(vim.keymap.set "i" "<C-U>biJ" "𝑱")
(vim.keymap.set "i" "<C-U>biK" "𝑲")
(vim.keymap.set "i" "<C-U>biL" "𝑳")
(vim.keymap.set "i" "<C-U>biM" "𝑴")
(vim.keymap.set "i" "<C-U>biN" "𝑵")
(vim.keymap.set "i" "<C-U>biO" "𝑶")
(vim.keymap.set "i" "<C-U>biP" "𝑷")
(vim.keymap.set "i" "<C-U>biQ" "𝑸")
(vim.keymap.set "i" "<C-U>biR" "𝑹")
(vim.keymap.set "i" "<C-U>biS" "𝑺")
(vim.keymap.set "i" "<C-U>biT" "𝑻")
(vim.keymap.set "i" "<C-U>biU" "𝑼")
(vim.keymap.set "i" "<C-U>biV" "𝑽")
(vim.keymap.set "i" "<C-U>biW" "𝑾")
(vim.keymap.set "i" "<C-U>biX" "𝑿")
(vim.keymap.set "i" "<C-U>biY" "𝒀")
(vim.keymap.set "i" "<C-U>biZ" "𝒁")
(vim.keymap.set "i" "<C-U>bia" "𝒂")
(vim.keymap.set "i" "<C-U>bib" "𝒃")
(vim.keymap.set "i" "<C-U>bic" "𝒄")
(vim.keymap.set "i" "<C-U>bid" "𝒅")
(vim.keymap.set "i" "<C-U>bie" "𝒆")
(vim.keymap.set "i" "<C-U>bif" "𝒇")
(vim.keymap.set "i" "<C-U>big" "𝒈")
(vim.keymap.set "i" "<C-U>bih" "𝒉")
(vim.keymap.set "i" "<C-U>bii" "𝒊")
(vim.keymap.set "i" "<C-U>bij" "𝒋")
(vim.keymap.set "i" "<C-U>bik" "𝒌")
(vim.keymap.set "i" "<C-U>bil" "𝒍")
(vim.keymap.set "i" "<C-U>bim" "𝒎")
(vim.keymap.set "i" "<C-U>bin" "𝒏")
(vim.keymap.set "i" "<C-U>bio" "𝒐")
(vim.keymap.set "i" "<C-U>bip" "𝒑")
(vim.keymap.set "i" "<C-U>biq" "𝒒")
(vim.keymap.set "i" "<C-U>bir" "𝒓")
(vim.keymap.set "i" "<C-U>bis" "𝒔")
(vim.keymap.set "i" "<C-U>bit" "𝒕")
(vim.keymap.set "i" "<C-U>biu" "𝒖")
(vim.keymap.set "i" "<C-U>biv" "𝒗")
(vim.keymap.set "i" "<C-U>biw" "𝒘")
(vim.keymap.set "i" "<C-U>bix" "𝒙")
(vim.keymap.set "i" "<C-U>biy" "𝒚")
(vim.keymap.set "i" "<C-U>biz" "𝒛")

(vim.keymap.set "i" "<C-U>sA" "𝒜")
(vim.keymap.set "i" "<C-U>sB" "ℬ")
(vim.keymap.set "i" "<C-U>sC" "𝒞")
(vim.keymap.set "i" "<C-U>sD" "𝒟")
(vim.keymap.set "i" "<C-U>sE" "ℰ")
(vim.keymap.set "i" "<C-U>sF" "ℱ")
(vim.keymap.set "i" "<C-U>sG" "𝒢")
(vim.keymap.set "i" "<C-U>sH" "ℋ")
(vim.keymap.set "i" "<C-U>sI" "ℐ")
(vim.keymap.set "i" "<C-U>sJ" "𝒥")
(vim.keymap.set "i" "<C-U>sK" "𝒦")
(vim.keymap.set "i" "<C-U>sL" "ℒ")
(vim.keymap.set "i" "<C-U>sM" "ℳ")
(vim.keymap.set "i" "<C-U>sN" "𝒩")
(vim.keymap.set "i" "<C-U>sO" "𝒪")
(vim.keymap.set "i" "<C-U>sP" "𝒫")
(vim.keymap.set "i" "<C-U>sQ" "𝒬")
(vim.keymap.set "i" "<C-U>sR" "ℛ")
(vim.keymap.set "i" "<C-U>sS" "𝒮")
(vim.keymap.set "i" "<C-U>sT" "𝒯")
(vim.keymap.set "i" "<C-U>sU" "𝒰")
(vim.keymap.set "i" "<C-U>sV" "𝒱")
(vim.keymap.set "i" "<C-U>sW" "𝒲")
(vim.keymap.set "i" "<C-U>sX" "𝒳")
(vim.keymap.set "i" "<C-U>sY" "𝒴")
(vim.keymap.set "i" "<C-U>sZ" "𝒵")
(vim.keymap.set "i" "<C-U>sa" "𝒶")
(vim.keymap.set "i" "<C-U>sb" "𝒷")
(vim.keymap.set "i" "<C-U>sc" "𝒸")
(vim.keymap.set "i" "<C-U>sd" "𝒹")
(vim.keymap.set "i" "<C-U>se" "ℯ")
(vim.keymap.set "i" "<C-U>sf" "𝒻")
(vim.keymap.set "i" "<C-U>sg" "ℊ")
(vim.keymap.set "i" "<C-U>sh" "𝒽")
(vim.keymap.set "i" "<C-U>si" "𝒾")
(vim.keymap.set "i" "<C-U>sj" "𝒿")
(vim.keymap.set "i" "<C-U>sk" "𝓀")
(vim.keymap.set "i" "<C-U>sl" "ℓ")
(vim.keymap.set "i" "<C-U>sm" "𝓂")
(vim.keymap.set "i" "<C-U>sn" "𝓃")
(vim.keymap.set "i" "<C-U>so" "ℴ")
(vim.keymap.set "i" "<C-U>sp" "𝓅")
(vim.keymap.set "i" "<C-U>sq" "𝓆")
(vim.keymap.set "i" "<C-U>sr" "𝓇")
(vim.keymap.set "i" "<C-U>ss" "𝓈")
(vim.keymap.set "i" "<C-U>st" "𝓉")
(vim.keymap.set "i" "<C-U>su" "𝓊")
(vim.keymap.set "i" "<C-U>sv" "𝓋")
(vim.keymap.set "i" "<C-U>sw" "𝓌")
(vim.keymap.set "i" "<C-U>sx" "𝓍")
(vim.keymap.set "i" "<C-U>sy" "𝓎")
(vim.keymap.set "i" "<C-U>sz" "𝓏")

(vim.keymap.set "i" "<C-U>sbA" "𝓐")
(vim.keymap.set "i" "<C-U>sbB" "𝓑")
(vim.keymap.set "i" "<C-U>sbC" "𝓒")
(vim.keymap.set "i" "<C-U>sbD" "𝓓")
(vim.keymap.set "i" "<C-U>sbE" "𝓔")
(vim.keymap.set "i" "<C-U>sbF" "𝓕")
(vim.keymap.set "i" "<C-U>sbG" "𝓖")
(vim.keymap.set "i" "<C-U>sbH" "𝓗")
(vim.keymap.set "i" "<C-U>sbI" "𝓘")
(vim.keymap.set "i" "<C-U>sbJ" "𝓙")
(vim.keymap.set "i" "<C-U>sbK" "𝓚")
(vim.keymap.set "i" "<C-U>sbL" "𝓛")
(vim.keymap.set "i" "<C-U>sbM" "𝓜")
(vim.keymap.set "i" "<C-U>sbN" "𝓝")
(vim.keymap.set "i" "<C-U>sbO" "𝓞")
(vim.keymap.set "i" "<C-U>sbP" "𝓟")
(vim.keymap.set "i" "<C-U>sbQ" "𝓠")
(vim.keymap.set "i" "<C-U>sbR" "𝓡")
(vim.keymap.set "i" "<C-U>sbS" "𝓢")
(vim.keymap.set "i" "<C-U>sbT" "𝓣")
(vim.keymap.set "i" "<C-U>sbU" "𝓤")
(vim.keymap.set "i" "<C-U>sbV" "𝓥")
(vim.keymap.set "i" "<C-U>sbW" "𝓦")
(vim.keymap.set "i" "<C-U>sbX" "𝓧")
(vim.keymap.set "i" "<C-U>sbY" "𝓨")
(vim.keymap.set "i" "<C-U>sbZ" "𝓩")
(vim.keymap.set "i" "<C-U>sba" "𝓪")
(vim.keymap.set "i" "<C-U>sbb" "𝓫")
(vim.keymap.set "i" "<C-U>sbc" "𝓬")
(vim.keymap.set "i" "<C-U>sbd" "𝓭")
(vim.keymap.set "i" "<C-U>sbe" "𝓮")
(vim.keymap.set "i" "<C-U>sbf" "𝓯")
(vim.keymap.set "i" "<C-U>sbg" "𝓰")
(vim.keymap.set "i" "<C-U>sbh" "𝓱")
(vim.keymap.set "i" "<C-U>sbi" "𝓲")
(vim.keymap.set "i" "<C-U>sbj" "𝓳")
(vim.keymap.set "i" "<C-U>sbk" "𝓴")
(vim.keymap.set "i" "<C-U>sbl" "𝓵")
(vim.keymap.set "i" "<C-U>sbm" "𝓶")
(vim.keymap.set "i" "<C-U>sbn" "𝓷")
(vim.keymap.set "i" "<C-U>sbo" "𝓸")
(vim.keymap.set "i" "<C-U>sbp" "𝓹")
(vim.keymap.set "i" "<C-U>sbq" "𝓺")
(vim.keymap.set "i" "<C-U>sbr" "𝓻")
(vim.keymap.set "i" "<C-U>sbs" "𝓼")
(vim.keymap.set "i" "<C-U>sbt" "𝓽")
(vim.keymap.set "i" "<C-U>sbu" "𝓾")
(vim.keymap.set "i" "<C-U>sbv" "𝓿")
(vim.keymap.set "i" "<C-U>sbw" "𝔀")
(vim.keymap.set "i" "<C-U>sbx" "𝔁")
(vim.keymap.set "i" "<C-U>sby" "𝔂")
(vim.keymap.set "i" "<C-U>sbz" "𝔃")

(vim.keymap.set "i" "<C-U>bAlpha" "𝚨")
(vim.keymap.set "i" "<C-U>bBeta" "𝚩")
(vim.keymap.set "i" "<C-U>bGamma" "𝚪")
(vim.keymap.set "i" "<C-U>bDelta" "𝚫")
(vim.keymap.set "i" "<C-U>bEpsilon" "𝚬")
(vim.keymap.set "i" "<C-U>bZeta" "𝚭")
(vim.keymap.set "i" "<C-U>bEta" "𝚮")
(vim.keymap.set "i" "<C-U>bTheta" "𝚯")
(vim.keymap.set "i" "<C-U>bIota" "𝚰")
(vim.keymap.set "i" "<C-U>bKappa" "𝚱")
(vim.keymap.set "i" "<C-U>bLambda" "𝚲")
(vim.keymap.set "i" "<C-U>bMu" "𝚳")
(vim.keymap.set "i" "<C-U>bNu" "𝚴")
(vim.keymap.set "i" "<C-U>bXi" "𝚵")
(vim.keymap.set "i" "<C-U>bOmnicron" "𝚶")
(vim.keymap.set "i" "<C-U>bPi" "𝚷")
(vim.keymap.set "i" "<C-U>bRho" "𝚸")
(vim.keymap.set "i" "<C-U>bSigma" "𝚺")
(vim.keymap.set "i" "<C-U>bTau" "𝚻")
(vim.keymap.set "i" "<C-U>bUpsilon" "𝚼")
(vim.keymap.set "i" "<C-U>bPhi" "𝚽")
(vim.keymap.set "i" "<C-U>bChi" "𝚾")
(vim.keymap.set "i" "<C-U>bPsi" "𝚿")
(vim.keymap.set "i" "<C-U>bOmega" "𝛀")
(vim.keymap.set "i" "<C-U>bNabla" "𝛁")
(vim.keymap.set "i" "<C-U>balpha" "𝛂")
(vim.keymap.set "i" "<C-U>bbeta" "𝛃")
(vim.keymap.set "i" "<C-U>bgamma" "𝛄")
(vim.keymap.set "i" "<C-U>bdelta" "𝛅")
(vim.keymap.set "i" "<C-U>bepsilon" "𝛆")
(vim.keymap.set "i" "<C-U>bzeta" "𝛇")
; inoremap <C-U>beta 𝛈
(vim.keymap.set "i" "<C-U>btheta" "𝛉")
(vim.keymap.set "i" "<C-U>biota" "𝛊")
(vim.keymap.set "i" "<C-U>bkappa" "𝛋")
(vim.keymap.set "i" "<C-U>blambda" "𝛌")
(vim.keymap.set "i" "<C-U>bmu" "𝛍")
(vim.keymap.set "i" "<C-U>bnu" "𝛎")
(vim.keymap.set "i" "<C-U>bxi" "𝛏")
(vim.keymap.set "i" "<C-U>bomnicron" "𝛐")
(vim.keymap.set "i" "<C-U>bpi" "𝛑")
(vim.keymap.set "i" "<C-U>brho" "𝛒")
(vim.keymap.set "i" "<C-U>bfsigma" "𝛓")
(vim.keymap.set "i" "<C-U>bsigma" "𝛔")
(vim.keymap.set "i" "<C-U>btau" "𝛕")
(vim.keymap.set "i" "<C-U>bupsilon" "𝛖")
(vim.keymap.set "i" "<C-U>bphi" "𝛗")
(vim.keymap.set "i" "<C-U>bchi" "𝛘")
(vim.keymap.set "i" "<C-U>bpsi" "𝛙")
(vim.keymap.set "i" "<C-U>bomega" "𝛚")
(vim.keymap.set "i" "<C-U>bpdiff" "𝛛")

(vim.keymap.set "i" "<C-U>iAlpha" "𝛢")
(vim.keymap.set "i" "<C-U>iBeta" "𝛣")
(vim.keymap.set "i" "<C-U>iGamma" "𝛤")
(vim.keymap.set "i" "<C-U>iDelta" "𝛥")
(vim.keymap.set "i" "<C-U>iEpsilon" "𝛦")
(vim.keymap.set "i" "<C-U>iZeta" "𝛧")
(vim.keymap.set "i" "<C-U>iEta" "𝛨")
(vim.keymap.set "i" "<C-U>iTheta" "𝛩")
(vim.keymap.set "i" "<C-U>iIota" "𝛪")
(vim.keymap.set "i" "<C-U>iKappa" "𝛫")
(vim.keymap.set "i" "<C-U>iLambda" "𝛬")
(vim.keymap.set "i" "<C-U>iMu" "𝛭")
(vim.keymap.set "i" "<C-U>iNu" "𝛮")
(vim.keymap.set "i" "<C-U>iXi" "𝛯")
(vim.keymap.set "i" "<C-U>iOmnicron" "𝛰")
(vim.keymap.set "i" "<C-U>iPi" "𝛱")
(vim.keymap.set "i" "<C-U>iRho" "𝛲")
(vim.keymap.set "i" "<C-U>iSigma" "𝛴")
(vim.keymap.set "i" "<C-U>iTau" "𝛵")
(vim.keymap.set "i" "<C-U>iUpsilon" "𝛶")
(vim.keymap.set "i" "<C-U>iPhi" "𝛷")
(vim.keymap.set "i" "<C-U>iChi" "𝛸")
(vim.keymap.set "i" "<C-U>iPsi" "𝛹")
(vim.keymap.set "i" "<C-U>iOmega" "𝛺")
(vim.keymap.set "i" "<C-U>iNabla" "𝛻")
(vim.keymap.set "i" "<C-U>ialpha" "𝛼")
(vim.keymap.set "i" "<C-U>ibeta" "𝛽")
(vim.keymap.set "i" "<C-U>igamma" "𝛾")
(vim.keymap.set "i" "<C-U>idelta" "𝛿")
(vim.keymap.set "i" "<C-U>iepsilon" "𝜀")
(vim.keymap.set "i" "<C-U>izeta" "𝜁")
(vim.keymap.set "i" "<C-U>ieta" "𝜂")
(vim.keymap.set "i" "<C-U>itheta" "𝜃")
(vim.keymap.set "i" "<C-U>iiota" "𝜄")
(vim.keymap.set "i" "<C-U>ikappa" "𝜅")
(vim.keymap.set "i" "<C-U>ilambda" "𝜆")
(vim.keymap.set "i" "<C-U>imu" "𝜇")
(vim.keymap.set "i" "<C-U>inu" "𝜈")
(vim.keymap.set "i" "<C-U>ixi" "𝜉")
(vim.keymap.set "i" "<C-U>iomnicron" "𝜊")
(vim.keymap.set "i" "<C-U>ipi" "𝜋")
(vim.keymap.set "i" "<C-U>irho" "𝜌")
(vim.keymap.set "i" "<C-U>ifsigma" "𝜍")
(vim.keymap.set "i" "<C-U>isigma" "𝜎")
(vim.keymap.set "i" "<C-U>itau" "𝜏")
(vim.keymap.set "i" "<C-U>iupsilon" "𝜐")
(vim.keymap.set "i" "<C-U>iphi" "𝜑")
(vim.keymap.set "i" "<C-U>ichi" "𝜒")
(vim.keymap.set "i" "<C-U>ipsi" "𝜓")
(vim.keymap.set "i" "<C-U>iomega" "𝜔")
(vim.keymap.set "i" "<C-U>ipdiff" "𝜕")

(vim.keymap.set "i" "<C-U>biAlpha" "𝜜")
(vim.keymap.set "i" "<C-U>biBeta" "𝜝")
(vim.keymap.set "i" "<C-U>biGamma" "𝜞")
(vim.keymap.set "i" "<C-U>biDelta" "𝜟")
(vim.keymap.set "i" "<C-U>biEpsilon" "𝜠")
(vim.keymap.set "i" "<C-U>biZeta" "𝜡")
(vim.keymap.set "i" "<C-U>biEta" "𝜢")
(vim.keymap.set "i" "<C-U>biTheta" "𝜣")
(vim.keymap.set "i" "<C-U>biIota" "𝜤")
(vim.keymap.set "i" "<C-U>biKappa" "𝜥")
(vim.keymap.set "i" "<C-U>biLambda" "𝜦")
(vim.keymap.set "i" "<C-U>biMu" "𝜧")
(vim.keymap.set "i" "<C-U>biNu" "𝜨")
(vim.keymap.set "i" "<C-U>biXi" "𝜩")
(vim.keymap.set "i" "<C-U>biOmnicron" "𝜪")
(vim.keymap.set "i" "<C-U>biPi" "𝜫")
(vim.keymap.set "i" "<C-U>biRho" "𝜬")
(vim.keymap.set "i" "<C-U>biSigma" "𝜮")
(vim.keymap.set "i" "<C-U>biTau" "𝜯")
(vim.keymap.set "i" "<C-U>biUpsilon" "𝜰")
(vim.keymap.set "i" "<C-U>biPhi" "𝜱")
(vim.keymap.set "i" "<C-U>biChi" "𝜲")
(vim.keymap.set "i" "<C-U>biPsi" "𝜳")
(vim.keymap.set "i" "<C-U>biOmega" "𝜴")
(vim.keymap.set "i" "<C-U>biNabla" "𝜵")
(vim.keymap.set "i" "<C-U>bialpha" "𝜶")
(vim.keymap.set "i" "<C-U>bibeta" "𝜷")
(vim.keymap.set "i" "<C-U>bigamma" "𝜸")
(vim.keymap.set "i" "<C-U>bidelta" "𝜹")
(vim.keymap.set "i" "<C-U>biepsilon" "𝜺")
(vim.keymap.set "i" "<C-U>bizeta" "𝜻")
(vim.keymap.set "i" "<C-U>bieta" "𝜼")
(vim.keymap.set "i" "<C-U>bitheta" "𝜽")
(vim.keymap.set "i" "<C-U>biiota" "𝜾")
(vim.keymap.set "i" "<C-U>bikappa" "𝜿")
(vim.keymap.set "i" "<C-U>bilambda" "𝝀")
(vim.keymap.set "i" "<C-U>bimu" "𝝁")
(vim.keymap.set "i" "<C-U>binu" "𝝂")
(vim.keymap.set "i" "<C-U>bixi" "𝝃")
(vim.keymap.set "i" "<C-U>biomnicron" "𝝄")
(vim.keymap.set "i" "<C-U>bipi" "𝝅")
(vim.keymap.set "i" "<C-U>birho" "𝝆")
(vim.keymap.set "i" "<C-U>bifsigma" "𝝇")
(vim.keymap.set "i" "<C-U>bisigma" "𝝈")
(vim.keymap.set "i" "<C-U>bitau" "𝝉")
(vim.keymap.set "i" "<C-U>biupsilon" "𝝊")
(vim.keymap.set "i" "<C-U>biphi" "𝝋")
(vim.keymap.set "i" "<C-U>bichi" "𝝌")
(vim.keymap.set "i" "<C-U>bipsi" "𝝍")
(vim.keymap.set "i" "<C-U>biomega" "𝝎")
(vim.keymap.set "i" "<C-U>bipdiff" "𝝏")

(vim.keymap.set "i" "<C-U>b0" "𝟎")
(vim.keymap.set "i" "<C-U>b1" "𝟏")
(vim.keymap.set "i" "<C-U>b2" "𝟐")
(vim.keymap.set "i" "<C-U>b3" "𝟑")
(vim.keymap.set "i" "<C-U>b4" "𝟒")
(vim.keymap.set "i" "<C-U>b5" "𝟓")
(vim.keymap.set "i" "<C-U>b6" "𝟔")
(vim.keymap.set "i" "<C-U>b7" "𝟕")
(vim.keymap.set "i" "<C-U>b8" "𝟖")
(vim.keymap.set "i" "<C-U>b9" "𝟗")
