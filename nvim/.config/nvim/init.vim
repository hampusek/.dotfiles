"let g:python_host_prog  = '/Users/hampusek/opt/anaconda3/envs/py27/bin/python'
let g:python3_host_prog = '/Users/hampusek/.local/venv/nvim/bin/python'

let mapleader = " "
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/keys/mappings.vim
lua require'treesitter'
lua require'lsp_config'

"source $HOME/.config/nvim/lua/lsp/python-ls.lua
"source $HOME/.config/nvim/lua/lsp/clangd-ls.lua
"lua require('lspconfig').clangd.setup{ on_attach=require'completion'.on_attach }
"lua require('lspconfig').pyright.setup{ on_attach=require'completion'.on_attach }
"source $HOME/.config/nvim/format.vim

"highlight Normal guibg=non"
if executable('rg')
    let g:rg_derive_root = 'true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc -exclude-standard', ]
let g:netrw_browse_split = 2
"let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

