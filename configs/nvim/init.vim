" init.vim config file for neovim 

" General settings
set number
set encoding=UTF-8
set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set termguicolors

" Neovim plugins using vim-plug
call plug#begin()

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } " NerdTree
Plug 'tpope/vim-commentary' " For Commenting gcc & gc
Plug 'vim-airline/vim-airline' " Status bar
Plug 'vim-airline/vim-airline-themes' " Status bar themes
Plug 'ap/vim-css-color' " CSS Color Preview
Plug 'rafi/awesome-vim-colorschemes' " Retro colorscheme
Plug 'ryanoasis/vim-devicons' " Developer Icons
Plug 'mg979/vim-visual-multi' " multiple cursors
Plug 'preservim/tagbar' " Tagbar for code navigation
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Auto Completion
Plug 'catppuccin/nvim', { 'as': 'catppuccin' } " Catppuccin colorscheme

call plug#end()

" Key mappings
nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-l> :call CocActionAsync('jumpDefinition')<CR>
nmap <F8> :TagbarToggle<CR>

" Completion settings
set completeopt-=preview " For No Previews

" Catppuccin setup
lua << EOF
require("catppuccin").setup()
EOF

" Gruvbox settings
let g:gruvbox_italic=1
let g:gruvbox_transparent_bg=1
let g:gruvbox_contrast_dark="hard"

" Use Gruvbox colorscheme
autocmd vimenter * ++nested colorscheme gruvbox

" NERDTree settings
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

" Airline settings
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_theme = 'gruvbox'

" Visual Multi settings
let g:VM_mouse_mappings = 1

" CoC settings
inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Remapping REDO to 'y' from 'Ctrl + r' for normal mode only
nnoremap y <C-r>
xnoremap y y

