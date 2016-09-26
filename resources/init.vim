" Setup python paths
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath^=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.config/nvim/dein/'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:

" General plugins
call dein#add('tpope/vim-fugitive')
call dein#add('ctrlpvim/ctrlp.vim')
call dein#add('kshenoy/vim-signature')
" call dein#add('Valloric/YouCompleteMe')
call dein#add('Shougo/deoplete.nvim')
call dein#add('kassio/neoterm')
call dein#add('scrooloose/syntastic')
call dein#add('neomake/neomake')

" Status bar
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('altercation/vim-colors-solarized')

" Python
" call dein#add('zchee/deoplete-jedi')
call dein#add('davidhalter/jedi-vim')
call dein#add('klen/python-mode')

" PHP & Wordpress bundles
call dein#add('dsawardekar/wordpress.vim')
call dein#add('StanAngeloff/php.vim')
call dein#add('shawncplus/phpcomplete.vim')

" Web
call dein#add('cakebaker/scss-syntax.vim')

" Elm
call dein#add('ElmCast/elm-vim')

" Plantuml
call dein#add('aklt/plantuml-syntax')

" Javascript
call dein#add('pangloss/vim-javascript')

" LaTeX
call dein#add('lervag/vimtex')

" call dein#add('Shougo/neosnippet.vim')
" call dein#add('Shougo/neosnippet-snippets')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

function SetTrimWhitespaceOnSave()
    autocmd BufWritePre * %s/\s\+$//e
endfunction

function SetTextEditorDefaults()
    " Visually wrap lines on words
    set wrap linebreak nolist breakindent
    " Switch on spell checking
    setlocal spell spelllang=en_gb
    " Regular text-editor line navigation
    nnoremap j gj
    nnoremap k gk
    vnoremap j gj
    vnoremap k gk
endfunction


function ConfigureLaTeX()
    set ts=2 sts=2 sw=2 number

    " Include dashes in autocomplete, etc.
    set iskeyword+=-

    call SetTextEditorDefaults()
    call SetTrimWhitespaceOnSave()
endfunction


" Neovim (NEO) {
    " Clear search highlight on screen redraw
    nnoremap <silent> <C-l> :nohlsearch<CR><C-l>

    " Exit terminal
    tnoremap <Esc> <C-\><C-n>

    " Move between windows
    tnoremap <A-h> <C-\><C-n><C-w>h
    tnoremap <A-j> <C-\><C-n><C-w>j
    tnoremap <A-k> <C-\><C-n><C-w>k
    tnoremap <A-l> <C-\><C-n><C-w>l
    nnoremap <A-h> <C-w>h
    nnoremap <A-j> <C-w>j
    nnoremap <A-k> <C-w>k
    nnoremap <A-l> <C-w>l
" }

" Use deoplete.
let g:deoplete#enable_at_startup = 1

" Airline (AIR) {
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
      let g:airline_symbols = {}
    endif
    let g:airline_symbols.space = "\ua0"
" }

" CtrlP (CTP) {
    let g:ctrlp_custom_ignore = 'elm-stuff\|node_modules\|git\|docs\|pycache\|*.pyc'
" }

" Neomake (NEO) {
" let g:neomake_python_enabled_markers = ['python', 'flake8', 'pylint']
" }

" Syntastic (SYN) {
    " let g:syntastic_debug = 3
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_python_python_exec = 'python3'
    let g:syntastic_python_flake8_exec = 'flake8'
    let g:syntastic_python_mypy_exec = 'mypy'
    let g:syntastic_python_checkers = ['python', 'flake8', 'pylint']
    let g:syntastic_python_pylint_post_args='--max-line-length=80 --disable=W0511,C0330,C0413'
    let g:syntastic_python_mypy_args='--almost-silent'
    " let g:syntastic_python_flake8_post_args='--max-line-length=80 --ignore=F401'
    let g:syntastic_python_mypy_quiet_messages = {
                \ 'regex': ['"bytes" has no attribute "hex"',
                \           '"int" has no attribute "name"',
                \           'Cannot find module named',
                \           'No library stub file for'] }

    " let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
    autocmd FileType python noremap <silent> <F3> :SyntasticCheck mypy<CR>
    autocmd FileType python noremap <silent> <F2> :SyntasticReset<CR>
    autocmd FileType python command! Pylint SyntasticCheck pylint
    autocmd FileType python command! Mypy SyntasticCheck mypy

    " SCSS
    let g:syntastic_scss_checkers = ['scss_lint']
    " Javascript
    let g:syntastic_javascript_checkers = ['jshint', 'eslint']
    " Typescript
    let g:syntastic_typescript_checkers = ['tsc', 'tslint']
    let g:syntastic_typescript_tsc_fname = ''

    let g:syntastic_rst_checkers = ['sphinx']

