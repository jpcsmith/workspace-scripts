" --- Setup python paths
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

" --- General plugins
" Git control
call dein#add('tpope/vim-fugitive')
" File management
call dein#add('ctrlpvim/ctrlp.vim')
" File marks
call dein#add('kshenoy/vim-signature')
" Autocomplete
call dein#add('Shougo/deoplete.nvim')
" Snippets
call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')
" Linting & making
call dein#add('neomake/neomake')
" Advanced terminal
call dein#add('kassio/neoterm')
" Sub-buffers & windows
call dein#add('romainl/vim-qf')

" call dein#add('scrooloose/syntastic')
" call dein#add('Valloric/YouCompleteMe')
" call dein#add('Shougo/neosnippet.vim')
" call dein#add('Shougo/neosnippet-snippets')

" Status bar
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('altercation/vim-colors-solarized')

" C++
call dein#add('zchee/deoplete-clang')
call dein#add('octol/vim-cpp-enhanced-highlight')
call dein#add('brookhong/cscope.vim')
 
" " Python
" " call dein#add('zchee/deoplete-jedi')
" call dein#add('davidhalter/jedi-vim')
" call dein#add('klen/python-mode')
" 
" " PHP & Wordpress bundles
" call dein#add('dsawardekar/wordpress.vim')
" call dein#add('StanAngeloff/php.vim')
" call dein#add('shawncplus/phpcomplete.vim')
" 
" " Web
" call dein#add('cakebaker/scss-syntax.vim')
" 
" " Elm
" call dein#add('ElmCast/elm-vim')
" 
" " Plantuml
" call dein#add('aklt/plantuml-syntax')
" 
" " Javascript
" call dein#add('pangloss/vim-javascript')
" 
" " LaTeX
" call dein#add('lervag/vimtex')

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


"
" General configuration
"
"
" --- General functionality changes
" Enable local vimrc
set exrc secure
" Set backspace behaviour
set backspace=indent,eol,start
" Enable syntax highlighting
syntax enable
" Autocompletion settings
set completeopt="menuone,longest,preview"


" --- Style settings
" Tab size and spaces
set tabstop=4 shiftwidth=4 softtabstop=4
set expandtab ruler
" Set colour scheme. The order below matters.
set background=dark
colorscheme solarized


