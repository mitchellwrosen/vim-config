" TODO
" switch to vim-packager?
" insert when focus terminal
" Space-/ BLines
" cabbrev rg Rg?
" don't cd with startify
" make surrounding with quotes repeatable

lua require('init')

" inner/around number text objects (with forward-seeking behavior)
" 123 123.456 0b1010 0xff
let s:number_regex = '0b[01]\+\|0x\x\+\|\d\+\(\.\d\+\)\='
function! s:innerNumberTextObject()
  if (!search(s:number_regex, 'ceW'))
    return
  endif
  normal! v
  call search(s:number_regex, 'bcW')
endfunction
function! s:aroundNumberTextObject()
  if (!search(s:number_regex, 'ceW'))
    return
  endif
  call search('\%' . (virtcol('.')+1) . 'v\s*', 'ceW')
  normal! v
  call search(s:number_regex, 'cb')
  call search('\s*\%' . virtcol('.') . 'v', 'bW')
endfunction
vnoremap <silent> in :<C-u>call <SID>innerNumberTextObject()<cr>
onoremap <silent> in :<C-u>call <SID>innerNumberTextObject()<cr>
xnoremap <silent> an :<C-u>call <SID>aroundNumberTextObject()<cr>
onoremap <silent> an :<C-u>call <SID>aroundNumberTextObject()<cr>

" Strip trailing whitespace on save
function! s:stripTrailingWhitespace() abort
  if &l:modifiable && !&l:binary
    let l:view = winsaveview()
      try
        keeppatterns silent! 1,$s/\s\+$//e
      finally
        call winrestview(l:view)
      endtry
  endif
endfunction
autocmd mitchellwrosen BufWritePre * call s:stripTrailingWhitespace()

" On <Enter>, go to error and close quickfix list
autocmd mitchellwrosen FileType qf nnoremap <silent> <buffer> <CR> <CR>:ccl<CR>

" Esc escapes terminal mode
autocmd mitchellwrosen TermOpen * tnoremap <buffer> <Esc> <C-\><C-n>
autocmd mitchellwrosen TermOpen * setlocal nonumber norelativenumber
" forcibly exit a terminal buffer, because there's nothing to save
autocmd mitchellwrosen TermOpen * nnoremap <silent> <buffer> <Space>d :bw!<CR>

" Echo the quickfix entry on the current line, if any
" autocmd CursorMoved * call <SID>EchoQuickFixEntry()

" ==============================================================================
" Plugin settings
" ==============================================================================

" [junegunn/fzf.vim]
" If the buffer is already open in another tab or window, jump to it rather
" than replace the current buffer (which would open 2 copies)
let g:fzf_buffers_jump = 1
let g:fzf_layout = { 'window': { 'height': 0.9, 'width': 0.9 } }

" [junegunn/fzf.vim]
" Space-o ("open") to fuzzy file search, both git- and everything-variants
nnoremap <expr> <Space>o (len(system('git rev-parse')) ? ':Files' : ':GFiles')."\<CR>"
" Space-f ("find") the word under the cursor
nnoremap <Space>f :Rg <C-r><C-w><CR>
" Space-k (because it's a home-row key) to fuzzy-search buffers
nnoremap <Space>k :Buffers<CR>

command! -bar BCommits call fzf#vim#buffer_commits(1)

command! -bar -nargs=? -complete=buffer Buffers
  \ call fzf#vim#buffers(
  \   <q-args>,
  \   fzf#vim#with_preview({'options': ['--info=inline', '--layout=reverse']}, 'down:60%'),
  \   0)

command! -nargs=? -complete=dir Files
  \ call fzf#vim#files(
  \   <q-args>,
  \   fzf#vim#with_preview({'options': ['--info=inline', '--layout=reverse']}, 'down:60%'),
  \   0)

command! -nargs=? GFiles
  \ call fzf#vim#gitfiles(
  \   <q-args>,
  \   fzf#vim#with_preview({'options': ['--info=inline', '--layout=reverse']}, 'down:60%'),
  \   0)

" Would be nice if '-1' worked here https://github.com/junegunn/fzf/issues/1750
" function! <SID>Rg(query)
"   let command_fmt = 'rg --column --line-number --no-heading --color=always -- %s || true'
"   let initial_command = printf(command_fmt, shellescape(a:query))
"   let reload_command = printf(command_fmt, '{q}')
"   let spec = {'options': ['-0', '-1', '--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
"   call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), 1)
" endfunction
" command! -nargs=* Rg call <SID>Rg(<q-args>)

command! -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always -- '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': ['--border', '--info=inline', '--layout=reverse']}, 'down:60%'),
  \   0)

command! -nargs=* Rgu
  \ call fzf#vim#grep(
  \   'rg --line-number --multiline --multiline-dotall --no-heading --color=always -- '.shellescape(<q-args>),
  \   0,
  \   fzf#vim#with_preview({'options': ['--border', '--info=inline', '--layout=reverse']}, 'down:60%'),
  \   0)

