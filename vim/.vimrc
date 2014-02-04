"vim: foldmethod=marker
"set term=xterm-color
 
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
set cindent
"set number
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4 
set modeline
set modelines=5
set foldmethod=marker
set hlsearch
set ignorecase
set smartindent
set tabstop=2
set shiftwidth=2
set softtabstop=2 
set expandtab
set backspace+=indent,eol,start
filetype indent on
" automatically save and load folds
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview
" Press F5 to toggle highlighting on/off, and show current value.
nnoremap <F3> "=strftime("%x")<CR>P
inoremap <F3> <C-R>=strftime("%x")<CR>
noremap <F4> :set number! number?<CR>
noremap <F5> :set hlsearch! hlsearch?<CR>
noremap <F6> :RainbowParenthesesToggleAll<CR>
noremap <F7> :syntax on<CR>
noremap <F8> :Tlist<CR>
"noremap <F9> source /home/pwolfram/.vim/plugin/python_fold.vim<CR>
"syntax on

" latex 
" REQUIRED. This makes vim invoke Latex-Suite when you open a tex file.
" filetype plugin on

" IMPORTANT: win32 users will need to have 'shellslash' set so that latex
" can be called correctly.
set shellslash

set wildmode=longest:full
set wildmenu
set pastetoggle=<F3>


set laststatus=2

nnoremap <leader>bc :BundleClean<CR>
nnoremap <leader>bi :BundleInstall!<CR>
" take care of white space for diffs {{{ 
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
  "}}}
syntax on
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type.
 filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex':
let g:tex_flavor='latex'
" help tags
"helptags ~/.vim/doc
" this is mostly a matter of taste. but LaTeX looks good with just a bit
" of indentation.
set sw=2
" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

let g:sh_indent_case_labels=1

" namelist file filter {{{
" associate *.foo with php filetype
au BufRead,BufNewFile *namelist*.input* setfiletype fortran
"au BufRead,BufNewFile *inc set filetype=fortran
" }}}

" rainbow parens {{{
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
"}}}
"
" spelling {{{
set spelllang=en
set spellfile=~/.vim/bundle/vundle/spell/en.utf-8.add
"}}}

"tabs {{{
nnoremap <silent> <leader>tn :tabn<CR>
nnoremap <silent> <leader>tp :tabp<CR>
nnoremap <silent> <leader>tl :tablast<CR>
nnoremap <silent> <leader>tf :tabfirst<CR>
"}}}
"
"xml syntax folding {{{
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax
au FileType xsd setlocal foldmethod=syntax
"}}}
"
"colorscheme http://vimcolorschemetest.googlecode.com/svn/html/index-html.html{{{
"syntax enable 
let g:molokai_original=1
let g:rehash256=1
set background=dark
colorscheme molokai
"let g:solarized_termcolors=256
"set background=dark
"colorscheme solarized
"colorscheme slate
"}}}
