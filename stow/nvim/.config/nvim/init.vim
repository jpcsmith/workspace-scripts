" --- Setup python paths
let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/bin/python3'

let mapleader = "\\"


call plug#begin('~/.local/share/nvim/plugged')

" --- General plugins
" Git control
Plug 'tpope/vim-fugitive'
" File management
Plug 'ctrlpvim/ctrlp.vim'
" File marks
Plug 'kshenoy/vim-signature'
" Linting & making
Plug 'neomake/neomake'
" Colourscheme
Plug 'morhetz/gruvbox'
" Status bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" --- Filetype plugins
" Docker
Plug 'ekalinin/Dockerfile.vim'
" TOML
Plug 'cespare/vim-toml'
" Python
Plug 'python-mode/python-mode'
" LaTeX
Plug 'lervag/vimtex'

call plug#end()


" " Autocomplete
" call dein#add('Shougo/deoplete.nvim')
" " Snippets
" call dein#add('SirVer/ultisnips')
" call dein#add('honza/vim-snippets')
" " Advanced terminal
" call dein#add('kassio/neoterm')
" " Sub-buffers & windows
" call dein#add('romainl/vim-qf')
" 
" 
" call dein#add('Rip-Rip/clang_complete', {
"     \ 'on_ft': 'cpp',
"     \ 'hook_add': "
"     \ let g:clang_library_path = '/usr/lib/llvm-7/lib/libclang.so.1'\n
"     \ let g:clang_jumpto_declaration_key = ''\n
"     \ "
" \ })
" 
" " Syntax highlighting
" call dein#add('octol/vim-cpp-enhanced-highlight', {'on_ft': 'cpp'})
" 
" " Navigation between header and source files
" call dein#add('nacitar/a.vim', {'on_ft': 'cpp', 'hook_add': "
"             \ let g:alternateNoDefaultAlternate = 1\n
"             \ let g:alternateSearchPath = 'sfr:../source,sfr:../src,sfr:../include,sfr:../inc,wdr:./include,wdr:./src' . ',reg:/include/src//,reg:/src/include//'\n
"             \"
"             \})
" 
" " Navigation to function declaration and usage
" 
" " s: Find this C symbol
" " g: Find this definition
" " d: Find functions called by this function
" " c: Find functions calling this function
" " t: Find this text string
" " e: Find this egrep pattern
" " f: Find this file
" " i: Find files #including this file
" call dein#add('brookhong/cscope.vim', {
"  \ 'hook_add': "
"  \ nnoremap <leader>fa :call CscopeFindInteractive(expand('<cword>'))<CR>\n
"  \ nnoremap <leader>l :call ToggleLocationList()<CR>\n
"  \ nnoremap  <leader>fs :call CscopeFind('s', expand('<cword>'))<CR>\n
"  \ nnoremap  <leader>fg :call CscopeFind('g', expand('<cword>'))<CR>\n
"  \ nnoremap  <leader>fd :call CscopeFind('d', expand('<cword>'))<CR>\n
"  \ nnoremap  <leader>fc :call CscopeFind('c', expand('<cword>'))<CR>\n
"  \ nnoremap  <leader>ft :call CscopeFind('t', expand('<cword>'))<CR>\n
"  \ nnoremap  <leader>fe :call CscopeFind('e', expand('<cword>'))<CR>\n
"  \ nnoremap  <leader>ff :call CscopeFind('f', expand('<cword>'))<CR>\n
"  \ nnoremap  <leader>fi :call CscopeFind('i', expand('<cword>'))<CR>\n
"  \ let g:cscope_silent = 1\n
"  \"
"  \})
" 
" " Automatic reformatting of source files
" call dein#add('rhysd/vim-clang-format', {'on_ft': 'cpp'})
" 
" " call dein#add('ludovicchabant/vim-gutentags', {
" "     \ 'hook_add': "
" "     \ let g:gutentags_ctags_tagfile = 'tags'\n
" "     \ let g:gutentags_ctags_exclude = ['*.py', '_build']\n
" "     \ "
" " \ })
" 
" call dein#add('pboettch/vim-cmake-syntax')

