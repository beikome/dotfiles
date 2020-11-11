UsePlugin 'ctrlp.vim'

let g:ctrlp_map = '<Nop>'		" デフォルトのマッピングを無効化
let g:ctrlp_max_files = 100000	" 対象ファイル最大数
let g:ctrlp_max_depth = 10		" 検索対象の最大階層数(default:40)

nnoremap <C-p>f :<C-u>CtrlP<CR>
nnoremap <C-p>b :<C-u>CtrlPBuffer<CR>
nnoremap <C-p>d :<C-u>CtrlPDir<CR>

