(import-macros { "map" map } "fennel/nvim-macros")

; Swap : and ;
(map [ "c" "i" "n" "o" "v" ] ";" ":" { "noremap" true })
(map [ "c" "i" "n" "o" "v" ] ":" ";" { "noremap" true })
(map [ "n" ] "r;" "r:" { "noremap" true })
(map [ "n" ] "r:" "r;" { "noremap" true })

; make ' jump back to mark's exact position, not just line
(map [ "n" ] "'" "`" { "noremap" true })

; very magic mode search
(map [ "n" ] "/" "/\\v" { "noremap" true })
(map [ "v" ] "/" "/\\v" { "noremap" true })

; Don't highlight matches *and* jump at the same time; only highlight
(map [ "n" ] "*" "*``" { "noremap" true })

; Wean myself off tab for now... hm, find a use for this.
(map [ "n" ] "<Tab>" "<Nop>" { "noremap" true })

; Backspace to switch to the previously edited buffer
(map [ "n" ] "<BS>" "<C-^>" { "noremap" true })

; Prevent the cursor from jumping past a wrapped line when moving up and down
(map [ "n" ] "j" "gj" { "noremap" true })
(map [ "n" ] "k" "gk" { "noremap" true })

; HJKL to move around the file.
(map [ "n" ] "J" "5j" {})
(map [ "n" ] "K" "5k" {})
(map [ "v" ] "J" "5j" { "noremap" true })
(map [ "v" ] "K" "5k" { "noremap" true })
(map [ "n" "o" "v" ] "H" "^" { "noremap" true })
(map [ "n" "o" ] "L" "$" { "noremap" true })
(map [ "v" ] "L" "g_" { "noremap" true })

; Make Y yank to the end of line, similar to how C and D behave
(map [ "n" ] "Y" "y$" { "noremap" true })

; After visual mode delete/yank, leave cursor at the end of the highlight
(map [ "v" ] "D" "d`>" { "noremap" true })
(map [ "v" ] "Y" "y`>" { "noremap" true })

; Select last changed or yanked area
(map [ "n" ] "gV" "'`[' . strpart(getregtype(), 0, 1) . '`]'" { "expr" true "noremap" true })

; U to redo. <C-r> comes from some plugin, maybe vim-repeat? (annoying)
(map [ "n" ] "U" "<C-r>" { "noremap" true })
; Weaning myself of <C-R> to redo
(map [ "n" ] "<C-r>" "<Nop>" { "noremap" true })

; Refactor word under cursor
; nnoremap c* /\<<C-r>=expand('<cWORD>')<CR>\>\C<CR>``cgn
; nnoremap c# ?\<<C-r>=expand('<cWORD>')<CR>\>\C<CR>``cgN

; Center after every search movement
(map [ "n" "v" ] "n" "nzz" { "noremap" true })
(map [ "n" "v" ] "N" "Nzz" { "noremap" true })

; q to quit the current buffer, or quit vim if there's only 1 listed buffer
(map [ "n" ] "q" "len(getbufinfo({'buflisted': 1})) ==? 1 ? \":q\\<CR>\" : \":bd\\<CR>\""
  { "expr" true "noremap" true "silent" true })

; Disable annoying command search 'q:' that I never use
; (nnoremap "q:" "<Nop>")

; ,q to record a macro
(map [ "n" ] ",q" "q" { "noremap" true })

; Q to apply macro recorded into q
(map [ "n" ] "Q" "@q" { "noremap" true })

