let mapleader = " "
source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim

"highlight Normal guibg=non"
if executable('rg')
    let g:rg_derive_root = 'true'
endif

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc -exclude-standard', ]
let g:netrw_browse_split = 2
"let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

