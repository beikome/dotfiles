set nocompatible
filetype off


" -------------------------------------------------------------------------
" NeoBundle
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'thinca/vim-template'
NeoBundle 'ujihisa/unite-colorscheme'
NeoBundle 'davidhalter/jedi-vim'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'tomasr/molokai'


" -------------------------------------------------------------------------
" color scheme
set t_Co=256
set background=dark
colorscheme molokai


" -------------------------------------------------------------------------
" indent
let s:hooks = neobundle#get_hooks("vim-indent-guides")
function! s:hooks.on_source(bundle)
  let g:indent_guides_guide_size = 1
  IndentGuidesEnable
endfunction

" -------------------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
set hlsearch
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
set expandtab " タブ入力をスペースに入れ替える
set textwidth=0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set backspace=indent,eol,start
set incsearch
set ignorecase
set ruler
set wildmenu
set commentstring=\ #\ %s
set foldlevel=0
set clipboard+=unnamed
syntax on


filetype plugin indent on
