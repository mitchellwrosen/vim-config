" TODO
" insert when focus terminal
" Space-/ BLines
" make surrounding with quotes repeatable

lua require('init')

" ==============================================================================
" Plugin settings
" ==============================================================================

command! -bar BCommits call fzf#vim#buffer_commits(1)

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

sign define LspDiagnosticsErrorSign text=✗ texthl=LspDiagnosticsError linehl= numhl=
sign define LspDiagnosticsWarningSign text=⚠ texthl=LspDiagnosticsWarning linehl= numhl=
sign define LspDiagnosticsInformationSign text=ℹ texthl=LspDiagnosticsInformation linehl= numhl=
sign define LspDiagnosticsHintSign text=➤ texthl=LspDiagnosticsHint linehl= numhl=

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

" Notes to myself:
"
" 'o' in visual swaps cursor location
" g<C-a> in visual mode turns 1\n1\n1\n1 into 2\n3\n4\n5
" gi
" gv
