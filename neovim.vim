syntax on


call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'     "Archive tree
Plug 'davidhalter/jedi-vim'   " jedi for python
Plug 'Vimjas/vim-python-pep8-indent'  "better indenting for python
Plug 'tweekmonster/impsort.vim'  " color and sort imports
Plug 'w0rp/ale'  " python linters
Plug 'roxma/nvim-yarp'  " dependency of ncm2
Plug 'ncm2/ncm2'  " awesome autocomplete plugin
Plug 'HansPinckaers/ncm2-jedi'  " fast python completion (use ncm2 if you want type info or snippet support)
Plug 'ncm2/ncm2-bufword'  " buffer keyword completion
Plug 'ncm2/ncm2-path'  " filepath completion
Plug 'rafi/awesome-vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'mhartington/oceanic-next'

call plug#end()

filetype indent on
set fileformat=unix
set shortmess+=c
set mouse=a  " change cursor per mode
set number  " always show current line number
set wrapscan  " begin search from top of file when nothing is found anymore
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set history=1000  " remember more commands and search history
set nobackup  " no backup or swap file, live dangerously
set noswapfile  " swap files give annoying warning
set breakindent  " preserve horizontal whitespace when wrapping
set showbreak=..
set lbr  " wrap words
set nowrap  " i turn on wrap manually when needed
set scrolloff=3 " keep three lines between the cursor and the edge of the screen
set undodir=~/.vim/undodir
set undofile  " save undos
set undolevels=10000  " maximum number of changes that can be undone
set undoreload=100000  " maximum number lines to save for undo on a buffer reload
set noshowmode  " keep command line clean
set noshowcmd
set laststatus=2  " always slow statusline
set hlsearch  " highlight search and search while typing
set incsearch
set cpoptions+=x  " stay at seach item when <esc>
set visualbell
set relativenumber
set viminfo='20,<1000  " allow copying of more than 50 lines to other applications
set clipboard=unnamedplus
autocmd vimenter * NERDTree

" ncm2 settings
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert

" make it FAST
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1,1]]
let g:ncm2#matcher = 'substrfuzzy'
set pumheight=5

"auto indent for brackets
nmap <leader>w :w!<cr>
nmap <leader>q :lcl<cr>:q<cr>
nnoremap <leader>h :nohlsearch<Bar>:echo<CR>

" Mappings
map <F2> :NERDTreeToggle<CR>
map <F8> :make<CR>

" Options are in .pylintrc!
highlight VertSplit ctermbg=253

"Colorscheme
colorscheme OceanicNext

" highlight python and self function
autocmd BufEnter * syntax match Type /\v\.[a-zA-Z0-9_]+\ze(\[|\s|$|,|\]|\)|\.|:)/hs=s+1
autocmd BufEnter * syntax match pythonFunction /\v[[:alnum:]_]+\ze(\s?\()/
hi def link pythonFunction Function
autocmd BufEnter * syn match Self "\(\W\|^\)\@<=self\(\.\)\@="
highlight self ctermfg=239


" neovim options
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
nnoremap <C-a> <Esc>
nnoremap <C-x> <Esc>

" vimgutter options
let g:gitgutter_override_sign_column_highlight = 0
let g:gitgutter_map_keys = 0
