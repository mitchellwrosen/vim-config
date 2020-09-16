" Escape to quit little annoying temporary buffers
nnoremap <silent> <buffer> <Esc> :bw!<CR>
" Unmap Esc quitting terminal mode, so fzf handles it (result: one Esc closes fzf)
tunmap <buffer> <Esc>
