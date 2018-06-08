" --- General
set tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=80 number
" set tabstop=4 softtabstop=4 shiftwidth=4 colorcolumn=80 number
" Trim whitespaces when the file is saved
call EnableTrimWhitespaceOnSave()
" --- Style config
set cinoptions=(0,g0,N-s,Ws

let g:neomake_cpp_clangcheck_args = ['-extra-arg=-fno-diagnostics-color', '-extra-arg=-Wno-unknown-warning-option', '%:p:r.cpp']
let g:neomake_cpp_clangcheck_append_file = 0
let g:neomake_cpp_enabled_makers = ['clangtidy', 'clangcheck']
let g:neomake_cpp_clangtidy_args = ['%:p:r.cpp']
let g:neomake_cpp_clangtidy_append_file = 0


let g:clang_format#auto_format = 1