" autocmd mitchellwrosen FileType fzf setlocal laststatus=0
"   \| autocmd BufLeave <buffer> setlocal laststatus=2
" " Escape to quit little annoying temporary buffers
" autocmd mitchellwrosen FileType fzf nnoremap <silent> <buffer> <Esc> :q<CR>
" " Unmap Esc quitting terminal mode, so fzf handles it (result: one Esc closes fzf)
" autocmd mitchellwrosen FileType fzf tunmap <buffer> <Esc>

" [itchyny/lightline.vim]
function! LightlineFilename()
  let filename = expand('%:t')
  let modified = &modified ? '+' : ''
  return filename . modified
endfunction

function! LightlineLspStatus() abort
  return luaeval("require('init').lightline_status()")
endfunction

let g:lightline = {}
let g:lightline.active = {}
let g:lightline.active.left = [ [ 'mode', 'paste' ], [ 'branch' ] ]
let g:lightline.active.right = [ [ 'lineinfo' ], [ 'percent' ], [ 'filetype' ], [ 'lsp' ] ]
let g:lightline.colorscheme = 'gruvbox'
let g:lightline.component_expand = {}
let g:lightline.component_expand.buffers = 'lightline#bufferline#buffers'
let g:lightline.component_function = {}
let g:lightline.component_function.branch = 'FugitiveHead'
let g:lightline.component_function.filename = 'LightlineFilename'
let g:lightline.component_function.lsp = 'LightlineLspStatus'
let g:lightline.component_type = {}
let g:lightline.component_type.buffers = 'tabsel'
let g:lightline.mode_map = {
      \ 'c': ' ',
      \ 'i': ' ',
      \ 'n': '',
      \ 'R': ' ',
      \ 't': ' ',
      \ 'v': ' ',
      \ 'V': ' ',
      \ "\<C-v>": ' ',
      \ }
let g:lightline.tab = {}
let g:lightline.tab.active = [ 'tabnum', 'filename', 'modified' ]
let g:lightline.tab.inactive = [ 'tabnum', 'filename', 'modified' ]
let g:lightline.tabline = {}
let g:lightline.tabline.left = [ [ 'buffers' ] ]
let g:lightline.tabline.right = [ [ ] ]

" [mengelbrecht/lightline-bufferline]
let g:lightline#bufferline#modified = '+'

" [multiple-cursors]
let g:multi_cursor_use_default_mapping = 0
let g:multi_cursor_start_word_key = '<C-n>'
" let g:multi_cursor_start_key = 'g<C-n>'
" let g:multi_cursor_select_all_key = 'g<A-n>'
let g:multi_cursor_next_key = '<C-n>'
let g:multi_cursor_prev_key = '<C-p>'
" let g:multi_cursor_skip_key = '<C-x>'
let g:multi_cursor_quit_key = '<Esc>'

sign define LspDiagnosticsErrorSign text=✗ texthl=LspDiagnosticsError linehl= numhl=
sign define LspDiagnosticsWarningSign text=⚠ texthl=LspDiagnosticsWarning linehl= numhl=
sign define LspDiagnosticsInformationSign text=ℹ texthl=LspDiagnosticsInformation linehl= numhl=
sign define LspDiagnosticsHintSign text=➤ texthl=LspDiagnosticsHint linehl= numhl=

" [romainl/vim-qf]
" Toggle the quickfix ("location") menu; move thru quickfix items with Alt+jk
" Hmm... I never seem to use these... do they even work? Wtf is quickfix?
" nmap <Space>l <Plug>(qf_qf_toggle)
" nmap <A-j> <Plug>(qf_qf_next)
" nmap <A-k> <Plug>(qf_qf_prev)

