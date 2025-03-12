# NVim Config Setup
{ pkgs, ... }:

{
  config = {
    programs.neovim.enable = true;
    programs.neovim.extraConfig = ''
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
      
      nnoremap <C-s> :w<CR>

      tnoremap <Esc> <C-\><C-n>
      map <Space> <Leader>
      nnoremap <leader>gg :Neogit<CR>

      nnoremap gb :ls<CR>:b<Space>

      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fc <cmd>Telescope git_commits<cr>
      nnoremap <leader>fk <cmd>Telescope keymaps<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>
      nnoremap <leader>fp <cmd>Telescope diagnostics<cr>

      nnoremap <leader>gi <cmd>Gitsigns preview_hunk_inline<cr>
      nnoremap <C-u> <cmd>UndotreeToggle<cr>

      nnoremap <C-\> <cmd>CellularAutomaton make_it_rain<cr>

      nnoremap <leader>h <cmd>noh<cr>

      :colorscheme happy_hacking
      highlight NormalFloat guibg=#202020

      let g:vimspector_enable_mappings = 'HUMAN'

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

      xmap <leader>a  <Plug>(coc-codeaction-selected)
      nmap <leader>a  <Plug>(coc-codeaction-selected)

      nmap <leader>ac  <Plug>(coc-codeaction-cursor)
      nmap <leader>as  <Plug>(coc-codeaction-source)
      nmap <leader>qf  <Plug>(coc-fix-current)

      nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
      xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
      nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

      nmap <leader>cl  <Plug>(coc-codelens-action)
    '';
    programs.neovim.extraLuaConfig = ''
      require('neogit').setup {
        integrations = {
          diffview = true
        },
        graph_style = "unicode",
        process_spinner = true,
        kind = "split"
      }
      vim.ftNix = false;
      
      -- crates

      -- local crates = require("crates")
      -- local opts = { silent = true }

      -- vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
      -- vim.keymap.set("n", "<leader>cr", crates.reload, opts)

      -- vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
      -- vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
      -- vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)

      -- vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
      -- vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
      -- vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
      -- vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
      -- vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
      -- vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opts)

      -- nvim-lspconfig

      -- vim.api.nvim_create_autocmd('LspAttach', {
      --   group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      --   callback = function(ev)
      --     vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

      --     local opts = { buffer = ev.buf }
      --     vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
      --     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
      --     vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
      --     vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
      --   end,
      -- })

      -- require'lspconfig'.nil_ls.setup{}

      -- rustaceanvim
      
      local opts = { silent = true }

      vim.api.nvim_set_keymap('n', '<leader>rr', ':RustLsp runnables<CR>', { noremap=true, silent=true })
      vim.api.nvim_set_keymap('n', '<leader>rd', ':RustLsp debuggables<CR>', { noremap=true, silent=true })
      vim.api.nvim_set_keymap('n', '<C-d>', ':RustLsp renderDiagnostic<CR>', { noremap=true, silent=true })
      vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', {noremap = true, silent = true})


      -- nvim-cmp
      
      local cmp = require'cmp'

      cmp.setup({
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'buffer' },
          -- { name = 'path' },
          -- { name = 'cmdline' },
        })
      })

      -- nvim-dap-ui

      require("dapui").setup()

      vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
      vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
      vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
      vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
      vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
      vim.keymap.set('n', '<F9>', function() require('dap').toggle_breakpoint() end)
      vim.keymap.set('n', '<Leader>du', function() require('dapui').toggle() end)

      -- telescope

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<Leader>ff"] = require("telescope.actions").send_to_qflist,
            },
          },
          file_ignore_patterns = { "package-lock.json", "Cargo.lock", "vendor", "node_modules", ".git" },

          -- modifyed ivy
          sorting_strategy = "ascending",
          layout_strategy = "bottom_pane",
          layout_config = {
            height = 10,
          },
          border = false,
          borderchars = {
            prompt = { "─", " ", " ", " ", "─", "─", " ", " " },
            results = { " " },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true, -- override the file sorter
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
          },
          --["ui-select"] = {
          --require("telescope.themes").get_dropdown {}
          --}
        },
      })

      require('gitsigns').setup()

      local remap = vim.api.nvim_set_keymap
      local npairs = require('nvim-autopairs')
      npairs.setup({map_cr=false})

      _G.MUtils= {}
      MUtils.completion_confirm=function()
          if vim.fn["coc#pum#visible"]() ~= 0  then
              return vim.fn["coc#pum#confirm"]()
          else
              return npairs.autopairs_cr()
          end
      end

      remap('i' , '<CR>','v:lua.MUtils.completion_confirm()', {expr = true , noremap = true})

      -- treesitter

      require'nvim-treesitter.configs'.setup {
        highlight = {
          enable = true
        },
      }

      -- he's crazy

      print("he's crazy")
    '';

    # programs.neovim.coc.enable = true;
    programs.neovim.plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (p: [ p.c p.cpp p.nix p.lua p.vim p.rust p.haskell p.go ]))
      nerdtree # file tree
      vim-surround # easier parentheses modification
      vim-commentary # comment stuff out easier
      vim-airline # status/tabline at bottom of screen
      vim-css-color # show actual color next to color codes
      awesome-vim-colorschemes # more colorschemes
      vim-devicons # devicons for file types (get a nerdfont pls)
      tagbar # CTags viewer (function / class / variable trees)
      # ale # Linter, Fixer, Completions, Go To Definition / Find References etc..
      plenary-nvim # function library for other plugins
      neogit # neogit (best nvim git client)
      telescope-nvim # finder (finds everything)
      vim-startify # cool start menu
      vim-nix # nix syntax highlighting and so on
      # crates-nvim # rust crates helper
      rustaceanvim # rust everything helper
      webapi-vim # dependency for :RustPlay of rustacean
      nvim-cmp # auto completion
      # nvim-lspconfig # lsp support
      # vim-vsnip # snippet engine
      # cmp-vsnip # vsnip source for cmp
      # cmp-nvim-lsp # LSP source for nvim-cmp
      # cmp-buffer # cmp buffer completions
      # cmp-path # cmp path completions
      # cmp-cmdline # cmp cmdline completions
      nvim-dap # debug adapter protocol
      nvim-dap-ui # debug adapter protocol ui
      # vimspector # debugger
      gitsigns-nvim
      cellular-automaton-nvim
      nvim-autopairs
      undotree

      coc-nvim
      coc-yaml
      coc-json
      coc-rust-analyzer
      coc-go
      coc-toml

      auto-save-nvim
    ];

    programs.neovim.defaultEditor = true;
    programs.neovim = {
      viAlias = true;
      vimAlias = true;

      withNodeJs = true;
      withPython3 = true;
      withRuby = true;
    };
    programs.neovim.coc.settings = ''
      {
        "languageserver": {
          "nix": {
            "command": "nil",
            "filetypes": ["nix"],
            "rootPatterns":  ["flake.nix"],

            // Uncomment these to tweak settings.
            // "settings": {
            //   "nil": {
            //     "formatting": { "command": ["nixfmt"] }
            //   }
            // }
          }
        }
      }
    '';

    home.packages = with pkgs; [
      nil
      nodejs
      lldb
      gopls
      go
    ];
  };
}
