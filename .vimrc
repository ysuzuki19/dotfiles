set encoding=utf-8
scriptencoding utf-8

"dein Scripts-----------------------------
"if &compatible
"  set nocompatible               " Be iMproved
"endif
"
"" Required:
"set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
"
"" Required:
"if dein#load_state('~/.vim/dein')
"  call dein#begin('~/.vim/dein')
"
"  " Let dein manage dein
"  " Required:
"  call dein#add('~/.vim/dein/repos/github.com/Shougo/dein.vim')
"
"  " Add or remove your plugins here like this:
"
"  call dein#add('Shougo/deoplete.nvim')
"  if !has('nvim')
"    call dein#add('roxma/nvim-yarp')
"    call dein#add('roxma/vim-hug-neovim-rpc')
"  endif
"  let g:deoplete#enable_at_startup = 1
"
"  call dein#add('Shougo/neosnippet.vim')
"  call dein#add('Shougo/neosnippet-snippets')
"  call dein#add('thinca/vim-quickrun')
"
"  " Required:
"  call dein#end()
"  call dein#save_state()
"endif
"
"" Required:
"filetype plugin indent on
"syntax enable
"
"" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif
"
"End dein Scripts-------------------------

set showmatch "括弧の対応を表示
set showcmd "入力中のコマンドを表示
set showmode
set laststatus=2 "ステータスラインを常に表示
set ruler "現在カーソル位置のファイル場の位置を%表示
set nowrapscan "検索で上に戻ってこない

set noswapfile "swapファイルを生成しない

syntax on
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する
set shiftwidth=2 " smartindentで増減する幅
set number " 行を表示
augroup auto_comment_off " 自動コメントアウト無効
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
autocmd BufWritePre * :%s/\s\+$//ge " 終了時に余計な空白を削除する

if has("autocmd")
  filetype plugin on " ファイルタイプの検索を有効にする
  filetype indent on " ファイルタイプに合わせたインデントを利用
  "---------------------------------------------------------
  " sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
  autocmd FileType c           setlocal sw=2 sts=2 ts=2 et
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

set incsearch " インクリメンタルサーチ（1文字入力ごとに検索する）
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
" Escキー2度押しでハイライトの切り替え

" 行が折り返し表示されていた場合、行単位ではなく表示行単位でカーソル移動
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

" コマンドモードの補完
set wildmenu
" 保存するコマンド履歴の数
set history=5000

" マウスの有効化（カーソル移動・スクロール移動）
if has('mouse')
  set mouse=a
"  if has('mouse_sgr')
"    set ttymouse=sgr
"  elseif v:version > 703 || v:version is 703 && has('patch632')
"    set ttymouse=sgr
"  else
"    set ttymouse=xterm2
"  endif
endif

" ペースト設定（クリップボードからコピーする際の自動インデント無効化）
if &term =~ "xterm"
  let &t_SI .= "\e[?2004h"
  let &t_EI .= "\e[?2004l"
  let &pastetoggle = "\e[201~"

  function XTermPasteBegin(ret)
    set paste
    return a:ret
  endfunction

  inoremap <special> <expr> <Esc>[200~ XTermPasteBegin{""}
  endif


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

set backspace=indent,eol,start " BackSpaceを有効化
"set clipboard=unnamed,autoselect " ヤンクとクリップボードを共有
set clipboard=unnamed " ヤンクとクリップボードを共有

" 自己流ショートカット
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

" 空白行を追加するがノーマルモードを維持，上に空行挿入が使えなくなることに注意
nnoremap <S-o> o<Esc>

" Save fold settings.
augroup AutoSaveFolds
  au!
  au BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  au BufWinEnter ?* silent! loadview
augroup end
set completeopt+=menuone

"noremap h hzz
"noremap j jzz
"noremap k kzz
"noremap l lzz
"noremap gj gjzz
"noremap gk gkzz
"noremap + +zz
"noremap - -zz
"noremap e ezz
"noremap b bzz
"noremap w wzz
"noremap ge gezz
"noremap E Ezz
"noremap B Bzz
"noremap W Wzz
"noremap gE gEzz
"noremap n nzz
"noremap N Nzz
"noremap G Gzz
"noremap g; g;zz
"noremap g, g,zz
"noremap <C-u> <C-u>zz
"noremap <C-d> <C-d>zz
"noremap u uzz
"noremap <C-r> <C-r>zz
"noremap % %zz
"noremap d dzz
"noremap o ozz
"noremap O Ozz
