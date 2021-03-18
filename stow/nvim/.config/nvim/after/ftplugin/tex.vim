set ts=2 sts=2 sw=2 number

" Include dashes in autocomplete, etc.
set iskeyword+=-
" let g:tex_conceal = "admg"

call SetTextEditorDefaults()
call EnableTrimWhitespaceOnSave()

let g:neomake_enabled_makers = ['makeprg']
let g:neomake_tex_chktex_args = ['--nowarn', '1']
let g:neomake_tex_pdflatex_errorformat =  '%-G%.%#'
let g:neomake_tex_latexrun_args = ['--color', 'never', '-O', 'build', '-o', 'build/latexrun-file.pdf']
let g:neomake_tex_latexrun_errorformat = '%f:%l:%trror: %m,' . '%f: %tarning: %m,' . '%f: %trror: %m'
" let g:neomake_tex_latexrun_errorformat = '%f:\ %t%*[^0-9]:%m,' . '%tarning\ None \None\ %m'

let g:neomake_tex_latexmk_maker = {
            \ 'exe': 'latexmk',
            \ 'args': ['-pdf', '-halt-on-error', '-outdir=build'],
            \ }

let g:neomake_tex_enabled_makers = ['chktex', 'lacheck', 'proselint', 'latexrun']

setlocal spell spelllang=en_gb
nnoremap <Leader>m :Neomake!<ESC>
autocmd! BufWritePost * Neomake!





" Set colour scheme. The order below matters.
" set background=light
" colorscheme pencil