" dz to delete surround and restore cursor position
nmap dz' mz<Plug>Dsurround'`zh
nmap dz" mz<Plug>Dsurround"`zh
nmap dz( mz<Plug>Dsurround)`zh
nmap dz[ mz<Plug>Dsurround]`zh
nmap dz{ mz<Plug>Dsurround}`zh
nmap dzp mz<Plug>Dsurround)`zh
nmap dz<Space> mz<Plug>Dsurround <Space>`zh
" z to surround inner word and restore cursor position
nmap z' mz<Plug>Csurround w'`zl
nmap z" mz<Plug>Csurround w"`zl
nmap z( mz<Plug>Csurround w)`zl
nmap z[ mz<Plug>Csurround w]`zl
nmap z{ mz<Plug>Csurround w}`zl
nmap zp mz<Plug>Csurround w)`zl
nmap z<Space> mz<Plug>Csurround w <Space>`zl
vmap z' <Plug>VSurround'
vmap z" <Plug>VSurround"
vmap z( <Plug>VSurround)
vmap z[ <Plug>VSurround]
vmap z{ <Plug>VSurround}
vmap zp <Plug>VSurround)
" Z to surround inner WORD and restore cursor position
nmap Z' mz<Plug>Csurround W'`zl
nmap Z" mz<Plug>Csurround W"`zl
nmap Z( mz<Plug>Csurround W)`zl
nmap Z[ mz<Plug>Csurround W]`zl
nmap Z{ mz<Plug>Csurround W}`zl
nmap Zp mz<Plug>Csurround W)`zl
nmap Z<Space> mz<Plug>Csurround W <Space>`zl
" ZZ to surround current line restore cursor position
nmap ZZ' mz<Plug>Yssurround'`z
nmap ZZ" mz<Plug>Yssurround"`z
nmap ZZ( mz<Plug>Yssurround)`z
nmap ZZ[ mz<Plug>Yssurround]`z
nmap ZZ{ mz<Plug>Yssurround}`z
nmap ZZp mz<Plug>Yssurround)`z

" ==============================================================================
" nvim-gtk settings
" ==============================================================================

if exists('g:GtkGuiLoaded')
  call rpcnotify(1, 'Gui', 'Font', 'PragmataPro Mono Liga 18')
endif

" ==============================================================================

" Notes to myself:
"
" 'o' in visual swaps cursor location
" g<C-a> in visual mode turns 1\n1\n1\n1 into 2\n3\n4\n5
" gi
" gv

" ==============================================================================
" Unicode goodies
" ==============================================================================

inoremap <C-u><< «
inoremap <C-u>>> »
inoremap <C-U><<< ⋘
inoremap <C-U>>>> ⋙
inoremap <C-u>not ¬
inoremap <C-u>+- ±
inoremap <C-u>-+ ∓
inoremap <C-u>` ´
inoremap <C-u>micro µ
inoremap <C-u>mult ×
inoremap <C-u>div ÷

inoremap <C-u>Gamma Γ
inoremap <C-u>Delta Δ
inoremap <C-u>Theta Θ
inoremap <C-u>Lambda Λ
inoremap <C-u>Xi Ξ
inoremap <C-u>Pi Π
inoremap <C-u>Sigma Σ
inoremap <C-u>Upsilon Υ
inoremap <C-u>Phi Φ
inoremap <C-u>Psi Ψ
inoremap <C-u>Omega Ω

inoremap <C-u>alpha α
inoremap <C-u>beta β
inoremap <C-u>gamma γ
inoremap <C-u>delta δ
inoremap <C-u>epsilon ε
inoremap <C-u>zeta ζ
inoremap <C-u>eta η
inoremap <C-u>theta θ
inoremap <C-u>iota ι
inoremap <C-u>kappa κ
inoremap <C-u>lambda λ
inoremap <C-u>mu μ
inoremap <C-u>nu ν
inoremap <C-u>xi ξ
inoremap <C-u>pi π
inoremap <C-u>rho ρ
inoremap <C-u>sigma σ
inoremap <C-u>tau τ
inoremap <C-u>upsilon υ
inoremap <C-u>phi φ
inoremap <C-u>chi χ
inoremap <C-u>psi ψ
inoremap <C-u>omega ω

inoremap <C-u>^0 ⁰
inoremap <C-u>^1 ¹
inoremap <C-u>^2 ²
inoremap <C-u>^3 ³
inoremap <C-u>^4 ⁴
inoremap <C-u>^5 ⁵
inoremap <C-u>^6 ⁶
inoremap <C-u>^7 ⁷
inoremap <C-u>^8 ⁸
inoremap <C-u>^9 ⁹

inoremap <C-u>^a ᵃ
inoremap <C-u>^b ᵇ
inoremap <C-u>^d ᵈ
inoremap <C-u>^e ᵉ
inoremap <C-u>^g ᵍ
inoremap <C-u>^i ⁱ
inoremap <C-u>^k ᵏ
inoremap <C-u>^m ᵐ
inoremap <C-u>^n ⁿ
inoremap <C-u>^o ᵒ
inoremap <C-u>^p ᵖ
inoremap <C-u>^t ᵗ
inoremap <C-u>^u ᵘ
inoremap <C-u>^v ᵛ

inoremap <C-u>^A ᴬ
inoremap <C-u>^B ᴮ
inoremap <C-u>^D ᴰ
inoremap <C-u>^E ᴱ
inoremap <C-u>^G ᴳ
inoremap <C-u>^H ᴴ
inoremap <C-u>^I ᴵ
inoremap <C-u>^J ᴶ
inoremap <C-u>^K ᴷ
inoremap <C-u>^L ᴸ
inoremap <C-u>^M ᴹ
inoremap <C-u>^N ᴺ
inoremap <C-u>^O ᴼ
inoremap <C-u>^P ᴾ
inoremap <C-u>^R ᴿ
inoremap <C-u>^T ᵀ
inoremap <C-u>^U ᵁ
inoremap <C-u>^W ᵂ

