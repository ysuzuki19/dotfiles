set encoding=utf-8
scriptencoding utf-8

" タブ入力を複数の空白入力に置き換える
set expandtab
" 画面上でタブ文字が占める幅
set tabstop=2
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=2
" 改行時に前の行のインデントを継続する
set autoindent
" 改行時に前の行の構文をチェックし次の行のインデントを増減する
set smartindent
" smartindentで増減する幅
set shiftwidth=2
" 行を表示
set number
" 自動コメントアウト無効
augroup auto_comment_off
  autocmd!
  autocmd BufEnter * setlocal formatoptions-=r
  autocmd BufEnter * setlocal formatoptions-=o
" 終了時に余計な空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge

if has("autocmd")
  " ファイルタイプの検索を有効にする
  filetype plugin on
  " ファイルタイプに合わせたインデントを利用
  filetype indent on
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

" インクリメンタルサーチ（1文字入力ごとに検索する）
set incsearch
" 検索パターンに大文字小文字を区別しない
set ignorecase
" 検索パターンに大文字を含んでいたら大文字小文字を区別する
set smartcase
" 検索結果をハイライト
set hlsearch
" Escキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
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
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
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

" 自己流ショートカット
" コメントアウト
nnoremap <C-i> 0i//<Esc>
" アンコメントアウト
nnoremap <C-s> 0xx
" 空白行を追加するがノーマルモードを維持
nnoremap <S-o> o<Esc>

" カーソルの左右移動で行末から次の行への移動を可能にする
set whichwrap=b,s,h,l,<,>,[,],~
" カーソルラインをハイライト
color desert
set cursorline
" カレント行ハイライトを下線の代わりに文字強調にする
hi CursorLine term=bold cterm=bold guibg=Grey40
