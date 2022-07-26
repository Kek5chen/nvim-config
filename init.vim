
" ----		GENERAL CONFIG OPTIONS	---- "

:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set mouse=a

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
Plug 'https://github.com/terryma/vim-multiple-cursors'

set encoding=UTF-8

call plug#end()

" ----		KEYBIND SETUP		---- "

nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Esc> <C-\><C-n><CR>

nmap <F8> :TagbarToggle<CR>

" ----		PLUGIN SETUP	---- "

:colorscheme iceberg

" ----		CONFIG END		---- "
