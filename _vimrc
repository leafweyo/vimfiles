set nocompatible
source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

" custom
function! MySys()
  if has("win32")
    return "win"
  else
    return "linux"
  endif
endfunction

set guifont=Consolas:h14:cANSI
call pathogen#infect()
let g:mapleader=","
"syntax enable
color molokai
filetype plugin on
set shiftwidth=4
set expandtab
set tabstop=4
set ignorecase smartcase
set tags+=~/.vim/systags
let Tlist_Exit_OnlyWindow = 1

set number
set previewheight=2

"--plugin config
"--snipMate--"
let g:snippets_dir="C:/Users/Blue/vimfiles/bundle/snipMate/snippets"

"--Tlist--"
map <Leader>tl :TlistToggle<cr>
"let Tlist_Ctags_Cmd='ctags'
"--neocomplcache--"
"let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_source_disable = {"filename_complete":1}
"let g:neocomplcache_enable_auto_select = 1
" Use smartcase.
"let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
"let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
"let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
"let g:neocomplcache_min_syntax_length = 3
" ignore candidate when change line
"inoremap <expr><space>  pumvisible() ? neocomplcache#close_popup() . "\<SPACE>" : "\<SPACE>"
"imap <s-enter> <c-o>o

"--miniBuf--"
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapCTabSwitchBufs = 1
nmap <silent> <a-d> <c-s-tab>
nmap <silent> <a-f> <c-tab>
set hidden
"nnoremap <silent> <a-f> :bn<CR>

map tg gT
"imap <tab> <c-c>
imap jj <c-c>
imap ff <ESC>:w<Enter>
map ff :w<Enter>
"imap <a-u> <c-p>
"imap <a-n> <c-n>
imap <a-/> <c-x><c-o>
imap <a-j> <down>
imap <a-k> <up>
imap <a-l> <right>
imap <a-h> <left>
imap <a-o> <ESC>o
autocmd filetype ruby imap <F5> <ESC>:w<Enter>:!ruby %<Enter>
autocmd filetype ruby map <F5> <ESC>:w<Enter>:!ruby %<Enter>
autocmd filetype python imap <F5> <ESC>:w<Enter>:!python %<Enter>
autocmd filetype python map <F5> <ESC>:w<Enter>:!python %<Enter>
autocmd filetype clojure imap <F5> <ESC>:w<Enter>:%Eval<Enter>
autocmd filetype clojure map <F5> <ESC>:w<Enter>:%Eval<Enter>
autocmd filetype go imap <F4> <ESC>:w<Enter>:!go run %<Enter>
autocmd filetype go map <F4> <ESC>:w<Enter>:!go run %<Enter>

if MySys() == 'linux'
    map <silent> <leader>rl :source ~/.vimrc<cr>
    map <silent> <leader>rc :e ~/.vimrc<cr>
    "When .vimrc is edited, reload it
    autocmd! bufwritepost .vimrc source ~/.vimrc
elseif MySys() == 'win'
    map <silent> <leader>rl :source ~/_vimrc<cr>
    map <silent> <leader>rc :e ~/_vimrc<cr>
    autocmd! bufwritepost _vimrc source ~/_vimrc
endif

"Toggle Menu and Toolbar
set guioptions-=m
set guioptions-=T
map <silent> <F9> :if &guioptions =~# 'T' <Bar>
        \set guioptions-=T <Bar>
        \set guioptions-=m <bar>
    \else <Bar>
        \set guioptions =T <Bar>
        \set guioptions =m <Bar>
    \endif<CR>

set fileencodings=utf-8,gb2312,gbk,gb18030,big5
set fenc=utf-8
"set enc=utf-8

"--go config
"filetype off
"filetype plugin indent off
"set runtimepath+=$GOROOT/misc/vim
"filetype plugin indent on
"syntax on
"go config

"Nerdtree config
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>
let NERDTreeShowBookmarks=1

"ruby
autocmd filetype ruby set shiftwidth=2
autocmd filetype ruby set tabstop=2

"clojure 
"rainbow
au filetype clojure RainbowParenthesesActivate
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces


set sessionoptions=winsize,slash,unix,tabpages

"cd E:\Sync\Code
"set autochdir
