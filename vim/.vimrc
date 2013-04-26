"vim: foldmethod=marker
 
" Bundles
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'git@github.com:gmarik/vundle'
Bundle 'git@github.com:MarcWeber/vim-addon-mw-utils'
Bundle 'git@github.com:tomtom/tlib_vim'
if executable('ack-grep')
	let g:ackprg="ack-grep -H --nocolor --nogroup --column"
		Bundle 'git@github.com:mileszs/ack.vim'
	elseif executable('ack')
		Bundle 'git@github.com:mileszs/ack.vim'
	elseif executable('ag')
		Bundle 'git@github.com:mileszs/ack.vim'
		let g:ackprg = 'ag --nogroup --nocolor --column'
endif

Bundle 'git@github.com:scrooloose/nerdtree'
Bundle 'git@github.com:kien/ctrlp.vim'
Bundle 'git@github.com:vim-scripts/sessionman.vim'

Bundle 'git@github.com:jistr/vim-nerdtree-tabs'
Bundle 'git@github.com:mbbill/undotree'
Bundle 'git@github.com:airblade/vim-gitgutter'
Bundle 'git@github.com:tpope/vim-fugitive'
Bundle 'git@github.com:tpope/vim-abolish.git'
Bundle 'git@github.com:mattn/gist-vim'
Bundle 'git@github.com:scrooloose/nerdcommenter'
Bundle 'git@github.com:godlygeek/tabular'
if executable('ctags')
    Bundle 'git@github.com:majutsushi/tagbar'
endif
Bundle 'git@github.com:Shougo/neocomplcache'
Bundle 'git@github.com:klen/python-mode'
Bundle 'git@github.com:tpope/vim-pathogen'
Bundle 'git@github.com:vim-scripts/python.vim.git'
Bundle 'git@github.com:vim-scripts/python_match.vim.git'
Bundle 'git@github.com:vim-scripts/pythoncomplete.git'


" Setup
filetype plugin on

" Fugitive {{{
	nnoremap <silent> <leader>gs :Gstatus<CR>
	nnoremap <silent> <leader>gd :Gdiff<CR>
	nnoremap <silent> <leader>gc :Gcommit<CR>
	nnoremap <silent> <leader>gb :Gblame<CR>
	nnoremap <silent> <leader>gl :Glog<CR>
	nnoremap <silent> <leader>gp :Git push<CR>
	nnoremap <silent> <leader>gw :Gwrite<CR>:GitGutter<CR>
	nnoremap <silent> <leader>gg :GitGutterToggle<CR>
"}}}

" UndoTree {{{
	nnoremap <Leader>u :UndotreeToggle<CR>
	" If undotree is opened, it is likely one wants to interact with it.
	let g:undotree_SetFocusWhenToggle=1
" }}}

" UnBundle {{{
	function! UnBundle(arg, ...)
		let bundle = vundle#config#init_bundle(a:arg, a:000)
		call filter(g:bundles, 'v:val["name_spec"] != "' . a:arg . '"')
	endfunction

	com! -nargs=+ UnBundle
		\ call UnBundle(<args>)
" }}}

" Initialize NERDTree as needed {{{
	function! NERDTreeInitAsNeeded()
		redir => bufoutput
		buffers!
		redir END
		let idx = stridx(bufoutput, "NERD_tree")
		if idx > -1
			NERDTreeMirror
			NERDTreeFind
			wincmd l
		endif
	endfunction
" }}}

" Status Line {{{
	" jamessan's
	set statusline=   " clear the statusline for when vimrc is reloaded
	set statusline+=%-3.3n\                      " buffer number
	set statusline+=%f\                          " file name
	set statusline+=%h%m%r%w                     " flags
	set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
	set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
	set statusline+=%{&fileformat}]              " file format
	set statusline+=%{fugitive#statusline()}	 " Git Branch name
	set statusline+=%=                           " right align
	set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
	set statusline+=%b,0x%-8B\                   " current char
	set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset
" }}}

execute pathogen#infect('local/{}')

let fortran_free_source=1
let mapleader=','
autocmd FileType fortran setlocal textwidth=0

set autoindent
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4 
set expandtab
set modeline
set modelines=5
set foldmethod=marker

set wildmode=longest:full
set wildmenu
set pastetoggle=<F3>

nnoremap <F4> "=strftime("%x")<CR>P
inoremap <F4> <C-R>=strftime("%x")<CR>

set laststatus=2

nnoremap <leader>bc :BundleClean
nnoremap <leader>bi :BundleInstall
