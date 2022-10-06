" Vim configuration
" Date: 06/10/2022
" Name: Wanderley
"
" =============================================================================================
" =>  Basic configuration
syntax enable
filetype plugin indent on
syntax on
let g:rehash256 = 1
"----------------------------------------------
" => detect if the system supports more colors."
" True color if available
let term_program=$TERM_PROGRAM

" Check for conflicts with Apple Terminal app
if term_program !=? 'Apple_Terminal'
	set termguicolors

else
	if $TERM !=? 'xterm-256color'
		set termguicolors
	endif
endif
" => Config open files
" HTML
function HtmlConfig()
    set tabstop=2 softtabstop=2 expandtab shiftwidth=2
	autocmd FileType html call HtmlConfig()
endfunction

" ==> Python
function PythonConfig()
    set tabstop=4 softtabstop=4 expandtab shiftwidth=4
	autocmd FileType python call PythonConfig()
endfunction
" ---------------------------------------------

set number              " => shows the number of lines on the side."
set title               " => shows the file title."
set showcmd
set encoding=utf8
set showmatch
set autoindent
set smartindent
set history=500         " => stores the last 500 dictated commands

" => Tabs size
set expandtab           " => turns tabs into spaces."
set tabstop=4           " => number of spaces for tabs."
set shiftwidth=4        " => amount of spaces when indenting the text.
set smarttab
set softtabstop=4

" => true italics support
" => Italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" => Font  - Dev Icons
set guifont=Droid\ Sans\ Mono\ Nerd\ Font\ Complete\ Mono:h16 

" =>  => shows the lines from the current one.
set relativenumber  
set confirm

" => Set Mouse
set mouse=nicr
set mouse=a				   " => pallows the use of the mouse.
set cursorline			   " => insert a line where the cursor is."

" => Use system clipboard
set clipboard=unnamedplus " => sharing clipboard in vim."
set completeopt=noinsert,menuone,noselect " => modifies the behavior of the auto-complete menu to behave more like an IDE."

" = > Splits an Tabbed Files
set splitbelow splitright   " => configure the behavior of screen splitting in the command :split(split horizontally) and :vsplit(vertically)"
set path+=**
set wildmenu  " => shows a more advanced menu for autocomplete suggestions.set incsearch"
set nobackup
set noswapfile

" => tab through buffers
nmap <tab> :bnext<CR>
nmap q :quit<CR>
nmap <C-s> :w<CR>

" => open the terminal in vim"
nnoremap <C-t> :below terminal<CR> 

" => call the Plugins
"  --------------------------------------------------------------------------------
" call plug#begin('~/.vim/pack/git-plugins/start')
" Plug 'dense-analysis/ale'
" Plug 'sainnhe/gruvbox-material'
" Plug 'vim-startify'
" Plug 'VundleVim/Vundle.vi'
" Plug 'yggdroot/indentline'
" Plug 'awesome-vim-colorschemes'
" Plug 'tomasiser/vim-code-dark'
" Plug 'itchyny/lightline.vim'
" Plug 'turbio/bracey.vim'
" Plug 'preservim/nerdtree'
" Plug 'vim-airline-themes'
" Plug 'tomasiser/vim-code-dark'
" Plug 'sheerun/vim-polyglot'
" Plug 'ryanoasis/vim-devicons'
" Plug 'junegunn/vim-plug'
" Plug 'mattn/emmet-vim'
" Plug 'vim-airline/vim-airline'
" Plug 'dracula/vim', { 'as': 'dracula' }
" Plug 'neoclide/coc.nvim'

" Plug 'tpope/vim-surround'
" Plug 'chun-yang/auto-pairs'
" call plug#end()
"----------------------------------------------------------------------------------

" => Set true italics support
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" => Themes
" => GRUVBOX configuration
let g:gruvbox_material_better_performance = 1
set background=dark
colorscheme gruvbox-material
let g:gruvbox_material_background='medium'

let g:indentline_enabled = 1
map <c-k>i :IndentiLinesToggle<CR>

" => Configuration the airline
" --------------------------------------------------------------------------------
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_statusline_ontop=0 
let g:airline_theme='base16_twilight'  " => Theme

let g:airline#extensions#tabline#formatter = 'default'
" => Browsing between buffers"
nnoremap <M-Right> :bn<CR>
nnoremap <M-Left> :bp<CR>
nnoremap <c-x> :bp \|bd #<CR>
" ---------------------------------------------------------------------------------

" =>  Plugin configuration - CTRLP
let g:ctrlp_custom_ignore = 'v[ / ] .(swp|zip)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standart']
let g:ctrlp_show_hidden = 1

" => NerdTree Configuration
let NERDTreeQuitOpen=1
nnoremap <silent> <F2> : NERDTreeFind<CR>
nnoremap <silent> <F3> : NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '▷ '
let g:NERDTreeDirArrowCollapsible = '▽ '
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

" Plugin Commenter
filetype plugin on
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
map cc <Plug>NERDCommenterInvert

" => Plugin ale
let g:ale_linters = {'python' : ['flake8', 'pylint'], 'javascript' : ['eslint']}
let g:ale_completion_enabled = 0

" => Plugin coc
source ~/.vim/coc.nvimrc

" => HTML CSS sets
let g:user_emmet_install = 0
autocmd FileType html,css EmmetInstall

" => Live Server Web
nnoremap <leader>8 :Bracey <CR>
nnoremap <leader><F9> :BraceyReload <CR>
nnoremap <leader>0 :BraceyStop
autocmd FileType HTML :Bracey <CR>
let g:bracey_server_port='30800'

" => Set indentation
let g:indentLine_enabled = 1
