" --- General
set tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=80 number 
" Trim whitespaces when the file is saved
call EnableTrimWhitespaceOnSave()
" --- Style config
set cinoptions=(0,g0

let g:neomake_cpp_enabled_makers = ['clangcheck', 'clangtidy']

let g:gutentags_ctags_exclude = ['*.py']