inoremap <C-u>^alpha ᵅ
inoremap <C-u>^beta ᵝ
inoremap <C-u>^gamma ᵞ
inoremap <C-u>^delta ᵟ
inoremap <C-u>^phi ᵠ
inoremap <C-u>^chi ᵡ

inoremap <C-u>_a ₐ
inoremap <C-u>_e ₑ
inoremap <C-u>_h ₕ
inoremap <C-u>_i ᵢ
inoremap <C-u>_k ₖ
inoremap <C-u>_l ₗ
inoremap <C-u>_m ₘ
inoremap <C-u>_n ₙ
inoremap <C-u>_o ₒ
inoremap <C-u>_p ₚ
inoremap <C-u>_r ᵣ
inoremap <C-u>_s ₛ
inoremap <C-u>_t ₜ
inoremap <C-u>_u ᵤ
inoremap <C-u>_v ᵥ
inoremap <C-u>_x ₓ

inoremap <C-u>_beta ᵦ
inoremap <C-u>_gamma ᵧ
inoremap <C-u>_rho ᵨ
inoremap <C-u>_phi ᵩ
inoremap <C-u>_chi ᵪ

inoremap <C-u>!! ‼
inoremap <C-u>?? ⁇
inoremap <C-u>?! ⁈
inoremap <C-u>!? ⁉
inoremap <C-u>_* ⁎

inoremap <C-u>^+ ⁺
inoremap <C-u>^- ⁻
inoremap <C-u>^= ⁼
inoremap <C-u>^( ⁽
inoremap <C-u>^) ⁾

inoremap <C-u>_0 ₀
inoremap <C-u>_1 ₁
inoremap <C-u>_2 ₂
inoremap <C-u>_3 ₃
inoremap <C-u>_4 ₄
inoremap <C-u>_5 ₅
inoremap <C-u>_6 ₆
inoremap <C-u>_7 ₇
inoremap <C-u>_8 ₈
inoremap <C-u>_9 ₉
inoremap <C-u>_+ ₊
inoremap <C-u>_- ₋
inoremap <C-u>_= ₌
inoremap <C-u>_( ₍
inoremap <C-u>_) ₎

inoremap <C-U>tm ™

inoremap <C-U><- ←
inoremap <C-U>-^ ↑
inoremap <C-U>-> →
inoremap <C-U>-v ↓
inoremap <C-U><~ ↜
inoremap <C-U>~> ↝
inoremap <C-U><<- ↞
inoremap <C-U>-^^ ↟
inoremap <C-U>->> ↠
inoremap <C-U>-vv ↡
inoremap <C-U><-( ↢
inoremap <C-U>)-> ↣
inoremap <C-U><-<Bar> ↤
inoremap <C-U><Bar>-^ ↥
inoremap <C-U><Bar>-> ↦
inoremap <C-U><Bar>-v ↧
inoremap <C-U></ ↩
inoremap <C-U>\> ↪
inoremap <C-U><= ⇐
inoremap <C-U>=^ ⇑
inoremap <C-U>=> ⇒
inoremap <C-U>=v ⇓
inoremap <C-U><=> ⇔
inoremap <C-U>^=v ⇕

inoremap <C-u>forall ∀
inoremap <C-u>exists ∃
inoremap <C-u>nexists ∄
inoremap <C-u>empty ∅
inoremap <C-u>incr ∆
inoremap <C-u>nabla ∇
inoremap <C-u>elem ∈
inoremap <C-u>nelem ∉
inoremap <C-u>selem ∊
inoremap <C-u>contains ∋
inoremap <C-u>ncontains ∌
inoremap <C-u>scontains ∍

inoremap <C-u>product ∏
inoremap <C-u>coproduct ∐
inoremap <C-u>sum ∑
inoremap <C-u>bullet ∙
inoremap <C-u>infinity ∞

inoremap <C-u>and ∧
inoremap <C-u>or ∨
inoremap <C-u>intersection ∩
inoremap <C-u>union ∪

inoremap <C-U>/= ≠
inoremap <C-U>=3 ≡
inoremap <C-U>/=3 ≢
inoremap <C-U>=< ≤
inoremap <C-U>>= ≥
inoremap <C-U>/< ≮
inoremap <C-U>/> ≯
inoremap <C-U>/=< ≰
inoremap <C-U>/>= ≱

inoremap <C-U>psubset ⊂
inoremap <C-U>psuperset ⊃
inoremap <C-U>/psubset ⊄
inoremap <C-U>/psuperset ⊅
inoremap <C-U>subset ⊆
inoremap <C-U>superset ⊇
inoremap <C-U>/subset ⊈
inoremap <C-U>/superset ⊉

inoremap <C-U>top ⊤
inoremap <C-U>bottom ⊥

inoremap <C-U>xor ⊻
inoremap <C-U>nand ⊼
inoremap <C-U>nor ⊽

