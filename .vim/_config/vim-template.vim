UsePlugin 'vim-template'

let g:template_basedir=expand('~/.vim/template')
autocmd User plugin-template-loaded call s:template_keywords()
function! s:template_keywords()
  silent! %s/<+DATE+>/\=strftime('%Y-%m-%d')/g
  silent! %s/<+FILENAME+>/\=expand('%:r')/g
endfunction

autocmd User plugin-template-loaded
\   if search('<+CURSOR+>')
\ |   silent! execute 'normal! "_da>'
\ | endif
