" sets
set tabstop=4
set softtabstop=4
set shiftwidth=4
set scrolloff=15
set colorcolumn=80
set signcolumn=yes
set guicursor=
set updatetime=300
set expandtab
set smartindent
set relativenumber
set nu
set nohlsearch
set incsearch
set ignorecase
set smartcase
set hidden
set noerrorbells
set nowrap
set noswapfile
set nobackup
set nowritebackup
set nocompatible

let g:polyglot_disabled = ['autoindent']

" plugins
call plug#begin("~/.config/nvim/plugins")
Plug 'ThePrimeagen/vim-be-good'

Plug 'gruvbox-community/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" color scheme
let g:gruvbox_contrast_dark = "hard"

colorscheme gruvbox

let mapleader = " "

" maps
nnoremap <leader>p :GFiles<cr>
nmap <leader>f <plug>(easymotion-bd-f)
nmap <leader>rn <plug>(coc-rename)
nmap [g <plug>(coc-diagnostic-prev)
nmap ]g <plug>(coc-diagnostic-next)
nmap <leader>gd <plug>(coc-definition)
nmap <leader>gy <plug>(coc-type-definition)
nmap <leader>gi <plug>(coc-implementation)
nmap <leader>gr <plug>(coc-references)

cnoremap <silent> /t <cr>:t''<cr>
cnoremap <silent> /m <cr>:m''<cr>
cnoremap <silent> /d <cr>:d<cr>``

" auto commands
augroup easymotion_coc_fix
    autocmd!
    autocmd User EasyMotionPromptBegin silent! CocDisable
    autocmd User EasyMotionPromptEnd silent! CocEnable
augroup end

" sources
source $HOME/.config/nvim/plugins/config/coc.vim
