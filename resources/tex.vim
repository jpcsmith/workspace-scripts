set ts=2 sts=2 sw=2 number

" Include dashes in autocomplete, etc.
set iskeyword+=-
let g:tex_conceal = "admg"

call SetTextEditorDefaults()
call EnableTrimWhitespaceOnSave()

let g:neomake_tex_chktex_args = ['--nowarn', '1']
let g:neomake_tex_pdflatex_errorformat =  '%-G%.%#'

let g:vimtex_latexmk_callback = 0
let g:neomake_tex_enabled_makers = ['chktex', 'pdflatex', 'rubberinfo']

" Use US-english for NetSec writing
setlocal spell spelllang=en_us

" Set colour scheme. The order below matters.
set background=light
colorscheme pencil