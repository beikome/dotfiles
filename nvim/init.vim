" init {{{
" ====================================================================================================
set shellslash

" }}}

"  os / neovim / screen {{{
" ====================================================================================================
 let s:is_mac = has('mac')
 let s:is_linux = !s:is_mac && has('unix')
 let s:is_nvim = has('nvim')
 let s:nvim_dir = expand('~/.config/nvim')

" }}}

" dein {{{
"
" ====================================================================================================
" Install dein
" ---------------------------------------------------------------------------------------------------
let s:dein_dir = s:nvim_dir . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'
if &runtimepath !~# '/dein.vim'
    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
    endif
    execute 'set runtimepath^=' . s:dein_repo_dir
endif

" Load toml
" ----------------------------------------------------------------------------------------------------
if dein#load_state(s:dein_dir)
    let s:dein_toml = s:nvim_dir . '/dein.toml'
    let s:dein_lazy_toml = s:nvim_dir . '/dein_lazy.toml'
    call dein#begin(s:dein_dir)
    call dein#load_toml(s:dein_toml, {'lazy': 0})
    call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
    call dein#end()
    call dein#save_state()
endif

" Install plugins
" ----------------------------------------------------------------------------------------------------
if dein#check_install()
    call dein#install()
endif

" }}}

" flags {{{
" ====================================================================================================
" Common
" ---------------------------------------------------------------------------------------------------
filetype plugin indent on
syntax on

" File
" ---------------------------------------------------------------------------------------------------
set autoread
augroup vimrc-checktime
    autocmd!
    autocmd WinEnter * checktime
augroup END

set noautochdir
set hidden
set noswapfile
set backupdir=>/tmp
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set noundofile

augroup DeleteSpace
    autocmd!
    autocmd bufwritepre * :%s/\s\+$//ge
augroup end

" History
" ---------------------------------------------------------------------------------------------------
set history=1000

" Indent
" ---------------------------------------------------------------------------------------------------
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set smartindent
set shiftwidth=4
set shiftround

augroup FileDependentIndentSettings
    autocmd!
    autocmd FileType html setlocal ts=2 sw=2
augroup end

" Bell
" ---------------------------------------------------------------------------------------------------
set t_vb=
set novisualbell

" Search
" ---------------------------------------------------------------------------------------------------
set wrapscan
set ignorecase
set smartcase
set incsearch
set hlsearch
set wildmenu
set wildmode=longest:full,full

" Input Assist
" ---------------------------------------------------------------------------------------------------
set backspace=indent,eol,start
set formatoptions=lmoq
set whichwrap=b,s,h,l,<,>,[,]

" No Swap File
" ---------------------------------------------------------------------------------------------------
set nowritebackup
set nobackup
set noswapfile

" Clipboard
" ----------------------------------------------------------------------------------------------------
set clipboard+=unnamed,unnamedplus

" View
" ----------------------------------------------------------------------------------------------------
set showmatch
set matchpairs& matchpairs+=<:>
set showcmd
set showmode
set number
set nowrap
set ruler
set showbreak=>>
set list lcs=tab:¦_
set notitle
set scrolloff=5
set pumheight=10
set completeopt=menuone
set t_Co=256

" Folding
" ---------------------------------------------------------------------------------------------------
set foldenable
set foldmethod=marker
set foldcolumn=1

" Cursorline
" ---------------------------------------------------------------------------------------------------
set cursorline
set nocursorcolumn

" Status Line
" ---------------------------------------------------------------------------------------------------
set cmdheight=2
set laststatus=2

" Title
" ---------------------------------------------------------------------------------------------------
set title
set titlestring=Vim:\ %f\ %h%r%m
set ttimeoutlen=10

" Charset, Line ending
" ---------------------------------------------------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8
set termencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,default,latin1
set fileformats=unix,dos,mac
if exists('&ambiwidth')
    set ambiwidth=double
endif

" Appearance
" ---------------------------------------------------------------------------------------------------
if exists('+guicursor')
    set guicursor&
    set guicursor=a:blinkwait2000-blinkon1000-blinkoff500
endif

if has('nvim')
    set notermguicolors
endif

" disable Background color erase function
set t_ut=

" }}}

" keys {{{
"====================================================================================================
" Move
" ---------------------------------------------------------------------------------------------------
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

nnoremap J <C-d>
nnoremap K <C-u>
vnoremap J <C-d>
vnoremap K <C-u>
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" Buffer
" ---------------------------------------------------------------------------------------------------
nnoremap <silent> <C-j> :bn<CR>
nnoremap <silent> <C-k> :bp<CR>

