" vimspector
source ~/.config/nvim/lua/init.lua
" ----		GENERAL CONFIG OPTIONS	---- "

set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
set laststatus=2
set expandtab
set termguicolors

" ----		KEYBIND SETUP		---- "

map <Space> <Leader>

tnoremap <Esc> <C-\><C-n>

" buffer navigation
map <Leader>h :bprev<CR>
map <Leader>l :bnext<CR>
map <Leader>j :bfirst<CR>
map <Leader>k :blast<CR>
map <Leader>qq :bd<CR>
map <Leader>Q :bd!<CR>
map <Leader>1 :b1<CR>
map <Leader>2 :b2<CR>
map <Leader>3 :b3<CR>
map <Leader>4 :b4<CR>
map <Leader>5 :b5<CR>
map <Leader>6 :b6<CR>
map <Leader>7 :b7<CR>
map <Leader>8 :b8<CR>
map <Leader>9 :b9<CR>
map <Leader>q1 :bd 1<CR>
map <Leader>q2 :bd 2<CR>
map <Leader>q3 :bd 3<CR>
map <Leader>q4 :bd 4<CR>
map <Leader>q5 :bd 5<CR>
map <Leader>q6 :bd 6<CR>
map <Leader>q7 :bd 7<CR>
map <Leader>q8 :bd 8<CR>
map <Leader>q9 :bd 9<CR>

" Save
nnoremap <C-s> :w<CR>

" Neogit
nnoremap <leader>gg :Neogit<CR>

" Telescope
nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fc <cmd>Telescope git_commits<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>fr <cmd>Telescope oldfiles<cr>
nnoremap <Leader>fk <cmd>Telescope keymaps<cr>

" Undotree
nnoremap <C-u> <cmd>UndotreeToggle<cr>

" ----		PLUGIN SETUP	---- "

" color scheme
colorscheme alduin

" ----		CONFIG END		---- "
