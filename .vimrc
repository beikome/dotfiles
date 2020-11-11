" Init {{{
set shellslash              " ファイル名の区切りにスラッシュを使う
" }}}

" Flags {{{
" ====================================================================================================
" Common
" ---------------------------------------------------------------------------------------------------
filetype plugin indent on   " ファイルタイプ別のプラグイン・インデントロードを有効化
syntax on                   " シンタックスハイライトを有効化
let mapleader='\'

" File
" ---------------------------------------------------------------------------------------------------
set autoread                " 編集中のファイルが外部から書き換えられたとき自動的に読み直す    
set noautochdir             " ファイルを開いたときにディレクトリを変更しない
set hidden                  " バッファを破棄するときに開放せず隠れ状態にする
set noswapfile              " スワップファイルを作らない
set backupdir=>/tmp         " バックアップディレクトリを/tmpに指定
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc " ワイルドカードにマッチしたとき優先度を低くする拡張子
set noundofile              " アンドゥファイルを作らない

" Bell 
" ---------------------------------------------------------------------------------------------------
set vb t_vb=                " ビープ音も画面フラッシュも使わない

" Search
" ---------------------------------------------------------------------------------------------------
set ignorecase              " 検索時に大文字小文字を区別しない
set smartcase               " パターンに大文字が含まれているときに限り大文字小文字を区別する
set incsearch               " 検索パターンを入力中に、入力途中のパターンにマッチする文字列を表示する
set hlsearch                " 前回の検索パターンを強調表示する
set wrapscan                " 検索がファイル末尾まで進んだら、ファイル先頭から再び検索する

" Completion 
" ---------------------------------------------------------------------------------------------------
set shiftround              " '<'や'>'でインデントする際に'shiftwidth'の倍数に丸める
set infercase               " 補完時に大文字小文字を区別しない
set wildmenu                " コマンドライン補完を拡張モードで行う
set wildmode=longest:full,full    " コマンドライン補完時の優先設定

" History
" ---------------------------------------------------------------------------------------------------
set history=1000            " コマンドと検索パターンの履歴を1000件保持する

" Indent
" ---------------------------------------------------------------------------------------------------
set paste                   " ペーストしたときのオートインデントを無効にする
set tabstop=4               " タブをスペース4個分にする
set expandtab               " タブ入力をスペースに入れ替える
set softtabstop=4           " 編集でTabの幅として使用する空白の数
set shiftwidth=4            " インデントの各段階に使われる空白の数
set autoindent              " 新しい行のインデントを現在行と同じにする 
set smartindent             " 新しい行を作ったときに高度なインデントを行う

augroup FileDependentIndentSettings
    autocmd!
    autocmd FileType html setlocal ts=2 sw=2 " htmlのときだけインデント幅を変更する
augroup end

" Edit
" ---------------------------------------------------------------------------------------------------
set virtualedit=all         " カーソルを文字が存在しない部分でも動けるようにする
set hidden                  " バッファを閉じる代わりに隠す（Undo履歴を残すため）
set switchbuf=useopen       " 新しく開く代わりにすでに開いてあるバッファを開く
set backspace=indent,eol,start    " バックスペースでなんでも消せるようにする
set clipboard+=unnamed,unnamedplus      " クリップボードレジスタを利用する
set whichwrap=b,s,h,l,<,>,[,]    " カーソルキーのみで行末/頭の移動ができるようにする