inoremap <C-U>n-and ⋀
inoremap <C-U>n-or ⋁
inoremap <C-U>n-intersect ⋂
inoremap <C-U>n-union ⋃

inoremap <C-U>[[ ⟦
inoremap <C-U>]] ⟧
inoremap <C-U>[< ⟨
inoremap <C-U>>] ⟩
inoremap <C-U>[<< ⟪
inoremap <C-U>>>] ⟫

inoremap <C-U>{{ ⦃
inoremap <C-U>}} ⦄
inoremap <C-U>(( ⦅
inoremap <C-U>)) ⦆

inoremap <C-u>; ⨾

inoremap <C-U>bA 𝐀
inoremap <C-U>bB 𝐁
inoremap <C-U>bC 𝐂
inoremap <C-U>bD 𝐃
inoremap <C-U>bE 𝐄
inoremap <C-U>bF 𝐅
inoremap <C-U>bG 𝐆
inoremap <C-U>bH 𝐇
inoremap <C-U>bI 𝐈
inoremap <C-U>bJ 𝐉
inoremap <C-U>bK 𝐊
inoremap <C-U>bL 𝐋
inoremap <C-U>bM 𝐌
inoremap <C-U>bN 𝐍
inoremap <C-U>bO 𝐎
inoremap <C-U>bP 𝐏
inoremap <C-U>bQ 𝐐
inoremap <C-U>bR 𝐑
inoremap <C-U>bS 𝐒
inoremap <C-U>bT 𝐓
inoremap <C-U>bU 𝐔
inoremap <C-U>bV 𝐕
inoremap <C-U>bW 𝐖
inoremap <C-U>bX 𝐗
inoremap <C-U>bY 𝐘
inoremap <C-U>bZ 𝐙
inoremap <C-U>ba 𝐚
inoremap <C-U>bb 𝐛
inoremap <C-U>bc 𝐜
inoremap <C-U>bd 𝐝
inoremap <C-U>be 𝐞
inoremap <C-U>bf 𝐟
inoremap <C-U>bg 𝐠
inoremap <C-U>bh 𝐡
inoremap <C-U>bi 𝐢
inoremap <C-U>bj 𝐣
inoremap <C-U>bk 𝐤
inoremap <C-U>bl 𝐥
inoremap <C-U>bm 𝐦
inoremap <C-U>bn 𝐧
inoremap <C-U>bo 𝐨
inoremap <C-U>bp 𝐩
inoremap <C-U>bq 𝐪
inoremap <C-U>br 𝐫
inoremap <C-U>bs 𝐬
inoremap <C-U>bt 𝐭
inoremap <C-U>bu 𝐮
inoremap <C-U>bv 𝐯
inoremap <C-U>bw 𝐰
inoremap <C-U>bx 𝐱
inoremap <C-U>by 𝐲
inoremap <C-U>bz 𝐳

inoremap <C-U>iA 𝐴
inoremap <C-U>iB 𝐵
inoremap <C-U>iC 𝐶
inoremap <C-U>iD 𝐷
inoremap <C-U>iE 𝐸
inoremap <C-U>iF 𝐹
inoremap <C-U>iG 𝐺
inoremap <C-U>iH 𝐻
inoremap <C-U>iI 𝐼
inoremap <C-U>iJ 𝐽
inoremap <C-U>iK 𝐾
inoremap <C-U>iL 𝐿
inoremap <C-U>iM 𝑀
inoremap <C-U>iN 𝑁
inoremap <C-U>iO 𝑂
inoremap <C-U>iP 𝑃
inoremap <C-U>iQ 𝑄
inoremap <C-U>iR 𝑅
inoremap <C-U>iS 𝑆
inoremap <C-U>iT 𝑇
inoremap <C-U>iU 𝑈
inoremap <C-U>iV 𝑉
inoremap <C-U>iW 𝑊
inoremap <C-U>iX 𝑋
inoremap <C-U>iY 𝑌
inoremap <C-U>iZ 𝑍
inoremap <C-U>ia 𝑎
inoremap <C-U>ib 𝑏
inoremap <C-U>ic 𝑐
inoremap <C-U>id 𝑑
inoremap <C-U>ie 𝑒
inoremap <C-U>if 𝑓
inoremap <C-U>ig 𝑔
inoremap <C-U>ih ℎ
inoremap <C-U>ii 𝑖
inoremap <C-U>ij 𝑗
inoremap <C-U>ik 𝑘
inoremap <C-U>il 𝑙
inoremap <C-U>im 𝑚
inoremap <C-U>in 𝑛
inoremap <C-U>io 𝑜
inoremap <C-U>ip 𝑝
inoremap <C-U>iq 𝑞
inoremap <C-U>ir 𝑟
inoremap <C-U>is 𝑠
inoremap <C-U>it 𝑡
inoremap <C-U>iu 𝑢
inoremap <C-U>iv 𝑣
inoremap <C-U>iw 𝑤
inoremap <C-U>ix 𝑥
inoremap <C-U>iy 𝑦
inoremap <C-U>iz 𝑧

