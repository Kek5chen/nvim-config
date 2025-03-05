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

" Save
nnoremap <C-s> :w<CR>

" Fix terminal escape
tnoremap <Esc> <C-\><C-n>

map <Space> <Leader>

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

" Psshhh
nnoremap <C-\> <cmd>CellularAutomaton make_it_rain<cr>

nnoremap <leader>h <cmd>noh<cr>

" ----		PLUGIN SETUP	---- "

" color scheme
colorscheme alduin

let g:vimspector_enable_mappings = 'HUMAN'

" ----		CONFIG END		---- "
