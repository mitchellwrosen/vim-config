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
