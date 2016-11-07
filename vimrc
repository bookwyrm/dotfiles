" Vundle install - https://github.com/VundleVim/Vundle.vim
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'

" sunburst theme
Bundle 'sickill/vim-sunburst'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Alernate escape from insert mode to avoid escape key
inoremap jk <Esc>

" Theme
colorscheme sunburst

" general setup
set number
set smartindent
set encoding=utf-8
set ignorecase
set smartcase

if has("autocmd")
	autocmd BufWritePre *.rb,*.js,*.php,*.html,*.css,*.scss,*.erb,*.coffee :call <SID>StripTrailingWhitespaces()
endif

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
function! <SID>StripTrailingWhitespaces()
	"preparation: save last search and cursor position
	let _s=@/
	let l = line(".")
	let c = col(".")
	" Strip trailing whitespace
	%s/\s\+$//e
	" Clean up: restore previous search history and cursor position
	let @/=_s
	call cursor(l,c)
endfunction

nmap <leader>n :NERDTreeToggle<CR>

" https://github.com/ctrlpvim/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ingore = {
      \ 'dir': '\v[\/](node_modules|bower_modules|\.git)$',
      \ }
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" show vim-airline all the time
set laststatus=2

" size of a hard tabstop
set tabstop=2

" size of an "indent"
set shiftwidth=2

" always use spaces instead of tab characters
set expandtab
