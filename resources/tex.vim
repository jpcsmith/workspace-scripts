set ts=2 sts=2 sw=2 number

" Include dashes in autocomplete, etc.
set iskeyword+=-
let g:tex_conceal = "admg"

" Conceal literal curly braces
" call matchadd('Conceal', '{\\{', 10, 50, {'conceal': '{'})
" call matchadd('Conceal', '\\}}', 10, 51, {'conceal': '}'})

call SetTextEditorDefaults()
call EnableTrimWhitespaceOnSave()

let g:neomake_tex_enabled_makers = ['chktex']

" Set colour scheme. The order below matters.
" set background=light
" colorscheme solarized
