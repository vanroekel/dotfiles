"vim: foldmethod=marker
 
 source ~/.vimrc.bundles

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
"let mapleader=','
autocmd FileType fortran setlocal textwidth=0

set autoindent
set number
set tabstop=4
set shiftwidth=4
set softtabstop=4 
set modeline
set modelines=5
set foldmethod=marker
set hlsearch
set ignorecase
noremap <F5> :set hlsearch! hlsearch?<CR>
noremap <F6> :ToggleRaibowParenthesis<CR>
noremap <F7> :syntax on<CR>
noremap <F8> :Tlist<CR>
noremap <F9> :source /home/pwolfram/.vim/plugin/python_fold.vim<CR>
noremap <F4> :set number! number?<CR>
call rainbow_parenthsis#LoadRound()
call rainbow_parenthsis#LoadSquare()

set wildmode=longest:full
set wildmenu
set pastetoggle=<F3>

nnoremap <F4> "=strftime("%x")<CR>P
inoremap <F4> <C-R>=strftime("%x")<CR>

set laststatus=2

nnoremap <leader>bc :BundleClean<CR>
nnoremap <leader>bi :BundleInstall!<CR>
" take care of white space for diffs
set diffopt+=iwhite
  set diffexpr=DiffW()
  function DiffW()
    let opt = ""
     if &diffopt =~ "icase"
       let opt = opt . "-i "
     endif
     if &diffopt =~ "iwhite"
       let opt = opt . "-w " " vim uses -b by default
     endif
     silent execute "!diff -a --binary " . opt .
       \ v:fname_in . " " . v:fname_new .  " > " . v:fname_out
  endfunction
