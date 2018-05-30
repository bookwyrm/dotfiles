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
" Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'moll/vim-bbye'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-endwise'
Plugin 'ervandew/supertab'
"Plugin 'joonty/vdebug'
Plugin 'editorconfig/editorconfig-vim'
Plugin '2072/PHP-Indenting-for-VIm'
Plugin 'mustache/vim-mustache-handlebars'
"Plugin 'rizzatti/dash.vim'
Plugin 'tpope/vim-surround'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'posva/vim-vue'
Plugin 'ap/vim-css-color'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'w0rp/ale'

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

" Nicer font
set guifont=Source\ Code\ Pro\ Semibold:h14

" Syntax checkers
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_css_checkers = ['stylelint']
" let g:syntastic_scss_checkers = ['stylelint']
" let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss'] }
" nnoremap <Leader>lint :SyntasticCheck

" Indent/outdent helpers 
vmap <D-]> >gv
vmap <D-[> <gv
imap <D-]> <esc>V>gv<esc>a
imap <D-[> <esc>V<gv<esc>a
nmap <D-]> V>gv<esc>
nmap <D-[> V<gv<esc>

" Comment/uncomment blocks
map <D-/> <plug>NERDCommenterToggle<CR>
imap <D-/> <esc><plug>NERDCommenterToggle<CR>i

" highlight search results
set hlsearch

" Close a buffer w/out losing the window
nnoremap <Leader>bd :Bdelete<CR>

"if !exists('g:vdebug_options')
    "let g:vdebug_options = {}
"endif

" let g:vdebug_options["break_on_open"] = 0
"let g:vdebug_options['path_maps'] = {"/srv/www": "/Users/matt/Projects/vvv-local/www"}
"let g:vdebug_options['server'] = "192.168.0.70"
"let g:vdebug_options["watch_window_height"]=45
"let g:vdebug_options["status_window_height"]=5
" let g:vdebug_options["continuous_mode"]=1

"let g:PHP_default_indenting = 1
"let g:PHP_outdentphpescape = 1
let g:PHP_vintage_case_default_indent = 1

":nmap <silent> <leader>d <Plug>DashSearch

let g:ctrlp_user_command = 'cd %s;
      \ commonfilter="\.(jpg|bmp|png|jar|7z|zip|tar|gz|tgz|bz|git|swp|ctrlpignore)$";
      \ if [ ! -r ".ctrlpignore" ]; then
      \   find . -type f | grep -Evi "$commonfilter";
      \ else
      \   find . -type f | grep -vF "$(cat .ctrlpignore)" | grep -Evi "$commonfilter";
      \ fi'

let g:vim_markdown_folding_disabled=1

autocmd FileType vue syntax sync fromstart

let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction
function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
