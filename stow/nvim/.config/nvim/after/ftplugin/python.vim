" --- pymode
let g:pymode_rope = 0
let g:pymode_rope_completion = 0
let g:pymode_rope_goto_definition_bind = '<leader>d'
let g:pymode_rope_goto_definition_cmd = 'edit'
let g:pymode_python = 'python3'
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 0
" Auto check on save
let g:pymode_lint_write = 0
" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0
set nofoldenable


" --- Disable GutenTags as its causing slowdown
let g:gutentags_enabled = 0

" --- Enable mypy as a maker
let g:neomake_python_enabled_makers=["python","flake8","pylint","mypy"]
