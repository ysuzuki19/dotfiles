set encoding=utf-8
scriptencoding utf-8

set showmatch
set showcmd
set showmode
set laststatus=2
set ruler
set nowrapscan
set noswapfile

syntax on

set autoindent
set smartindent
set shiftwidth=2
set number
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
autocmd BufWritePre * :%s/\s\+$//ge

if has("autocmd")
  filetype plugin indent on
  "---------------------------------------------------------
  " sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
  autocmd FileType c           setlocal sw=2 sts=2 ts=2 et
  autocmd FileType h           setlocal sw=2 sts=2 ts=2 et
  autocmd FileType cpp         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType hpp         setlocal sw=2 sts=2 ts=2 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 et
  autocmd FileType js          setlocal sw=4 sts=4 ts=4 et
  autocmd FileType zsh         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType python      setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scala       setlocal sw=4 sts=4 ts=4 et
  autocmd FileType json        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType html        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType css         setlocal sw=4 sts=4 ts=4 et
  autocmd FileType scss        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType sass        setlocal sw=4 sts=4 ts=4 et
  autocmd FileType javascript  setlocal sw=4 sts=4 ts=4 et
endif

set incsearch
set ignorecase
set smartcase
set hlsearch

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set wildmenu
set history=5000

" マウスの有効化（カーソル移動・スクロール移動）
"if has('mouse')
"  set mouse=a
"  if has('mouse_sgr')
"    set ttymouse=sgr
"  elseif v:version > 703 || v:version is 703 && has('patch632')
"    set ttymouse=sgr
"  else
"    set ttymouse=xterm2
"  endif
"endif

" ペースト設定（クリップボードからコピーする際の自動インデント無効化）
"if &term =~ "xterm"
"  let &t_SI .= "\e[?2004h"
"  let &t_EI .= "\e[?2004l"
"  let &pastetoggle = "\e[201~"
"  function XTermPasteBegin(ret)
"    set paste
"    return a:ret
"  endfunction
"  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin{""}
"  endif


"set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行への移動を可能にする
color desert " カーソルラインをハイライト
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40 " カレント行ハイライトを下線の代わりに文字強調にする

nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X
nnoremap s "_s
vnoremap s "_s

set backspace=indent,eol,start
set clipboard=unnamed

" 拡張子に応じてnnoremapを設定
autocmd BufNewFile,BufRead *.py nnoremap <C-i> <Home>i#<Esc>
autocmd BufNewFile,BufRead *.py nnoremap <C-f> <Home>"_x<Esc>
autocmd BufNewFile,BufRead *.py nnoremap <C-e> :vertical terminal python3 %

autocmd BufNewFile,BufRead *.cpp nnoremap <C-i> <Home>i//<Esc>
autocmd BufNewFile,BufRead *.cpp nnoremap <C-f> <Home>"_x"_x<Esc>
autocmd BufNewFile,BufRead *.cpp nnoremap <C-b> :make
autocmd BufNewFile,BufRead *.cpp nnoremap <C-e> :make run

autocmd BufNewFile,BufRead *.sh nnoremap <C-i> <Home>i#<Esc>
autocmd BufNewFile,BufRead *.sh nnoremap <C-f> <Home>x<Esc>

autocmd BufNewFile,BufRead *.html nnoremap <C-i> <End>a--><Esc><Home>i<\!--<Esc>
autocmd BufNewFile,BufRead *.html nnoremap <C-f> <End>xxx<Esc><Home>xxxx<Esc>

autocmd BufNewFile,BufRead *.css nnoremap <C-i> <End>a*/<Esc><Home>i/*<Esc>
autocmd BufNewFile,BufRead *.css nnoremap <C-f> <End>xx<Esc><Home>xx<Esc>

autocmd BufNewFile,BufRead *.js nnoremap <C-i> <Home>i//<Esc>
autocmd BufNewFile,BufRead *.js nnoremap <C-f> <Home>xx<Esc>

nnoremap <S-o> o<Esc>
" 空白行を追加するがノーマルモードを維持，上に空行挿入が使えなくなることに注意

" Save fold settings.
augroup AutoSaveFolds
  au!
  au BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  au BufWinEnter ?* silent! loadview
augroup end
set completeopt+=menuone

" カーソル行を常に中央にする設定
" noremap h hzz
" noremap j jzz
" noremap k kzz
" noremap l lzz
" noremap gj gjzz
" noremap gk gkzz
" noremap + +zz
" noremap - -zz
" noremap e ezz
" noremap b bzz
" noremap w wzz
" noremap ge gezz
" noremap E Ezz
" noremap B Bzz
" noremap W Wzz
" noremap gE gEzz
" noremap n nzz
" noremap N Nzz
" noremap G Gzz
" noremap g; g;zz
" noremap g, g,zz
" noremap <C-u> <C-u>zz
" noremap <C-d> <C-d>zz
" noremap u uzz
" noremap <C-r> <C-r>zz
" noremap % %zz
" noremap dd ddzz
" noremap o o
" noremap O o<Esc>zz
