set encoding=utf-8
scriptencoding utf-8

"" mapping ctrl+c instead of Esc
inoremap <Esc> <Esc>l
nnoremap <C-c> <Esc>
inoremap <C-c> <Esc>l
vnoremap <C-c> <Esc>
cnoremap <C-c> <Esc>

syntax on

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
set smartindent
"set number
set nonumber

augroup auto_comment_off
	autocmd!
	autocmd BufEnter * setlocal formatoptions-=r
	autocmd BufEnter * setlocal formatoptions-=o
	autocmd BufWritePre * :%s/\s\+$//ge
augroup end

if has("autocmd")
	filetype plugin indent on
	" sw=softtabstop, sts=shiftwidth, ts=tabstop, et=expandtab
	autocmd FileType c           setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType c nnoremap <buffer> <C-i> <Home>i//<Esc>
	autocmd FileType c nnoremap <buffer> <C-f> <Home>"_x"_x<Esc>
	autocmd FileType c nnoremap <buffer> <C-b> :make
	autocmd FileType c nnoremap <buffer> <C-e> :make run

	autocmd FileType python      setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType python nnoremap <buffer> <C-i> <Home>i#<Esc>
	autocmd FileType python nnoremap <buffer> <C-f> <Home>"_x<Esc>
	"autocmd FileType python nnoremap <C-e> :vertical terminal python3 %
	autocmd FileType python nnoremap <buffer> <C-e> :terminal python3 %

	autocmd FileType html        setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType html nnoremap <buffer> <C-i> <End>a--><Esc><Home>i<\!--<Esc>
	autocmd FileType html nnoremap <buffer> <C-f> <End>xxx<Esc><Home>xxxx<Esc>

	autocmd FileType ruby        setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType js          setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType zsh         setlocal sw=2 sts=2 ts=2 noexpandtab

	autocmd FileType scala       setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType json        setlocal sw=2 sts=2 ts=2 noexpandtab

	autocmd FileType css         setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType css nnoremap <buffer> <C-i> <End>a*/<Esc><Home>i/*<Esc>
	autocmd FileType css nnoremap <buffer> <C-f> <End>xx<Esc><Home>xx<Esc>

	autocmd FileType scss        setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType sass        setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType javascript  setlocal sw=2 sts=2 ts=2 noexpandtab
	autocmd FileType javasctipt nnoremap <buffer> <C-i> <Home>i//<Esc>
	autocmd FileType javasctipt nnoremap <buffer> <C-f> <Home>xx<Esc>

	autocmd BufNewFile,BufRead *.sh nnoremap <buffer> <C-i> <Home>i#<Esc>
	autocmd BufNewFile,BufRead *.sh nnoremap <buffer> <C-f> <Home>x<Esc>
endif

nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk

set wildmenu
set history=5000

color desert " カーソルラインをハイライト
set cursorline
hi CursorLine term=bold cterm=bold guibg=Grey40 " カレント行ハイライトを下線の代わりに文字強調にする

nnoremap x "_x
vnoremap x "_x
nnoremap X "_X
vnoremap X "_X
nnoremap s "_s
vnoremap s "_s

"nnoremap <CR> o<Esc>
nnoremap <C-@> o<Esc>
nnoremap # <Space><Space>:%s/<C-r>///g<Left><Left>
nnoremap <silent> <Space><Space> "zyiw:let @/ = '\<' . @z . '\>'<CR>:set hlsearch<CR>
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" use insert mode like emacs
inoremap <C-d> <Del>
inoremap <C-h> <BS>
inoremap <C-a> <home>
inoremap <C-e> <End>
"inoremap <C-p> <Up>
"inoremap <C-n> <Down>
inoremap <C-f> <right>
inoremap <C-b> <left>


" use command like emacs
" cnoremap <CR> <CR>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-d> <Del>

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
