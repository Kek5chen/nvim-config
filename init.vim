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
Plug 'glepnir/dashboard-nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

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

" Telescope
nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>fr <cmd>Telescope oldfiles<cr>

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

" dashboard
lua << EOF
local dash = require('dashboard')
dash.custom_header = {
	"                    >,o~o\\/)-'     ,-'         \\       ,.__.,-                ",
	"                    <\\__,'c~      (.---..____..,'      >'oo \\~)               ",
	"                       |--'_.---~~~~:     __.......__ `-`---'(                ",
	"                      ',-~~         |   /'           `~~-. `'       .-~~~~.   ",
	"                     ','            ; ,'                  |    '~~\\  |     `. ",
	"                   ,','            ; ;                    |  ,'    | |      | ",
	"                 ,.|,'            / |                     |  |     | `.     | ",
	"                | \\`|           ,'  |                     | _.--,  `. |     `.",
	"                |  | \\      _.-'___                   _.--~~,-',    | |      |",
	"                |  `. |--__..-~~   ~~~~~---...___.--~~ _,-'~ ,|     | `.__,--'",
	"                |   | /';                     ./'   _,'     / |_,--~~         ",
	"                `   /' |                _.---'  _,-'      ,'                  ",
	"                 \\/'   |              /'      ~~ ~~--._   ;                   ",
	"       `\\ `\\    ,','~~\\|            /'   __        .--'  /__,   __            ",
	"         `\\ `\\_.||  ;  ||         /'  ,-~  `~.    '----~~~_.--~~              ",
	"           `\\/`  |  |  ;______  ,'   |  ,'    |       _.-~  ;               _,",
	"      --..__|    `\\_`,'\\     _`\\     `. |     ;   .-~~   __..----~~~~~      \\ ",
	"       _,-~ |  `-       `--~~          `----~'_..-    ~~~  /                | ",
	"     /'--.   \\                           _       / ,'  ~~~7~~~~~~~~         |/",
	"   ,'     ~-. `--.------------....__   /'_\\_...-'       ,'`-.      /        |-",
	",-~~~~-._   /   (`-\\___|___;...--'--~~~~~            ,-'     |    |         |~",
	"/~~~-    ~~~     `\\                            _,__,'   ___,-'    |         | ",
	"`-.                `-..___...__            _.-'/    ~~~~          ;         ; ",
	"`--`\\____       __..---~~ ~~--..~--------~~   |                  ,'       ,'  "
}
dash.custom_center = {
	{icon = '', desc = '  Find File                  ', shortcut = '<l> ff', action = 'Telescope find_files'},
	{icon = '', desc = '  Recently Used Files        ', shortcut = '<l> fr', action = 'Telescope oldfiles'},
	{icon = '', desc = '  Live Grep                  ', shortcut = '<l> fg', action = 'Telescope live_grep'},
	{icon = '', desc = '  Merge Conflicts            ', shortcut = '<l> gg', action = 'Neogit'},
	{icon = '', desc = '  Cope                       ', shortcut = '      ', action = 'qa!'}
}
dash.footer_pad = 5
dash.custom_footer = {
	"Depressive realism",
	"",
	"Depressive realism is the hypothesis developed by Lauren Alloy and Lyn Yvonne Abramson that depressed individuals make more realistic inferences than non-depressed individuals.",
	"Although depressed individuals are thought to have a negative cognitive bias that results in recurrent, negative automatic thoughts,",
	"maladaptive behaviors, and dysfunctional world beliefs, depressive realism argues not only that this negativity may reflect a more accurate appraisal of the world", 
	"but also that non-depressed individuals' appraisals are positively biased.",
	"- From Wikipedia, the free encyclopedia"
}

EOF
" ----		CONFIG END		---- "
