set encoding=utf-8
scriptencoding utf-8

syntax on

augroup C-c_InsteadOfEsc
	inoremap <Esc> <Esc>l
	nnoremap <C-c> <Esc>
	inoremap <C-c> <Esc>l
	vnoremap <C-c> <Esc>
	cnoremap <C-c> <Esc>
augroup END

set showmatch
set showcmd
set showmode
set laststatus=2
set ruler
set nowrapscan
set noswapfile
set incsearch
set ignorecase
set smartcase
set hlsearch
set backspace=indent,eol,start
set clipboard=unnamed
set autoindent
set nonumber
set list
set listchars=tab:>-,trail:~
set formatoptions-=cro
set wildmenu
set history=5000
set belloff=all
set so=5


" 全角スペースの背景を白に変更
autocmd Colorscheme * highlight FullWidthSpace ctermbg=white
autocmd VimEnter * match FullWidthSpace /　/
" カラースキームの設定
color desert
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40
hi SpecialKey ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE

set completeopt+=menu
hi SpecialKey ctermbg=NONE ctermfg=59 guibg=NONE guifg=NONE

if has("autocmd")
	filetype plugin indent on
	" sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
	autocmd FileType c           setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType c           nnoremap <buffer> <C-i> I//<Esc>
	autocmd FileType c           nnoremap <buffer> <C-f> I<Del><Del><Esc>
	autocmd FileType c           nnoremap <buffer> <C-b> :make
	autocmd FileType c           nnoremap <buffer> <C-e> :make run

	autocmd FileType cpp         setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType cpp         nnoremap <buffer> <C-i> I//<Esc>
	autocmd FileType cpp         nnoremap <buffer> <C-f> I<Del><Del><Esc>
	autocmd FileType cpp         nnoremap <buffer> <C-b> :make
	autocmd FileType cpp         nnoremap <buffer> <C-e> :make run

	autocmd FileType go          setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType go          nnoremap <buffer> <C-i> I//<Esc>
	autocmd FileType go          nnoremap <buffer> <C-f> I<Del><Del><Esc>
	autocmd FileType go          nnoremap <buffer> <C-b> :make
	autocmd FileType go          nnoremap <buffer> <C-e> :make run

	autocmd FileType python      setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType python      nnoremap <buffer> <C-i> I#<Esc>
	autocmd FileType python      nnoremap <buffer> <C-f> I<Del><Esc>
	autocmd FileType python      nnoremap <buffer> <C-e> :terminal python3 %

	autocmd FileType html        setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType html        nnoremap <buffer> <C-i> <End>a--><Esc><Home>i<!--<Esc>
	autocmd FileType html        nnoremap <buffer> <C-f> <End>xxx<Esc><Home>xxxx<Esc>

	autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType jsx         setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType jsx         nnoremap <buffer> <C-i> I//<Esc>
	autocmd FileType jsx         nnoremap <buffer> <C-f> I<Del><Del><Esc>
	autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType javascript  nnoremap <buffer> <C-i> I//<Esc>
	autocmd FileType javascript  nnoremap <buffer> <C-f> I<Del><Del><Esc>
	autocmd FileType javascriptreact  setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType javascriptreact  nnoremap <buffer> <C-i> I//<Esc>
	autocmd FileType javascriptreact  nnoremap <buffer> <C-f> I<Del><Del><Esc>
	autocmd FileType zsh         setlocal sw=2 sts=2 ts=2 noexpandtab

	autocmd FileType scala       setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType json        setlocal sw=2 sts=2 ts=2 noexpandtab

	autocmd FileType css         setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType css         nnoremap <buffer> <C-i> A*/<Esc>I/*<Esc>
	autocmd FileType css         nnoremap <buffer> <C-f> A<BS><BS><Esc>I<Del><Del><Esc>

	autocmd FileType scss        setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType scss        nnoremap <buffer> <C-i> I//<Esc>
	autocmd FileType scss        nnoremap <buffer> <C-f> I<Del><Del><Esc>
	autocmd FileType sass        setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType sass        nnoremap <buffer> <C-i> I//<Esc>
	autocmd FileType sass        nnoremap <buffer> <C-f> I<Del><Del><Esc>

	autocmd FileType sh          setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType sh          nnoremap <buffer> <C-i> <Home>i#<Esc>
	autocmd FileType sh          nnoremap <buffer> <C-f> <Home>x<Esc>
endif

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

augroup xsWishoutYank
	nnoremap x "_x
	vnoremap x "_x
	nnoremap X "_X
	vnoremap X "_X
	nnoremap s "_s
	vnoremap s "_s
augroup END

nnoremap <C-@> o<Esc>
nnoremap # <Space><Space>:%s/<C-r>///g<Left><Left>
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>
nnoremap F V$%zf

augroup SetEmacsWithInsertMode
	inoremap <C-d> <Del>
	inoremap <C-h> <BS>
	inoremap <C-a> <home>
	inoremap <C-e> <End>
	"inoremap <C-p> <Up>
	"inoremap <C-n> <Down>
	inoremap <C-f> <right>
	inoremap <C-b> <left>
augroup END

" use command like emacs
augroup CommandEmacs
	cnoremap <C-p> <Up>
	cnoremap <C-n> <Down>
	cnoremap <C-b> <Left>
	cnoremap <C-f> <Right>
	cnoremap <C-a> <Home>
	cnoremap <C-e> <End>
	cnoremap <C-d> <Del>
augroup END

"augroup AutoSaveView
"	autocmd!
"	autocmd BufWinLeave . mkview
"	autocmd BufWinEnter . silent! loadview
"augroup END

function CenterCursor()
	noremap h hzz
	noremap j jzz
	noremap k kzz
	noremap l lzz
	noremap p pzz
	noremap gj gjzz
	noremap gk gkzz
	noremap + +zz
	noremap - -zz
	noremap e ezz
	noremap b bzz
	noremap w wzz
	noremap ge gezz
	noremap E Ezz
	noremap B Bzz
	noremap W Wzz
	noremap gE gEzz
	noremap n nzz
	noremap N Nzz
	noremap G Gzz
	noremap g; g;zz
	noremap g, g,zz
	noremap <C-u> <C-u>zz
	noremap <C-d> <C-d>zz
	noremap u uzz
	noremap <C-r> <C-r>zz
	noremap % %zz
	noremap dd ddzz
	nnoremap <C-@> o<Esc>zz
	vnoremap y yzz
	vnoremap d dzz
	vnoremap <S->> <S->>zz
endfunction
