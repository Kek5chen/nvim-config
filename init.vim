" ----		GENERAL CONFIG OPTIONS	---- "

:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a
:set laststatus=2

" ----		PLUGIN SETUP	---- "

call plug#begin()

Plug 'https://github.com/preservim/nerdtree'
Plug 'https://github.com/tpope/vim-surround'
Plug 'https://github.com/tpope/vim-commentary'
Plug 'https://github.com/vim-airline/vim-airline'
Plug 'https://github.com/ap/vim-css-color'
Plug 'https://github.com/rafi/awesome-vim-colorschemes'
Plug 'https://github.com/neoclide/coc.nvim'
Plug 'https://github.com/ryanoasis/vim-devicons'
Plug 'https://github.com/preservim/tagbar'
Plug 'https://github.com/vim-syntastic/syntastic'
Plug 'https://github.com/alexandregv/norminette-vim'
Plug 'sheerun/vim-polyglot'
Plug 'github/copilot.vim'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'
Plug 'jbyuki/instant.nvim'

set encoding=UTF-8

call plug#end()

" ----		KEYBIND SETUP		---- "

map <Space> <Leader>

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

" NerdTree
nmap <Leader>n :NERDTreeToggle<CR>
:tnoremap <Esc> <C-\><C-n>

" Tagbar
nmap <F8> :TagbarToggle<CR>

" Save
nnoremap <C-s> :w<CR>

" Neogit
nnoremap <leader>gg :Neogit<CR>

" ----		PLUGIN SETUP	---- "

" color scheme
:colorscheme iceberg

" bufferline
:set termguicolors
lua << EOF
require("bufferline").setup {
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			local s = " "
			for e, n in pairs(diagnostics_dict) do
				local sym = e == "error" and " "
				or (e == "warning" and " " or "" )
				s = s .. n .. sym
			end
			return s
		end,
		hover = {
			enabled = true,
			delay = 200,
			reveal = {'close'}
		},
	}
}
EOF

" neogit
lua << EOF
require('neogit').setup {
	integrations = {
		diffview = true
	},
	kind = "split"
}
EOF

" instant.nvim
let g:instant_username = 'kx'

" ----		CONFIG END		---- "