" View 
" ---------------------------------------------------------------------------------------------------
syntax on
set cursorline              " カーソルのある行を強調する
set showmatch               " 対応する括弧などをハイライト表示する
set matchtime=3             " 対応括弧のハイライト表示を3秒にする
set matchpairs& matchpairs+=<:>    " 対応括弧に'<'と'>'のペアを追加
set showcmd                 " コマンドの一部を最下行に表示する
set showmode                " I,R,Vモードで最終行にメッセージを表示する    
set number                  " 行番号の表示
set wrap                    " 長いテキストの折り返し
set textwidth=0             " 自動的に改行が入るのを無効化
set ruler                   " カーソルが何行目・何列目に置かれているかを表示する
set showbreak=>>            " 折り返された行のはじめに>>を表示する
set list lcs=tab:¦_         " タブをわかりやすく表示する
set scrolloff=5             " カーソルの上下に少なくとも5行表示する
set pumheight=10            " ポップアップメニューい表紙する最大項目数を10にする
set completeopt=menuone,noinsert     " 候補が一つしかないときもポップアップを使う
set t_Co=256                " 256色使う

" Folding
" ---------------------------------------------------------------------------------------------------
set foldenable              " 折りたたみを有効化
set foldmethod=marker       " マーカーで折りたたみを指定する
set foldcolumn=1            " ウインドウの端の列で折りたたみの情報を表示する
set foldlevel=0             " すべての折りたたみを閉じた状態で表示する
                  
" Status Line
" ---------------------------------------------------------------------------------------------------
set cmdheight=2             " コマンドラインに使われる行数
set laststatus=2            " ステータス行を常に表示する

" Title
" ---------------------------------------------------------------------------------------------------
set title                   " ファイル名やファイル属性をタイトルに表示する
set titlestring=Vim:\ %f\ %h%r%m    " タイトルのフォーマットの指定
set ttimeoutlen=10          " キーコードの完了を待つ時間を10msにする

" Charset, Line ending
" ---------------------------------------------------------------------------------------------------
set encoding=utf-8          " Vim 内部の文字エンコーディングをutf-8で行う
scriptencoding utf-8        " スクリプトで使われている文字コードがutf-8であると宣言する
set termencoding=utf-8      " ターミナルのエンコーディングがutf-8であることを前提に処理を行う
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,ucs-bom,default,latin1 " カレントバッファで扱うエンコーディング
set fileformats=unix,dos,mac " 想定される改行の種類
if exists('&ambiwidth')
    set ambiwidth=double    " 幅不明な文字はASCIIの二倍の幅で扱う
endif
" }}}

" Keys {{{
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

" Popup
" ---------------------------------------------------------------------------------------------------
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" }}}

" Plugins {{{
"====================================================================================================
call plug#begin('~/.vim/plugged')

" general
Plug 'scrooloose/nerdtree'                  " ファイルシステムエクスプローラー
Plug 'thinca/vim-quickrun'                  " 編集中のファイルを実行する
Plug 'thinca/vim-template'                  " ファイルタイプごとのテンプレートを自動で読み込む
Plug 'ctrlpvim/ctrlp.vim'                   " バッファやファイルのファインダー

" lsp
Plug 'prabirshrestha/vim-lsp'               " LSPクライアント
Plug 'prabirshrestha/asyncomplete-lsp.vim'  " LSP補完ソース 
Plug 'prabirshrestha/asyncomplete.vim'      " 自動補完フレームワーク
Plug 'mattn/vim-lsp-settings'               " ファイルタイプに応じてLSをセッティングする 

" visual
Plug 'beikome/cosme.vim'                    " カラースキームcosme
Plug 'itchyny/lightline.vim'                " ステータスバー
Plug 'gko/vim-coloresque'                   " カラーコードのプレビュー

call plug#end()
" }}}

" Others {{{
"====================================================================================================
" カラースキームを設定
colorscheme cosme 

" .vim/_config以下の設定ファイル群を読み込むための準備
" UsePluginコマンドを用い、使用中のPluginの設定のみ読み込むようにする
let s:plugs = get(s:, 'plugs', get(g:, 'plugs', {}))
function! FindPlugin(name) abort
    return has_key(s:plugs, a:name) ? isdirectory(s:plugs[a:name].dir) : 0
endfunction
command! -nargs=1 UsePlugin if !FindPlugin(<args>) | finish | endif

" 各プラグインの設定ファイルを読み込む
runtime! _config/*.vim
" }}}
