set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

Bundle 'gmarik/vundle'

" General
Bundle 'bling/vim-airline'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'tomtom/tcomment_vim'
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'chriskempson/base16-vim'
Bundle 'JazzCore/ctrlp-cmatcher'

" Programming
Bundle 'scrooloose/syntastic'
Bundle 'godlygeek/tabular'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'Valloric/YouCompleteMe'

" Ruby
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'thoughtbot/vim-rspec'

Bundle 'tpope/vim-haml'

colorscheme base16-railscasts
set background=dark
let base16colorspace=256

filetype plugin indent on

" Make Vim more useful
set nocompatible

set autoread
" Use the OS clipboard by default (on versions compiled with `+clipboard`)
set clipboard=unnamed
" Enhance command-line completion
set wildmenu
" Allow cursor keys in insert mode
set esckeys
" Allow backspace in insert mode
set backspace=indent,eol,start
" Add the g flag to search/replace by default
set gdefault
set encoding=utf-8 nobomb
" Change mapleader
let mapleader=","
set colorcolumn=81
" Respect modeline in files
set modeline
set modelines=4
" Enable per-directory .vimrc files and disable unsafe commands in them
set exrc
set secure
" Enable line numbers
set number
" Enable syntax highlighting
syntax enable
" Highlight current line
set cursorline
" Tabs and indenting
set bs=2
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set scrolloff=3

"automatic saving
"" au FocusLost * silent! wa   " FocusLost only works in GUI vim (and for CTRL-Z)
au WinLeave,TabLeave * silent! wa
set autowriteall
" Highligh trailing white spaces on non-insert mode
highlight ExtraWhitespace ctermbg=red guibg=red
au ColorScheme * highlight ExtraWhitespace guibg=red
au BufEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhiteSpace /\s\+$/

" Delete trailing white space and Dos-returns and to expand tabs to spaces
noremap <F2> :set et<CR>:retab!<CR>:%s/[\r \t]\+$//<CR>

" resize current buffer by +/- 5
nnoremap <S-left> :vertical resize -5<cr>
nnoremap <S-down> :resize +5<cr>
nnoremap <S-up> :resize -5<cr>
nnoremap <S-right> :vertical resize +5<cr>

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0

" Tabular bundle
nmap <Leader>a{ :Tabularize /{<CR>
vmap <Leader>a{ :Tabularize /{<CR>
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
nmap <Leader>a> :Tabularize /=><cr>
vmap <Leader>a> :Tabularize /=><cr>

" NERDTree bundle
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F4>"

" Taglist bundle
let Tlist_Ctags_Cmd="/usr/local/bin/ctags"
let Tlist_WinWidth=50
map <F8> :!/usr/bin/ctags -R . $(bundle list --paths)<CR>
map <F4> :TlistToggle<cr>

" CtrlP bundle
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](target|coverage|log|vendor|node_modules|reports|build|tmp|\.git)$',
  \ 'file': '\v(tags)$'
  \ }
" Syntastic
let g:syntastic_check_on_open = 1
let g:syntastic_html_tidy_ignore_errors = ['proprietary attribute "myhotcompany-']
let g:syntastic_javascript_checkers = ['jshint', 'jscs']
let g:syntastic_ruby_checkers = ['rubocop']
" ctags search
nnoremap <c-]> g<c-]>
vnoremap <c-]> g<c-]>