inoremap <C-U>biA 𝑨
inoremap <C-U>biB 𝑩
inoremap <C-U>biC 𝑪
inoremap <C-U>biD 𝑫
inoremap <C-U>biE 𝑬
inoremap <C-U>biF 𝑭
inoremap <C-U>biG 𝑮
inoremap <C-U>biH 𝑯
inoremap <C-U>biI 𝑰
inoremap <C-U>biJ 𝑱
inoremap <C-U>biK 𝑲
inoremap <C-U>biL 𝑳
inoremap <C-U>biM 𝑴
inoremap <C-U>biN 𝑵
inoremap <C-U>biO 𝑶
inoremap <C-U>biP 𝑷
inoremap <C-U>biQ 𝑸
inoremap <C-U>biR 𝑹
inoremap <C-U>biS 𝑺
inoremap <C-U>biT 𝑻
inoremap <C-U>biU 𝑼
inoremap <C-U>biV 𝑽
inoremap <C-U>biW 𝑾
inoremap <C-U>biX 𝑿
inoremap <C-U>biY 𝒀
inoremap <C-U>biZ 𝒁
inoremap <C-U>bia 𝒂
inoremap <C-U>bib 𝒃
inoremap <C-U>bic 𝒄
inoremap <C-U>bid 𝒅
inoremap <C-U>bie 𝒆
inoremap <C-U>bif 𝒇
inoremap <C-U>big 𝒈
inoremap <C-U>bih 𝒉
inoremap <C-U>bii 𝒊
inoremap <C-U>bij 𝒋
inoremap <C-U>bik 𝒌
inoremap <C-U>bil 𝒍
inoremap <C-U>bim 𝒎
inoremap <C-U>bin 𝒏
inoremap <C-U>bio 𝒐
inoremap <C-U>bip 𝒑
inoremap <C-U>biq 𝒒
inoremap <C-U>bir 𝒓
inoremap <C-U>bis 𝒔
inoremap <C-U>bit 𝒕
inoremap <C-U>biu 𝒖
inoremap <C-U>biv 𝒗
inoremap <C-U>biw 𝒘
inoremap <C-U>bix 𝒙
inoremap <C-U>biy 𝒚
inoremap <C-U>biz 𝒛

inoremap <C-U>sA 𝒜
inoremap <C-U>sB ℬ
inoremap <C-U>sC 𝒞
inoremap <C-U>sD 𝒟
inoremap <C-U>sE ℰ
inoremap <C-U>sF ℱ
inoremap <C-U>sG 𝒢
inoremap <C-U>sH ℋ
inoremap <C-U>sI ℐ
inoremap <C-U>sJ 𝒥
inoremap <C-U>sK 𝒦
inoremap <C-U>sL ℒ
inoremap <C-U>sM ℳ
inoremap <C-U>sN 𝒩
inoremap <C-U>sO 𝒪
inoremap <C-U>sP 𝒫
inoremap <C-U>sQ 𝒬
inoremap <C-U>sR ℛ
inoremap <C-U>sS 𝒮
inoremap <C-U>sT 𝒯
inoremap <C-U>sU 𝒰
inoremap <C-U>sV 𝒱
inoremap <C-U>sW 𝒲
inoremap <C-U>sX 𝒳
inoremap <C-U>sY 𝒴
inoremap <C-U>sZ 𝒵
inoremap <C-U>sa 𝒶
inoremap <C-U>sb 𝒷
inoremap <C-U>sc 𝒸
inoremap <C-U>sd 𝒹
inoremap <C-U>se ℯ
inoremap <C-U>sf 𝒻
inoremap <C-U>sg ℊ
inoremap <C-U>sh 𝒽
inoremap <C-U>si 𝒾
inoremap <C-U>sj 𝒿
inoremap <C-U>sk 𝓀
inoremap <C-U>sl ℓ
inoremap <C-U>sm 𝓂
inoremap <C-U>sn 𝓃
inoremap <C-U>so ℴ
inoremap <C-U>sp 𝓅
inoremap <C-U>sq 𝓆
inoremap <C-U>sr 𝓇
inoremap <C-U>ss 𝓈
inoremap <C-U>st 𝓉
inoremap <C-U>su 𝓊
inoremap <C-U>sv 𝓋
inoremap <C-U>sw 𝓌
inoremap <C-U>sx 𝓍
inoremap <C-U>sy 𝓎
inoremap <C-U>sz 𝓏