" --- Navigation and shortcuts
" Location list navigation.
nnoremap ]l :lnext<CR>
nnoremap [l :lprevious<CR>


" --- Neovim specific configuration
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


"
" Plugin settings
"
"
" --- Deoplete
let g:deoplete#enable_at_startup = 1
call deoplete#custom#set('clang', 'rank', 999)
" Clang customizations
let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"
let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-3.9/lib/libclang.so.1"


" --- Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"


" --- CtrlP
" Ignore generated directories
let g:ctrlp_custom_ignore = 'elm-stuff\|node_modules\|\.git$\|docs\|pycache'
" Search primarily by filename
let g:ctrlp_by_filename = 1
" Ignore byte-files, technically not a CtrlP setting
set wildignore=*.o,*.d,*.pyc,*.gch,*.plist


" --- Neomake
let g:neomake_list_height = 5
" Dont jump to the location-list when showing errors.
let g:neomake_open_list = 2

" --- UltiSnips
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" let g:UltiSnipsExpandTrigger = "<leader>e"
" let g:UltiSnipsJumpForwardTrigger = "<leader>e"
" let g:UltiSnipsEditSplit = "vertical"


" --- Cscope
nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>
" Disable message about database update
let g:cscope_silent = 1


" --- vim-qf 
" Hotkeys for toggling the location and quickfix windows
nmap <leader>l <Plug>QfLtoggle
nmap <leader>q <Plug>QfCtoggle

" 
" Functions
"
function! EnableTrimWhitespaceOnSave()
    " Description: Enables trimming whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e
endfunction


" let g:tex_flavor='latex'

" 
" function SetTextEditorDefaults()
"     " Description: Set the default values when using vim as a text editor.
"     
"     " Visually wrap lines on words
"     set wrap linebreak nolist breakindent
" 
"     " Switch on spell checking
"     setlocal spell spelllang=en_gb
" 
"     " Regular text-editor line navigation
"     nnoremap j gj
"     nnoremap k gk
"     vnoremap j gj
"     vnoremap k gk
" endfunction
" 
" 
" function ConfigureLaTeX()
"     set ts=2 sts=2 sw=2 number
" 
"     " Include dashes in autocomplete, etc.
"     set iskeyword+=-
" 
"     call SetTextEditorDefaults()
"     call SetTrimWhitespaceOnSave()
" endfunction
" 
" function ConfigureSCSS()
"     set tabstop=2 softtabstop=2 shiftwidth=2 colorcolumn=80 number 
"     set iskeyword+=\-
"     call SetTrimWhitespaceOnSave()
" endfunction
" 
" " Syntastic (SYN) {
"     " let g:syntastic_debug = 3
"     set statusline+=%#warningmsg#
"     set statusline+=%{SyntasticStatuslineFlag()}
"     set statusline+=%*
" 
"     let g:syntastic_always_populate_loc_list = 1
"     let g:syntastic_auto_loc_list = 1
"     let g:syntastic_check_on_open = 1
"     let g:syntastic_check_on_wq = 0
" 
"     let g:syntastic_python_python_exec = 'python3'
"     let g:syntastic_python_flake8_exec = 'flake8'
"     let g:syntastic_python_mypy_exec = 'mypy'
"     let g:syntastic_python_checkers = ['python', 'flake8']
"     " let g:syntastic_python_pylint_post_args='--max-line-length=80 --disable=W0511,C0330,C0413'
"     let g:syntastic_python_mypy_args='--almost-silent'
"     " let g:syntastic_python_flake8_post_args='--max-line-length=80 --ignore=F401'
"     let g:syntastic_python_mypy_quiet_messages = {
"                 \ 'regex': ['"bytes" has no attribute "hex"',
"                 \           '"int" has no attribute "name"',
"                 \           'Cannot find module named',
"                 \           'No library stub file for'] }
" 
"     " let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }
"     " autocmd FileType python noremap <silent> <F3> :SyntasticCheck mypy<CR>
"     autocmd FileType python noremap <silent> <F3> :SyntasticCheck pylint<CR>
"     autocmd FileType python noremap <silent> <F2> :SyntasticReset<CR>
"     autocmd FileType python command! Pylint SyntasticCheck pylint
"     autocmd FileType python command! Mypy SyntasticCheck mypy
" 
"     " SCSS
"     let g:syntastic_scss_checkers = ['scss_lint']
"     " Javascript
"     let g:syntastic_javascript_checkers = ['jshint', 'eslint']
"     " Typescript
"     let g:syntastic_typescript_checkers = ['tsc', 'tslint']
"     let g:syntastic_typescript_tsc_fname = ''
" 
"     let g:syntastic_rst_checkers = ['sphinx']
" 
" " }
" 
" 
" " Lazy filetype customizations (LFT) {
"     autocmd FileType python set cc=80
"     autocmd FileType python noremap <silent> <F4> :! clear && python3 %<CR>
"     autocmd FileType plantuml set ts=2 sts=2 sw=2 number
"     autocmd FileType elm set number cc=80
"     autocmd FileType typescript set ts=2 sts=2 sw=2 number
"     autocmd FileType tex call ConfigureLaTeX()
"     autocmd FileType javascript call SetTrimWhitespaceOnSave()
"     autocmd FileType scss call ConfigureSCSS()
"     autocmd FileType rst call SetTextEditorDefaults()
"     autocmd FileType cpp call ConfigureCpp()
"     autocmd FileType c call ConfigureC()
" " }
" 
" "
" " Pymode (PYM) {
"     let g:pymode_rope = 0
"     let g:pymode_rope_completion = 0
"     let g:pymode_rope_goto_definition_bind = '<leader>d'
"     let g:pymode_rope_goto_definition_cmd = 'edit'
" 
"     let g:pymode_python = 'python3'
" 
"     " Documentation
"     let g:pymode_doc = 1
"     let g:pymode_doc_key = 'K'
" 
"     "Linting
"     let g:pymode_lint = 0
"     let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'mccabe']
"     " Auto check on save
"     let g:pymode_lint_write = 1
" 
"     " Support virtualenv
"     let g:pymode_virtualenv = 0
" 
"     " Enable breakpoints plugin
"     let g:pymode_breakpoint = 1
"     let g:pymode_breakpoint_bind = '<leader>b'
" 
"     " syntax highlighting
"     let g:pymode_syntax = 1
"     let g:pymode_syntax_all = 1
"     let g:pymode_syntax_indent_errors = g:pymode_syntax_all
"     let g:pymode_syntax_space_errors = g:pymode_syntax_all
" 
"     " Don't autofold code
"     let g:pymode_folding = 0
" " }
" "
" " Neoterm (NTM) {
"     let g:neoterm_position = 'horizontal'
"     let g:neoterm_size = 15
"     let g:neoterm_automap_keys = ',tt'
"     let g:f5_args = ""
" 
"     nnoremap <silent> <f10> :TREPLSendFile<cr>
"     nnoremap <silent> <f9> :TREPLSend<cr>
"     vnoremap <silent> <f9> :TREPLSend<cr>
" 
"     " run set test lib
"     nnoremap <silent> <leader>rt :call neoterm#test#run('all')<cr>
"     nnoremap <silent> <leader>rf :call neoterm#test#run('file')<cr>
"     nnoremap <silent> <leader>rn :call neoterm#test#run('current')<cr>
"     nnoremap <silent> <leader>rr :call neoterm#test#rerun()<cr>
" 
"     " Useful maps
"     " hide/close terminal
"     nnoremap <silent> <leader>th :call neoterm#close()<cr>
"     " clear terminal
"     nnoremap <silent> <leader>tl :call neoterm#clear()<cr>
"     " kills the current job (send a <c-c>)
"     nnoremap <silent> <leader>tc :call neoterm#kill()<cr>
" 
" 
"     nnoremap <silent> <leader><F5> :let main_file = expand("%:p") <bar> echo "Main file set to :" expand("%:p") <cr>
"     nnoremap <silent> <F5> :call neoterm#do("clear && python3 " . main_file . " " . f5_args)  <cr>
"     nnoremap <silent> <leader><esc> :call neoterm#close() <bar> SyntasticReset<cr>
" " }
" "
" "
" " Elm-VIM (ELM)
" let g:elm_jump_to_error = 0
" let g:elm_make_output_file = "elm.js"
" let g:elm_make_show_warnings = 1
" let g:elm_syntastic_show_warnings = 1
" let g:elm_browser_command = ""
" let g:elm_detailed_complete = 0
" let g:elm_format_autosave = 0
" let g:elm_setup_keybindings = 1
" let g:elm_classic_hightlighting = 0
" 
" let g:elm_format_autosave = 1
" 
" autocmd FileType elm call deoplete#enable()
" let g:deoplete#omni_patterns = {}
" let g:deoplete#omni_patterns.elm = '\.'
" 
" if !exists('g:deoplete#omni#input_patterns')
"       let g:deoplete#omni#input_patterns = {}
"   endif
"   let g:deoplete#omni#input_patterns.tex = '\\(?:'
"         \ .  '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
"         \ . '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
"         \ . '|hyperref\s*\[[^]]*'
"         \ . '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"         \ . '|(?:include(?:only)?|input)\s*\{[^}]*'
"         \ . '|\w*(gls|Gls|GLS)(pl)?\w*(\s*\[[^]]*\]){0,2}\s*\{[^}]*'
"         \ . '|includepdf(\s*\[[^]]*\])?\s*\{[^}]*'
"         \ . '|includestandalone(\s*\[[^]]*\])?\s*\{[^}]*'
"         \ .')'
