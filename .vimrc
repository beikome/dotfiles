filetype off

" -------------------------------------------------------------------------
" release autogroup in MyAutoCmd
augroup MyAutoCmd
  autocmd!
  augroup END

" -------------------------------------------------------------------------
" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-template'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'w0rp/ale'

call neobundle#end()

" -------------------------------------------------------------------------
" syntax highlight 
syntax on

" -------------------------------------------------------------------------
" color scheme
" kolor
colorscheme kolor       
let g:kolor_italic=1 " Enable italic. Default: 1
let g:kolor_bold=1 " Enable bold. Default: 1
let g:kolor_underlined=0  " Enable underline. Default: 0
let g:kolor_alternative_matchparen=0 " Gray 'MatchParen' color. Default: 0
let g:kolor_inverted_matchparen=0 " White foreground 'MatchParen' color that might work better with some terminals. Default: 0
set t_Co=256
"set background=dark


" -------------------------------------------------------------------------
" nerdtree
let NERDTreeShowHidden = 1 " 隠しファイルをデフォルトで表示させる

" デフォルトでNERDTreeを表示するがファイル名を指定して起動した時は表示しない         
autocmd StdinReadPre * let s:std_in=1 
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" -------------------------------------------------------------------------
" asynchronous lint engine (syntax checker)

let g:ale_sign_column_always = 1
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 1

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:syntastic_python_checkers = ['pyflakes', 'pep8']

" -------------------------------------------------------------------------
" indent
let s:hooks = neobundle#get_hooks("vim-indent-guides")
function! s:hooks.on_source(bundle)
  let g:indent_guides_guide_size = 1
  IndentGuidesEnable
endfunction

" -------------------------------------------------------------------------
" template
" テンプレート中に含まれる特定文字列を置き換える
autocmd MyAutoCmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
    silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
    silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction
" テンプレート中に含まれる'<+CURSOR+>'にカーソルを移動
autocmd MyAutoCmd User plugin-template-loaded
    \   if search('<+CURSOR+>')
    \ |   silent! execute 'normal! "_da>'
    \ | endif

" -------------------------------------------------------------------------

syntax on

set ignorecase
set smartcase
set incsearch
set hlsearch
set cursorline

cnoremap <expr> / getcmdtype() == '/' ? '\/' : '/'
cnoremap <expr> ? getcmdtype() == '?' ? '\?' : '?'

set shiftround          " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase           " 補完時に大文字小文字を区別しない
set virtualedit=all     " カーソルを文字が存在しない部分でも動けるようにする
set hidden              " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen   " 新しく開く代わりにすでに開いてあるバッファを開く
set showmatch           " 対応する括弧などをハイライト表示する
set matchtime=3         " 対応括弧のハイライト表示を3秒にする

" 対応括弧に'<'と'>'のペアを追加
set matchpairs& matchpairs+=<:>

" バックスペースでなんでも消せるようにする
set backspace=indent,eol,start

" Swapファイル,Backupファイルを無効化する
set nowritebackup
set nobackup
set noswapfile

set number              " 行番号の表示
set wrap                " 長いテキストの折り返し
set textwidth=0         " 自動的に改行が入るのを無効化

" スクリーンベルを無効化
set t_vb=
set novisualbell

" python用設定
set encoding=utf8 
set paste " ペーストしたときのオートインデントを無効にする
set tabstop=4
set autoindent
set expandtab " タブ入力をスペースに入れ替える
set textwidth=0
set softtabstop=4
set shiftwidth=4
set incsearch
set ignorecase
set ruler
set wildmenu
set commentstring=\ #\ %s
set foldlevel=0
set clipboard+=unnamed

filetype plugin indent on