" Tab
" ---------------------------------------------------------------------------------------------------
nnoremap <silent> <TAB>   :tabn<CR>
nnoremap <silent> <S-TAB> :tabp<CR>
nnoremap <silent> <C-TAB> :tabnew<CR>
nnoremap <silent> <C-l>   :tabn<CR>
nnoremap <silent> <C-h>   :tabp<CR>

" Wrap
" ---------------------------------------------------------------------------------------------------
nnoremap [prefix]sw  :set wrap<CR>
nnoremap [prefix]snw :set nowrap<CR>

" Indent
" ---------------------------------------------------------------------------------------------------
nnoremap > >>
nnoremap < <<
vnoremap > >gv
vnoremap < <gv

" }}}

" appearance {{{
" for C++11
" ---------------------------------------------------------------------------------------------------
let g:c_no_curly_error = 1

" Color scheme
" ---------------------------------------------------------------------------------------------------

"if s:is_nvim && s:is_screen == 0
"    set termguicolors
"else
set notermguicolors
"endif



command! MyColorScheme :call s:MyColorScheme()
function! s:MyColorScheme()
	" base color scheme
    colorscheme cosme

	" highlight
    "hi Whitespace   ctermbg=none ctermfg=230  guibg=NONE    guifg=#0a0a0a
endfunction
MyColorScheme

" }}}

" lightline {{{
"====================================================================================================
let g:unite_force_overwrite_statusline    = 0
let g:vimfiler_force_overwrite_statusline = 0
let g:vimshell_force_overwrite_statusline = 0

let g:lightline = {
    \ 'colorscheme': 'tsubakumi',
    \ 'enable' : {
        \ 'statusline' : 1,
        \ 'tabline'    : 0
    \ },
    \ 'mode_map' : {
        \ 'n'      : 'N',
        \ 'i'      : 'I',
        \ 'R'      : 'R',
        \ 'v'      : 'V',
        \ 'V'      : 'VL',
        \ 'c'      : 'C',
        \ "\<C-v>" : 'VB',
        \ 's'      : 'S',
        \ 'S'      : 'SL',
        \ "\<C-s>" : 'SB',
        \ '?'      : '  '
    \ },
    \ 'active' : {
        \ 'left' : [
            \ [ 'mode' ],
            \ [ 'paste', 'fugitive', 'filename', 'quickrun', 'quickfix' ],
        \ ],
        \ 'right' : [
            \ [ 'percent' ],
            \ [ 'lineinfo' ],
            \ [ 'fileformat', 'fileencoding', 'filetype' ]
        \ ]
    \ },
    \ 'separator' : {
        \ 'left'  : '⮀',
        \ 'right' : '⮂'
    \ },
    \ 'subseparator' : {
        \ 'left'  : '⮁',
        \ 'right' : '⮃'
    \ },
    \ 'component' : {
        \ 'lineinfo' : '⭡ %3l:%-1v',
        \ 'percent'  : '%2p%%',
    \ },
    \ 'component_function': {
        \ 'mode'         : 'LightlineComponentFuncMode',
        \ 'filename'     : 'LightlineComponentFuncFilename',
        \ 'fileformat'   : 'LightlineComponentFuncFileFormat',
        \ 'filetype'     : 'LightlineComponentFuncFileType',
        \ 'fileencoding' : 'LightlineComponentFuncFileEncoding',
        \ 'quickrun'     : 'LightlineComponentFuncQuickrun',
        \ 'fugitive'     : 'LightlineComponentFuncFugitive',
    \ },
    \ 'tab' : {
        \ 'active'   : ['tabnum', 'filename', 'modified' ],
        \ 'inactive' : ['tabnum', 'filename', 'modified' ],
    \ },
\ }
" }}}

" deoplete {{{
"====================================================================================================
" Flags
" ---------------------------------------------------------------------------------------------------
let g:deoplete#enable_at_startup          = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#auto_complete_delay        = 0
let g:deoplete#enable_camel_case          = 1
let g:deoplete#enable_ignore_case         = 1
let g:deoplete#enable_smart_case          = 1
let g:deoplete#enable_refresh_always      = 1
let g:deoplete#file#enable_buffer_path    = 1
let g:deoplete#max_list                   = 1000

call deoplete#custom#option('sources', {
    \ 'cs' : ['omnisharp', 'buffer'],
\ })

call deoplete#enable()
" }}}

" ale {{{
" ====================================================================================================
let g:ale_lint_on_enter = 0
let g:ale_linters = {
    \ 'javascript' : ['eslint'],
\ }
" }}}

" vim-template {{{
" ====================================================================================================
let g:template_basedir=expand('~/.vim/')
autocmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
	silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
	silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction

autocmd User plugin-template-loaded
\   if search('<+CURSOR+>')
\ |   silent! execute 'normal! "_da>'
\ | endif
" }}}

" NERDTree {{{
" ====================================================================================================
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" }}}
"

