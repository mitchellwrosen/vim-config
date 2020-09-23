" <Space>ff to find-function (ag can match over multiple lines)
" <Space>ft to find-type (ripgrep is faster)
nnoremap <buffer> <Space>ff :Ag (<Bslash>b)<C-r><C-w><Bslash>b[ <Bslash>t<Bslash>n]+::<CR>
nnoremap <buffer> <Space>ft :Rg (((data<Bar>newtype<Bar>type)\s+)<Bar>class .*)\b<C-r><C-w>\b<CR>
nnoremap <buffer> <Space>fa :Rgu (<C-r><C-w>\b\s+::)<Bar>((data(\sfamily)?<Bar>newtype<Bar>type(\sfamily)?)\s+<C-r><C-w>\b)<Bar>(class\s+(\(.*\)\s+=>\s+)?<C-r><C-w>\b\s+where)<CR>

nnoremap <buffer> <silent> <Space>d :call RunOrmolu()<CR>
