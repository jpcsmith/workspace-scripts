" Include dashes in autocomplete, etc.
set iskeyword+=-

call SetTextEditorDefaults()
call EnableTrimWhitespaceOnSave()

" Use US-english for NetSec writing
setlocal spell spelllang=en_gb

let g:instant_markdown_mathjax = 1
let g:vim_markdown_folding_disabled = 1
