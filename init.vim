" Sets
set termguicolors
set pumheight=5
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

let mapleader = " "
let g:gruvbox_contrast_dark = "hard"

" Plugins
call plug#begin("~/.config/nvim/plugins")
Plug 'ThePrimeagen/vim-be-good'

Plug 'gruvbox-community/gruvbox'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'vim-airline/vim-airline'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'Vimjas/vim-python-pep8-indent'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Lua
lua <<EOF
require"nvim-treesitter.configs".setup {
    highlight = {
        enable = true
    }
}
EOF

lua require'colorizer'.setup()

" Maps
nnoremap <leader>ps :Files<cr>
nnoremap <leader>pb :Buffer<cr>
nnoremap <leader>pg :Ag<cr>
nmap <leader>rn <plug>(coc-rename)
nmap [g <plug>(coc-diagnostic-prev)
nmap ]g <plug>(coc-diagnostic-next)
nmap <leader>gd <plug>(coc-definition)
nmap <leader>gy <plug>(coc-type-definition)
nmap <leader>gi <plug>(coc-implementation)
nmap <leader>gr <plug>(coc-references)
nmap <leader>gs :G<cr>

nnoremap <leader>sc :set spell<cr> z= 1<cr> :set nospell<cr>

cnoremap ;p <cr>:t''<cr>
cnoremap ;P <cr>:t''-1<cr>
cnoremap ;m <cr>:m''<cr>
cnoremap ;M <cr>:m''-1<cr>
cnoremap ;d <cr>dd<cr>''

" Commands
command! ClearReg for i in range(34,122) | silent!
            \ call setreg(nr2char(i), []) | endfor

" Augroups
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup END

" Color scheme
colorscheme gruvbox
highlight Normal guibg=c1c1c1

" Sources
source $HOME/.config/nvim/plugins/config/coc.vim
