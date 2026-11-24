let mapleader = ' '
let maplocalleader = ' '

if has('win32')
  set noshelltemp
  let &shell = 'powershell.exe'
  let &shellcmdflag = '-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command '
  let &shellcmdflag .= '[Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();'
  let &shellcmdflag .= '$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
  let &shellpipe = '> %s 2>&1'
  set shellquote= shellxquote=
endif

runtime lua/init.lua
" ----		GENERAL CONFIG OPTIONS	---- "

set number
set relativenumber
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set softtabstop=2
set mouse=a
set scrolloff=5
set splitbelow splitright
set ignorecase smartcase
set cursorline cursorlineopt=number
set laststatus=2
set expandtab
set termguicolors
set encoding=utf-8
set nobackup
set nowritebackup
set signcolumn=yes

set updatetime=300

set hidden
set undofile

" ----		KEYBIND SETUP		---- "

" Save
nnoremap <C-s> :w<CR>

" Neogit
nnoremap <leader>gg :Neogit<CR>

" Simpler buffer navigation
nnoremap gb :ls<CR>:b<Space>

" Telescope
nnoremap <Leader>fb <cmd>Telescope buffers<cr>
nnoremap <Leader>fc <cmd>Telescope git_commits<cr>
nnoremap <Leader>fh <cmd>Telescope help_tags<cr>
nnoremap <Leader>fr <cmd>Telescope oldfiles<cr>
nnoremap <Leader>fk <cmd>Telescope keymaps<cr>
nnoremap <leader>fp <cmd>Telescope diagnostics<cr>
nnoremap <leader>ft <cmd>Telescope treesitter<cr>

"Gitsigns
nnoremap <leader>gi <cmd>Gitsigns preview_hunk_inline<cr>
nnoremap <leader>bb <cmd>Gitsigns blame<cr>

" Undotree
nnoremap <leader>u <cmd>UndotreeToggle<cr>

nnoremap <leader>h <cmd>noh<cr>

" ----		PLUGIN SETUP	---- "

" color scheme
colorscheme industry

" Coc configuration
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-d>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

nmap <silent><nowait> [g <Plug>(coc-diagnostic-prev)
nmap <silent><nowait> ]g <Plug>(coc-diagnostic-next)

nmap <silent><nowait> gd <Plug>(coc-definition)
nmap <silent><nowait> gy <Plug>(coc-type-definition)
nmap <silent><nowait> gi <Plug>(coc-implementation)
nmap <silent> grr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if get(g:, 'coc_service_initialized', 0) && CocHasProvider('hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

augroup CocDocumentHighlight
  autocmd!
  autocmd CursorHold * if &buftype ==# '' && !get(b:, 'native_lsp', 0) && get(g:, 'coc_service_initialized', 0) && CocHasProvider('documentHighlight') | call CocActionAsync('highlight') | endif
augroup END

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>lf <Plug>(coc-format-selected)
nnoremap <leader>lf <cmd>Format<cr>

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

xmap <leader>a  <Plug>(coc-codeaction-cursor)
nmap <leader>a  <Plug>(coc-codeaction-cursor)
nmap <leader>sa  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>re <Plug>(coc-codeaction-refactor-selected)

nmap <leader>cl  <Plug>(coc-codelens-action)

" CoC owns the temporary cursor selections even in native LSP buffers.
nmap <silent> <leader>mw <Plug>(coc-cursors-word)
xmap <silent> <leader>mw <Plug>(coc-cursors-range)
nmap <silent> <leader>mp <Plug>(coc-cursors-position)
nnoremap <silent> <leader>ma <cmd>lua require('plugins.cursors').select_matches()<cr>

" ----		CONFIG END		---- "
