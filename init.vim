" Sets
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set guicursor=
set updatetime=300
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set nowritebackup
set incsearch

" Plugins
call plug#begin("~/.config/nvim/plugins")
Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Color scheme
colorscheme gruvbox
highlight Normal guibg=none ctermbg=none

let mapleader = " "

" Maps
nnoremap <leader>p :Files<cr>
nmap <leader>f <plug>(easymotion-bd-f)

inoremap ( ()<left>
inoremap <expr> ) strpart(getline("."), col(".") - 1, 1) == ")" ? "<right>" : ")"
inoremap [ []<left>
inoremap <expr> ] strpart(getline("."), col(".") - 1, 1) == "]" ? "<right>" : "]"
inoremap { {}<left>
inoremap <expr> } strpart(getline("."), col(".") - 1, 1) == "}" ? "<right>" : "}"
inoremap <expr> ' strpart(getline("."), col(".")-1, 1) == "'" ? "<right>" : "''<left>"
inoremap <expr> " strpart(getline("."), col(".")-1, 1) == '"' ? "<right>" : '""<left>'
inoremap <expr> ` strpart(getline("."), col(".")-1, 1) == "`" ? "<right>" : "``<left>"

" Auto commands
augroup easymotion_coc_fix
    autocmd!
    autocmd User EasyMotionPromptBegin silent! CocDisable
    autocmd User EasyMotionPromptEnd silent! CocEnable
augroup end

" Sources
source $HOME/.config/nvim/plugins/config/coc.vim
