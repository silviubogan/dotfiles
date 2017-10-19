" Inspired from https://github.com/IonicaBizau/dotfiles/blob/master/vim/.vimrc
" and https://github.com/GhitaB/dotfiles/blob/master/.vimrc.
"
" This is the personal .vimrc file of Silviu Bogan.
"
" While much of it is beneficial for general use, I would
" recommend picking out the parts you want and understand.
"
" You can find me at https://github.com/silviubogan.
"
" Licensed under The MIT License.

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

"Plugin 'severin-lemaignan/vim-minimap'
Plugin 'Enhanced-Javascript-syntax'
Plugin 'heavenshell/vim-jsdoc'
Plugin 'easymotion/vim-easymotion'
Plugin 'majutsushi/tagbar'
Plugin 'digitaltoad/vim-pug'
Plugin 'Shougo/neocomplete.vim'
Plugin 'sheerun/vim-polyglot'
Plugin 'junegunn/vim-emoji'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/LargeFile'

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

" https://github.com/Shougo/neocomplete.vim
let g:neocomplete#enable_at_startup = 1
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" https://github.com/junegunn/vim-emoji
" First type ":" and another character after, then press
" <C-X><C-U> like here: http://vim.wikia.com/wiki/Custom_keyword_completion
set completefunc=emoji#complete

" https://github.com/airblade/vim-gitgutter
set updatetime=250

" Who doesn't like autoindent?
set autoindent

set smartindent

" Line Numbers PWN!
set number

" Who wants an 8 character tab? Not me!
set shiftwidth=4
set softtabstop=4

" Spaces are better than a tab character
set expandtab
set smarttab

" Enable mouse support in console
set mouse=a

" Ignoring case is a fun trick
set ignorecase

" And so is Artificial Intellegence!
set smartcase

" Highlight things that we find with the search
set hlsearch

" This shows what you are typing as a command.
" http://dailyvim.tumblr.com/post/3166172074/showcmd
set showcmd

" Cool tab completion stuff
set wildmode=longest,list,full
set wildmenu

" Got backspace?
set backspace=indent,eol,start

" http://vim.wikia.com/wiki/Automatically_wrap_left_and_right
" Or use Shift+Arrows.
"set whichwrap+=<,>,h,l,[,]

" For the gq commands
set textwidth=80

set foldmethod=indent

" When I close a tab, remove the buffer
set nohidden

set colorcolumn=80

" New Tab
nnoremap <silent> <C-t> :tabnew<CR>

" Search for visually selected text
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap // y/<C-R>"<CR>

" https://github.com/majutsushi/tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_compact = 1

" https://github.com/vim-scripts/LargeFile
let g:LargeFile = 1

" http://vim.wikia.com/wiki/Switch_between_Vim_window_splits_easily
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" http://vim.wikia.com/wiki/View_text_file_in_two_columns
" With the default leader, you can now press \vs to vertically split the screen
" into two windows with 'scrollbind' set. To display only a single window, press
" Ctrl-W then o, and to disable scroll bind, run :setl noscrollbind.
noremap <silent> <Leader>vs :<C-u>let @z=&so<CR>:set so=0 noscb<CR>:bo vs<CR>Ljzt:setl scb<CR><C-w>p:setl scb<CR>:let &so=@z<CR>

" http://vim.wikia.com/wiki/Moving_lines_up_or_down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" http://stackoverflow.com/a/10216459/258462
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=50

" http://vim.wikia.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1)
nnoremap k gk
nnoremap j gj

" :h vimrc_example.vim
map Q gq

set splitbelow
set splitright

" Use the <F3> key to save file from insert mode
inoremap <F3> <C-o>:w<CR>

" Swap ; and :. Convenient.
nnoremap ; :
nnoremap : ;

set backupcopy=yes
