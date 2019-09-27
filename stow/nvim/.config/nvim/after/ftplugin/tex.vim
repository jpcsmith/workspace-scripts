set ts=2 sts=2 sw=2 number

" Include dashes in autocomplete, etc.
set iskeyword+=-
let g:tex_conceal = "admg"

call SetTextEditorDefaults()
call EnableTrimWhitespaceOnSave()

let g:neomake_tex_chktex_args = ['--nowarn', '1']
let g:neomake_tex_pdflatex_errorformat =  '%-G%.%#'
let g:neomake_tex_enabled_makers = ['chktex', 'rubberinfo', 'lacheck', 'proselint']

let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_format_enabled = 1
let g:vimtex_compiler_latexmk = {'continuous': 0}
" let g:vimtex_compiler_latexmk = {
"       \ 'build_dir' : 'build',
"       \ 'continuous' : 0,
"       \}

setlocal spell spelllang=en_gb

" Set colour scheme. The order below matters.
" set background=light
" colorscheme pencil
