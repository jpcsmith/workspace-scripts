set number
set colorcolumn=89

autocmd BufWritePre * %s/\s\+$//e