" }

" General (GEN) {
    " Customize editor
    " automatically change window's cwd to file's cwd
    " set autochdir

    " Tab size and spaces
    set tabstop=4
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set backspace=2 ruler

    syntax enable
    " let g:solarized_termcolors=16
    " Solarized
    " set t_Co=256
    " let g:solarized_visibility = "high"
    " let g:solarized_contrast = "high"
    set background=dark
    colorscheme solarized

    set completeopt="menuone,longest"

    " Location list navigation.
    nnoremap ]l :lnext<CR>
    nnoremap [l :lprevious<CR>

    let g:tex_flavor='latex'
" }

" Lazy filetype customizations (LFT) {
    autocmd FileType python set cc=80
    autocmd FileType python noremap <silent> <F4> :! clear && python3 %<CR>
    autocmd FileType plantuml set ts=2 sts=2 sw=2 number
    autocmd FileType elm set number cc=80
    autocmd FileType typescript set ts=2 sts=2 sw=2 number
    autocmd FileType tex call ConfigureLaTeX()
    autocmd FileType javascript call SetTrimWhitespaceOnSave()
    autocmd FileType scss set ts=2 sts=2 sw=2 number cc=80 <Bar> call SetTrimWhitespaceOnSave()
    autocmd FileType rst call SetTextEditorDefaults()
" }

"
" Pymode (PYM) {
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
    let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
    " Auto check on save
    let g:pymode_lint_write = 1

    " Support virtualenv
    let g:pymode_virtualenv = 0

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
" }
"
" Neoterm (NTM) {
    let g:neoterm_position = 'horizontal'
    let g:neoterm_size = 15
    let g:neoterm_automap_keys = ',tt'
    let g:f5_args = ""

    nnoremap <silent> <f10> :TREPLSendFile<cr>
    nnoremap <silent> <f9> :TREPLSend<cr>
    vnoremap <silent> <f9> :TREPLSend<cr>

    " run set test lib
    nnoremap <silent> <leader>rt :call neoterm#test#run('all')<cr>
    nnoremap <silent> <leader>rf :call neoterm#test#run('file')<cr>
    nnoremap <silent> <leader>rn :call neoterm#test#run('current')<cr>
    nnoremap <silent> <leader>rr :call neoterm#test#rerun()<cr>

    " Useful maps
    " hide/close terminal
    nnoremap <silent> <leader>th :call neoterm#close()<cr>
    " clear terminal
    nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
    " kills the current job (send a <c-c>)
    nnoremap <silent> <leader>tc :call neoterm#kill()<cr>


    nnoremap <silent> <leader><F5> :let main_file = expand("%:p") <bar> echo "Main file set to :" expand("%:p") <cr>
    nnoremap <silent> <F5> :call neoterm#do("clear && python3 " . main_file . " " . f5_args)  <cr>
    nnoremap <silent> <leader><esc> :call neoterm#close() <bar> SyntasticReset<cr>
" }
"
"
" Neomake (NMK) {
    let g:neomake_open_list = 2
    let g:neomake_python_enabled_makers = ['python', 'flake8', 'pylint']
    " autocmd BufWritePost * Neomake
" }


" Elm-VIM (ELM)
let g:elm_jump_to_error = 0
let g:elm_make_output_file = "elm.js"
let g:elm_make_show_warnings = 0
let g:elm_syntastic_show_warnings = 0
let g:elm_browser_command = ""
let g:elm_detailed_complete = 0
let g:elm_format_autosave = 0
let g:elm_setup_keybindings = 1
let g:elm_classic_hightlighting = 0

let g:elm_format_autosave = 1

autocmd FileType elm call deoplete#enable()
let g:deoplete#omni_patterns = {}
let g:deoplete#omni_patterns.elm = '\.'

if !exists('g:deoplete#omni#input_patterns')
      let g:deoplete#omni#input_patterns = {}
  endif
  let g:deoplete#omni#input_patterns.tex = '\\(?:'
        \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \ . '|hyperref\s*\[[^]]*'
        \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
        \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
        \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
        \ .')'
