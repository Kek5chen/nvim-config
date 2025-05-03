" vimspector
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
set laststatus=2
set expandtab
set termguicolors
set encoding=utf-8
set nobackup
set nowritebackup
set signcolumn=yes

set updatetime=300

" ----		KEYBIND SETUP		---- "

" Save
nnoremap <C-s> :w<CR>

" Fix terminal escape
tnoremap <Esc> <C-\><C-n>

map <Space> <Leader>

" Neogit
nnoremap <leader>gg :Neogit<CR>

" Simpler buffer navigation
nnoremap gb :ls<CR>:b<Space>

" Telescope
nnoremap <Leader>ff <cmd>Telescope find_files<cr>
nnoremap <Leader>fg <cmd>Telescope live_grep<cr>
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
nnoremap <C-u> <cmd>UndotreeToggle<cr>

" Psshhh
nnoremap <C-\> <cmd>CellularAutomaton make_it_rain<cr>

nnoremap <leader>h <cmd>noh<cr>

" ----		PLUGIN SETUP	---- "

" color scheme
colorscheme catppuccin-mocha

highlight NormalFloat guibg=#202020

let g:vimspector_enable_mappings = 'HUMAN'

" Coc configuration
inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1) :
  \ CheckBackspace() ? "\<Tab>" :
  \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

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
nmap <silent><nowait> gr <Plug>(coc-references)

nnoremap <silent> K :call ShowDocumentation()<CR>
function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

command! -nargs=0 Format :call CocActionAsync('format')
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

nmap <leader>ac  <Plug>(coc-codeaction-cursor)
nmap <leader>as  <Plug>(coc-codeaction-source)
nmap <leader>qf  <Plug>(coc-fix-current)

nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

nmap <leader>cl  <Plug>(coc-codelens-action)

" ----		CONFIG END		---- "
