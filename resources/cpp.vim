" --- General
set tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=80 number
" set tabstop=4 softtabstop=4 shiftwidth=4 colorcolumn=80 number
" Trim whitespaces when the file is saved
call EnableTrimWhitespaceOnSave()
" --- Style config
set cinoptions=(0,g0,N-s,Ws

" let g:neomake_cpp_clangcheck_exe = 'cpplintwrapper'
" let g:neomake_cpp_clangcheck_args = ['clang-check', '-extra-arg=-fno-diagnostics-color', '-extra-arg=-Wno-unknown-warning-option']
let g:neomake_cpp_enabled_makers = ['clangtidy']
let g:neomake_cpp_clangtidy_exe = 'cpplintwrapper'
let g:neomake_cpp_clangtidy_args = ['clang-tidy']


let g:clang_format#auto_format = 1