if has("autocmd")
    augroup templates
        autocmd BufNewFile setup.py 0r ~/.config/nvim/templates/skeleton-setup.py
    augroup END
endif

"
" General configuration
"
"
" --- General Functionality changes
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
set termguicolors
" Set colour scheme. The order below matters.
set background=light
" set background=dark
let g:gruvbox_italic=1
colorscheme gruvbox

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


" Causes issues with resizing (https://github.com/vim/vim/issues/931).
" let g:qf_loclist_window_bottom = 0
" let g:qf_window_bottom = 0

" Annoying with Neomake, but only on Vim?!
" Even with let `g:neomake_open_list = 2` !
" let g:qf_auto_open_quickfix = 0
" let g:qf_auto_open_loclist = 0

" --- Default tex style
let g:tex_flavor = "context"


"
" Plugin settings
"
"
" " --- Deoplete
" let g:deoplete#enable_at_startup = 0
" call deoplete#custom#source('clang', 'rank', 999)
" call deoplete#custom#source('jedi', 'rank', 999)
" " Clang customizations
" let g:deoplete#sources#clang#clang_header = "/usr/lib/clang"
" let g:deoplete#sources#clang#libclang_path = "/usr/lib/llvm-7.0/lib/libclang.so.1"
" let g:deoplete#sources#clang#executable = "/usr/bin/clang"
" let g:deoplete#sources#clang#sort_algo = 'priority'
" let g:deoplete#sources#clang#flags = ['-std=c++14']


" --- Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme = 'solarized'


" --- CtrlP
" Ignore generated directories
let g:ctrlp_custom_ignore = 'elm-stuff\|node_modules\|\.git$\|docs\|pycache\|site-packages\|_build\|build\|build-tools\|third-party/depot-tools\|third-party/quic-sample-server\|env'
" Search primarily by filename
let g:ctrlp_by_filename = 1
let g:ctrlp_follow_symlinks=1
" Ignore byte-files, technically not a CtrlP setting
set wildignore=*.o,*.d,*.pyc,*.gch,*.plist,*.fdb_latexmk,*.run.xml,*.blg,*.bbl,*.pdf,*.out,*.fls,*.aux,*.bcf,*.synctex.gz
" Use custom matcher
" let g:ctrlp_match_func = {'match' : 'matcher#cmatch'}


" --- Neomake
function! RunNeomakeForHeader()
    " Description: If the header file exists
    if filereadable(expand('%:p.cpp'))
        execute("Neomake")
    endif
endfunction

let g:neomake_list_height = 5
" Dont jump to the location-list when showing errors.
let g:neomake_open_list = 2
" Make on save
autocmd! BufWritePost * Neomake
" autocmd! BufWritePost *.h call RunNeomakeForHeader()
noremap <F5> :Neomake!<CR>
" Manually reset errors
noremap <silent> <leader>cls :sign unplace *<CR>:set signcolumn=auto<CR>


" --- UltiSnips
let g:UltiSnipsSnippetsDir = "~/.config/nvim/UltiSnips"
let g:UltiSnipsSnippetDirectories = ["UltiSnips"]
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger = "<leader>e"
" let g:UltiSnipsJumpForwardTrigger = "<leader>e"
" let g:UltiSnipsEditSplit = "vertical"

" --- vim-qf
" Hotkeys for toggling the location and quickfix windows
nmap <leader>l <Plug>QfLtoggle
nmap <leader>q <Plug>QfCtoggle

" --- Enable LaTeX
let g:tex_flavor = 'latex'

" --- Enable syntax highligting for snakemake
au BufNewFile,BufRead Snakefile set syntax=snakemake | set filetype=snakemake
au BufNewFile,BufRead *.smk set syntax=snakemake
" autocommand to detect .spthy and .sapic files
augroup filetypedetect
au BufNewFile,BufRead *.spthy	setf spthy
au BufNewFile,BufRead *.sapic	setf sapic
augroup END

"
" Functions
"
function! EnableTrimWhitespaceOnSave()
    " Description: Enables trimming whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e
endfunction

function! SetTextEditorDefaults()
    " Description: Set the default values when using vim as a text editor.

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
