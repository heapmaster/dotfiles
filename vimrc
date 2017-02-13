execute pathogen#infect()
set nocompatible
set hidden
set history=1000

" Turn on enhanced tab completion
set wildmenu

" This makes only searches that contain uppercase characters
"   case-sensitive
set ignorecase
set smartcase

" Always keep at least 3 lines below the cursor when at the
"   end of a buffer
set scrolloff=3

set backspace=indent,eol,start

set ruler
set showcmd

if &t_Co > 2 || has("gui_runnig")
    syntax on
    set hlsearch
endif

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set showmatch
set incsearch

set wildmode=longest,list

:nnoremap <CR> :nohlsearch<cr>

" Make the tab key autocomplete or auto-indent 
"   based on context. (from http://www.vim.org/tips/tip.php?tip_id=102)
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col-1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

let mapleader=","
set cursorline
set cmdheight=2

set switchbuf=useopen

cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

set number
set numberwidth=5

nnoremap <leader><leader> <c-^>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

set t_Co=256
:color scott

map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
map <leader>F :CommandTFlush<cr>\|:CommandT %%<cr>

let g:calendar_google_calendar = 1
let g:calendar_clock_12hour=1
map <leader>c :Calendar<cr>
