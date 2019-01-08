set nocompatible              " be iMproved, required
filetype off                  " required

inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O

set encoding=utf8
let g:airline_powerline_fonts = 1

set rtp+=~/.vim/bundle/Vundle.vim
set ignorecase
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'

Plugin 'scrooloose/syntastic'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

Plugin 'Yggdroot/indentLine'

Plugin 'scrooloose/nerdtree'
autocmd vimenter * NERDTree

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

Plugin 'Xuyuanp/nerdtree-git-plugin'

Plugin 'vim-airline/vim-airline'

Plugin 'flazz/vim-colorschemes'
syntax enable
if has('gui_running')
  set background=light
else
  set background=dark
endif
let g:solarized_termcolors= 256
let g:solarized_termtrans = 1
let g:solarized_degrade = 1
let g:solarized_bold = 1
let g:solarized_underline = 1
let g:solarized_italic = 1
let g:solarized_contrast = "normal"
let g:solarized_visibility= "normal"
"colorscheme molokai
"source ~/.vim/bundle/vim-colorschemes/colors/solarized.vim

Plugin 'kien/ctrlp.vim'
let g:ctrlp_show_hidden = 1

Plugin 'scrooloose/nerdcommenter'
Plugin 'airblade/vim-gitgutter'
Plugin 'nathanaelkane/vim-indent-guides'


Plugin 'fatih/vim-go'
let g:go_fmt_command = "gofmt"
let g:go_fmt_command = "goimports"
let g:go_def_mode = 'guru'

set syntax=off
set ft=text
set conceallevel=0
set backspace=2
set number
set expandtab
autocmd Filetype yml setlocal tabstop=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set clipboard+=unnamed
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
map <F7> mzgg=G`z
map <F7> mzgg=G`z

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()


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