inoremap <C-U>sbA 𝓐
inoremap <C-U>sbB 𝓑
inoremap <C-U>sbC 𝓒
inoremap <C-U>sbD 𝓓
inoremap <C-U>sbE 𝓔
inoremap <C-U>sbF 𝓕
inoremap <C-U>sbG 𝓖
inoremap <C-U>sbH 𝓗
inoremap <C-U>sbI 𝓘
inoremap <C-U>sbJ 𝓙
inoremap <C-U>sbK 𝓚
inoremap <C-U>sbL 𝓛
inoremap <C-U>sbM 𝓜
inoremap <C-U>sbN 𝓝
inoremap <C-U>sbO 𝓞
inoremap <C-U>sbP 𝓟
inoremap <C-U>sbQ 𝓠
inoremap <C-U>sbR 𝓡
inoremap <C-U>sbS 𝓢
inoremap <C-U>sbT 𝓣
inoremap <C-U>sbU 𝓤
inoremap <C-U>sbV 𝓥
inoremap <C-U>sbW 𝓦
inoremap <C-U>sbX 𝓧
inoremap <C-U>sbY 𝓨
inoremap <C-U>sbZ 𝓩
inoremap <C-U>sba 𝓪
inoremap <C-U>sbb 𝓫
inoremap <C-U>sbc 𝓬
inoremap <C-U>sbd 𝓭
inoremap <C-U>sbe 𝓮
inoremap <C-U>sbf 𝓯
inoremap <C-U>sbg 𝓰
inoremap <C-U>sbh 𝓱
inoremap <C-U>sbi 𝓲
inoremap <C-U>sbj 𝓳
inoremap <C-U>sbk 𝓴
inoremap <C-U>sbl 𝓵
inoremap <C-U>sbm 𝓶
inoremap <C-U>sbn 𝓷
inoremap <C-U>sbo 𝓸
inoremap <C-U>sbp 𝓹
inoremap <C-U>sbq 𝓺
inoremap <C-U>sbr 𝓻
inoremap <C-U>sbs 𝓼
inoremap <C-U>sbt 𝓽
inoremap <C-U>sbu 𝓾
inoremap <C-U>sbv 𝓿
inoremap <C-U>sbw 𝔀
inoremap <C-U>sbx 𝔁
inoremap <C-U>sby 𝔂
inoremap <C-U>sbz 𝔃

inoremap <C-U>bAlpha 𝚨
inoremap <C-U>bBeta 𝚩
inoremap <C-U>bGamma 𝚪
inoremap <C-U>bDelta 𝚫
inoremap <C-U>bEpsilon 𝚬
inoremap <C-U>bZeta 𝚭
inoremap <C-U>bEta 𝚮
inoremap <C-U>bTheta 𝚯
inoremap <C-U>bIota 𝚰
inoremap <C-U>bKappa 𝚱
inoremap <C-U>bLambda 𝚲
inoremap <C-U>bMu 𝚳
inoremap <C-U>bNu 𝚴
inoremap <C-U>bXi 𝚵
inoremap <C-U>bOmnicron 𝚶
inoremap <C-U>bPi 𝚷
inoremap <C-U>bRho 𝚸
inoremap <C-U>bSigma 𝚺
inoremap <C-U>bTau 𝚻
inoremap <C-U>bUpsilon 𝚼
inoremap <C-U>bPhi 𝚽
inoremap <C-U>bChi 𝚾
inoremap <C-U>bPsi 𝚿
inoremap <C-U>bOmega 𝛀
inoremap <C-U>bNabla 𝛁
inoremap <C-U>balpha 𝛂
inoremap <C-U>bbeta 𝛃
inoremap <C-U>bgamma 𝛄
inoremap <C-U>bdelta 𝛅
inoremap <C-U>bepsilon 𝛆
inoremap <C-U>bzeta 𝛇
" inoremap <C-U>beta 𝛈
inoremap <C-U>btheta 𝛉
inoremap <C-U>biota 𝛊
inoremap <C-U>bkappa 𝛋
inoremap <C-U>blambda 𝛌
inoremap <C-U>bmu 𝛍
inoremap <C-U>bnu 𝛎
inoremap <C-U>bxi 𝛏
inoremap <C-U>bomnicron 𝛐
inoremap <C-U>bpi 𝛑
inoremap <C-U>brho 𝛒
inoremap <C-U>bfsigma 𝛓
inoremap <C-U>bsigma 𝛔
inoremap <C-U>btau 𝛕
inoremap <C-U>bupsilon 𝛖
inoremap <C-U>bphi 𝛗
inoremap <C-U>bchi 𝛘
inoremap <C-U>bpsi 𝛙
inoremap <C-U>bomega 𝛚
inoremap <C-U>bpdiff 𝛛

