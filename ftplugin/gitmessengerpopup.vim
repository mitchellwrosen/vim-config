function! <SID>init_gitmessengerpopup() abort
  nmap <buffer><Enter> q
  nmap <buffer><Esc> q
  nmap <buffer>h o
  nmap <buffer>l O
endfunction
autocmd mitchellwrosen FileType gitmessengerpopup call <SID>init_gitmessengerpopup()
