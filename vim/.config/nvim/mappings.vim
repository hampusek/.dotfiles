" remaps
"
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>


" yank from cursor to end of line
nnoremap Y y$

" keeping cursor centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ'z

" Undo breakpoints
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u

" Jump list mutations

nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '>-2<CR>gv=gv
"inoremap <c-j> <esc>:m .+1<CR>==
"inoremap <c-k> <esc>:m .-2<CR>==
"nnoremap <leader>j :m .+1<CR>==
"nnoremap <leader>k :m .-2<CR>==


" tabing don't lose visual
vnoremap < <gv
vnoremap > >gv