inoremap <C-U>iAlpha 𝛢
inoremap <C-U>iBeta 𝛣
inoremap <C-U>iGamma 𝛤
inoremap <C-U>iDelta 𝛥
inoremap <C-U>iEpsilon 𝛦
inoremap <C-U>iZeta 𝛧
inoremap <C-U>iEta 𝛨
inoremap <C-U>iTheta 𝛩
inoremap <C-U>iIota 𝛪
inoremap <C-U>iKappa 𝛫
inoremap <C-U>iLambda 𝛬
inoremap <C-U>iMu 𝛭
inoremap <C-U>iNu 𝛮
inoremap <C-U>iXi 𝛯
inoremap <C-U>iOmnicron 𝛰
inoremap <C-U>iPi 𝛱
inoremap <C-U>iRho 𝛲
inoremap <C-U>iSigma 𝛴
inoremap <C-U>iTau 𝛵
inoremap <C-U>iUpsilon 𝛶
inoremap <C-U>iPhi 𝛷
inoremap <C-U>iChi 𝛸
inoremap <C-U>iPsi 𝛹
inoremap <C-U>iOmega 𝛺
inoremap <C-U>iNabla 𝛻
inoremap <C-U>ialpha 𝛼
inoremap <C-U>ibeta 𝛽
inoremap <C-U>igamma 𝛾
inoremap <C-U>idelta 𝛿
inoremap <C-U>iepsilon 𝜀
inoremap <C-U>izeta 𝜁
inoremap <C-U>ieta 𝜂
inoremap <C-U>itheta 𝜃
inoremap <C-U>iiota 𝜄
inoremap <C-U>ikappa 𝜅
inoremap <C-U>ilambda 𝜆
inoremap <C-U>imu 𝜇
inoremap <C-U>inu 𝜈
inoremap <C-U>ixi 𝜉
inoremap <C-U>iomnicron 𝜊
inoremap <C-U>ipi 𝜋
inoremap <C-U>irho 𝜌
inoremap <C-U>ifsigma 𝜍
inoremap <C-U>isigma 𝜎
inoremap <C-U>itau 𝜏
inoremap <C-U>iupsilon 𝜐
inoremap <C-U>iphi 𝜑
inoremap <C-U>ichi 𝜒
inoremap <C-U>ipsi 𝜓
inoremap <C-U>iomega 𝜔
inoremap <C-U>ipdiff 𝜕

inoremap <C-U>biAlpha 𝜜
inoremap <C-U>biBeta 𝜝
inoremap <C-U>biGamma 𝜞
inoremap <C-U>biDelta 𝜟
inoremap <C-U>biEpsilon 𝜠
inoremap <C-U>biZeta 𝜡
inoremap <C-U>biEta 𝜢
inoremap <C-U>biTheta 𝜣
inoremap <C-U>biIota 𝜤
inoremap <C-U>biKappa 𝜥
inoremap <C-U>biLambda 𝜦
inoremap <C-U>biMu 𝜧
inoremap <C-U>biNu 𝜨
inoremap <C-U>biXi 𝜩
inoremap <C-U>biOmnicron 𝜪
inoremap <C-U>biPi 𝜫
inoremap <C-U>biRho 𝜬
inoremap <C-U>biSigma 𝜮
inoremap <C-U>biTau 𝜯
inoremap <C-U>biUpsilon 𝜰
inoremap <C-U>biPhi 𝜱
inoremap <C-U>biChi 𝜲
inoremap <C-U>biPsi 𝜳
inoremap <C-U>biOmega 𝜴
inoremap <C-U>biNabla 𝜵
inoremap <C-U>bialpha 𝜶
inoremap <C-U>bibeta 𝜷
inoremap <C-U>bigamma 𝜸
inoremap <C-U>bidelta 𝜹
inoremap <C-U>biepsilon 𝜺
inoremap <C-U>bizeta 𝜻
inoremap <C-U>bieta 𝜼
inoremap <C-U>bitheta 𝜽
inoremap <C-U>biiota 𝜾
inoremap <C-U>bikappa 𝜿
inoremap <C-U>bilambda 𝝀
inoremap <C-U>bimu 𝝁
inoremap <C-U>binu 𝝂
inoremap <C-U>bixi 𝝃
inoremap <C-U>biomnicron 𝝄
inoremap <C-U>bipi 𝝅
inoremap <C-U>birho 𝝆
inoremap <C-U>bifsigma 𝝇
inoremap <C-U>bisigma 𝝈
inoremap <C-U>bitau 𝝉
inoremap <C-U>biupsilon 𝝊
inoremap <C-U>biphi 𝝋
inoremap <C-U>bichi 𝝌
inoremap <C-U>bipsi 𝝍
inoremap <C-U>biomega 𝝎
inoremap <C-U>bipdiff 𝝏

inoremap <C-U>b0 𝟎
inoremap <C-U>b1 𝟏
inoremap <C-U>b2 𝟐
inoremap <C-U>b3 𝟑
inoremap <C-U>b4 𝟒
inoremap <C-U>b5 𝟓
inoremap <C-U>b6 𝟔
inoremap <C-U>b7 𝟕
inoremap <C-U>b8 𝟖
inoremap <C-U>b9 𝟗
