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
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'easymotion/vim-easymotion'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Color scheme
lua require'nvim-treesitter.configs'.setup { highlight = { enable = true } }

let g:gruvbox_contrast_dark = "hard"

colorscheme gruvbox
highlight Normal guibg=none ctermbg=none

let mapleader = " "

function! CurrentChar()
    return strpart(getline("."), col(".") - 1, 1)
endfunction

" Maps
nnoremap <leader>p :Files<cr>
nmap <leader>f <plug>(easymotion-bd-f)
nmap <leader>rn <plug>(coc-rename)
nmap <silent> [g <plug>(coc-diagnostic-prev)
nmap <silent> ]g <plug>(coc-diagnostic-next)
nmap <silent> <leader>gd <plug>(coc-definition)
nmap <silent> <leader>gy <plug>(coc-type-definition)
nmap <silent> <leader>gi <plug>(coc-implementation)
nmap <silent> <leader>gr <plug>(coc-references)
inoremap <c-l> <bs><del>

vnoremap ( xa()<Esc>P
inoremap ( ()<left>
inoremap <expr> ) CurrentChar() == ")" ? "<right>" : ")"

vnoremap [ xa[]<Esc>P
inoremap [ []<left>
inoremap <expr> ] CurrentChar() == "]" ? "<right>" : "]"

vnoremap { xa{}<Esc>P
inoremap { {}<left>
inoremap <expr> } CurrentChar() == "}" ? "<right>" : "}"

inoremap <expr> " CurrentChar() == '"' ? "<right>" : '""<left>'
inoremap <expr> ' CurrentChar() == "'" ? "<right>" : "''<left>"
inoremap <expr> ` CurrentChar() == "`" ? "<right>" : "``<left>"

" Auto commands
augroup easymotion_coc_fix
    autocmd!
    autocmd User EasyMotionPromptBegin silent! CocDisable
    autocmd User EasyMotionPromptEnd silent! CocEnable
augroup end

" Sources
source $HOME/.config/nvim/plugins/config/coc.vim