; " Make *, # work in visual mode, too
; function! s:visualSearch(cmdtype, ...)
;   let temp = @"
;   normal! gvy
;   if !a:0 || a:1 != 'raw'
;     let @" = escape(@", a:cmdtype.'\*')
;   endif
;   let @/ = substitute(@", '\n', '\\n', 'g')
;   let @/ = substitute(@/, '\[', '\\[', 'g')
;   let @/ = substitute(@/, '\~', '\\~', 'g')
;   let @/ = substitute(@/, '\.', '\\.', 'g')
;   let @" = temp
; endfunction
; vnoremap * :<C-u>call <SID>visualSearch('/')<CR>/<C-r>=@/<CR><CR>``
; vnoremap # :<C-u>call <SID>visualSearch('?')<CR>?<C-r>=@/<CR><CR>``

; Follow >>/<< shifted text around with the cursor
(map [ "n" ] ">>" "<Plug>MyNmapLl" {})
(map [ "n" ] "<<" "<Plug>MyNmapHh" {})
; Get it to repeat with '.'
(map [ "n" ] "<Plug>MyNmapLl" ">>ll:call repeat#set(\"\\<Plug>MyNmapLl\")<CR>" { "noremap" true "silent" true })
(map [ "n" ] "<Plug>MyNmapHh" "<<hh:call repeat#set(\"\\<Plug>MyNmapHh\")<CR>" { "noremap" true "silent" true })

; ,j to join (since J moves down)
(map [ "n" ] ",j" "m`J``" { "noremap" true })

; inner/around line text objects
(map [ "v" ] "al" "$o0" { "noremap" true "silent" true })
(map [ "o" ] "al" ":<C-u>normal val<CR>" { "noremap" true "silent" true })
(map [ "v" ] "il" "g_o^" { "noremap" true "silent" true })
(map [ "o" ] "il" ":<C-u>normal vil<CR>" { "noremap" true "silent" true })

; " inner/around number text objects (with forward-seeking behavior)
; " 123 123.456 0b1010 0xff
; let s:number_regex = '0b[01]\+\|0x\x\+\|\d\+\(\.\d\+\)\='
; function! s:innerNumberTextObject()
;   if (!search(s:number_regex, 'ceW'))
;     return
;   endif
;   normal! v
;   call search(s:number_regex, 'bcW')
; endfunction
; function! s:aroundNumberTextObject()
;   if (!search(s:number_regex, 'ceW'))
;     return
;   endif
;   call search('\%' . (virtcol('.')+1) . 'v\s*', 'ceW')
;   normal! v
;   call search(s:number_regex, 'cb')
;   call search('\s*\%' . virtcol('.') . 'v', 'bW')
; endfunction
; vnoremap <silent> in :<C-u>call <SID>innerNumberTextObject()<cr>
; onoremap <silent> in :<C-u>call <SID>innerNumberTextObject()<cr>
; xnoremap <silent> an :<C-u>call <SID>aroundNumberTextObject()<cr>
; onoremap <silent> an :<C-u>call <SID>aroundNumberTextObject()<cr>

; Ctrl+S to search-and-replace in the file
(map [ "n" ] "<C-s>" ":%s/\\v//cg<Left><Left><Left><Left>" { "noremap" true })
(map [ "v" ] "<C-s>" ":s/\\v//cg<Left><Left><Left><Left>" { "noremap" true })

; Move buffers with Ctrl+jk
(map [ "n" ] "<C-j>" ":bn<CR>" { "noremap" true "silent" true })
(map [ "n" ] "<C-k>" ":bp<CR>" { "noremap" true "silent" true })

; Move vertical splits with Ctrl+hl
; I never use vertical splits anyway so these should be repurposed.
; nnoremap <C-h> <C-w>h
; nnoremap <C-l> <C-w>l

; " github.com/mitchellwrosen/repld stuff
; noremap <silent> <Space>s m`vip<Esc>:silent '<,'>w !repld-send --no-echo<CR>``
; nnoremap <silent> <Space>S m`:silent w !repld-send<CR>``
; vnoremap <silent> <Space>s m`<Esc>:silent '<,'>w !repld-send<CR>``

; command! -complete=shellcmd -nargs=1 Fg lua require'init'.run_floating(<f-args>)
; nnoremap <silent> <Space>rg :Fg lazygit<CR>
; nnoremap <silent> <Space>rt :Fg htop<CR>

; <C-v> to paste from * register
(map [ "i" ] "<C-v>" "<C-r>*" { "noremap" true })

; " Ctrl+space for omnicomplete
; imap <C-Space> <C-x><C-o>

; Command mode movement
(map [ "c" ] "<C-h>" "<Left>" { "noremap" true })
(map [ "c" ] "<C-j>" "<Down>" { "noremap" true })
(map [ "c" ] "<C-k>" "<Up>" { "noremap" true })
(map [ "c" ] "<C-l>" "<Right>" { "noremap" true })

; " Hm... can't figure out how to "fall through" to normal tab (autocomplete)
; " behavior
; " function! s:commandModeTab() abort
; "   if getcmdtype() ==# '/' || getcmdtype() ==# '?'
; "     return "\<Enter>/\<C-r>/"
; "   else
; "     return "\<Tab>"
; "   endif
; " endfunction
; " function! s:commandModeShiftTab() abort
; "   if getcmdtype() ==# '/' || getcmdtype() ==# '?'
; "     return "\<Enter>?\<C-r>/"
; "   else
; "     return "\<S-Tab>"
; "   endif
; " endfunction
; " cnoremap <expr> <Tab> <SID>commandModeTab()
; " cnoremap <expr> <S-Tab> <SID>commandModeShiftTab()

; When a popup menu is visible, move thru it with tab and select with enter
(map [ "i" ] "<Tab>" "pumvisible() ? \"\\<C-n>\" : \"\\<Tab>\"" { "expr" true "noremap" true })
(map [ "i" ] "<CR" "pumvisible() ? \"\\<C-y>\" : \"\\<CR>\"" { "expr" true "noremap" true })
