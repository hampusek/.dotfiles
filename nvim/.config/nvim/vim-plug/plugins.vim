call plug#begin('~/.vim/plugged')
Plug 'https://github.com/gruvbox-community/gruvbox'
Plug 'neovim/nvim-lspconfig'
"Plug 'norcalli/snippets.nvim'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'

Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-path'
Plug 'saadparwaiz1/cmp_luasnip'

Plug 'L3MON4D3/LuaSnip'
Plug 'rafamadriz/friendly-snippets'

"Telescope requirements"
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

"Telescope
Plug 'nvim-telescope/telescope-fzf-native.nvim',  { 'do': 'make' }


" Vim-be-good game
Plug 'ThePrimeagen/vim-be-good'


" python formatting
Plug 'averms/black-nvim', {'do': ':UpdateRemotePlugins'}
"Plug 'sbdchd/neoformat'

call plug#end()


colorscheme gruvbox
set background=dark


set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
