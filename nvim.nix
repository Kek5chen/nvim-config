# NVim Config Setup
{ config, pkgs, ... }:

{
  config = {
    programs.neovim.enable = true;
    programs.neovim.extraConfig = ''
      :set number
      :set relativenumber
      :set autoindent
      :set tabstop=2
      :set shiftwidth=2
      :set smarttab
      :set softtabstop=2
      :set mouse=a
      :set laststatus=2
      :set expandtab
      :set termguicolors
      
      nnoremap <C-s> :w<CR>

      tnoremap <Esc> <C-\><C-n>
      map <Space> <Leader>
      nnoremap <leader>gg :Neogit<CR>

      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fc <cmd>Telescope git_commits<cr>
      nnoremap <leader>fk <cmd>Telescope keymaps<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>

      nnoremap <leader>n <cmd>NERDTreeToggle<cr>

      nnoremap <leader>h <cmd>noh<cr>

      nnoremap <silent> <C-n> :bnext<CR>
      nnoremap <silent> <C-p> :bprevious<CR>

      nnoremap <C-T>h <cmd>tabprevious<cr>
      nnoremap <C-T>l <cmd>tabnext<cr>
      nnoremap <C-T>j <cmd>tablast<cr>
      nnoremap <C-T>k <cmd>tabfirst<cr>

      :colorscheme happy_hacking

      let g:vimspector_enable_mappings = 'HUMAN'
    '';
    programs.neovim.extraLuaConfig = ''
      require('neogit').setup {
        integrations = {
          diffview = true
        },
        kind = "split"
      }
      vim.ftNix = false;
      
      -- crates

      local crates = require("crates")
      local opts = { silent = true }

      vim.keymap.set("n", "<leader>ct", crates.toggle, opts)
      vim.keymap.set("n", "<leader>cr", crates.reload, opts)

      vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, opts)
      vim.keymap.set("n", "<leader>cf", crates.show_features_popup, opts)
      vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, opts)

      vim.keymap.set("n", "<leader>cu", crates.update_crate, opts)
      vim.keymap.set("v", "<leader>cu", crates.update_crates, opts)
      vim.keymap.set("n", "<leader>ca", crates.update_all_crates, opts)
      vim.keymap.set("n", "<leader>cU", crates.upgrade_crate, opts)
      vim.keymap.set("v", "<leader>cU", crates.upgrade_crates, opts)
      vim.keymap.set("n", "<leader>cA", crates.upgrade_all_crates, opts)

      -- nvim-lspconfig

      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        end,
      })

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
      --    { name = 'vsnip' }, -- For vsnip users.
      --    { name = 'buffer' },
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

      -- he's crazy

      print("he's crazy")
    '';

    # programs.neovim.coc.enable = true;
    programs.neovim.plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (p: [ p.c p.cpp p.nix p.lua p.vim p.rust p.haskell ]))
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
      crates-nvim # rust crates helper
      rustaceanvim # rust everything helper
      webapi-vim # dependency for :RustPlay of rustacean
      nvim-cmp # auto completion
      nvim-lspconfig # lsp support
      vim-vsnip # snippet engine
      # cmp-vsnip # vsnip source for cmp
      cmp-nvim-lsp # LSP source for nvim-cmp
      # cmp-buffer # cmp buffer completions
      # cmp-path # cmp path completions
      # cmp-cmdline # cmp cmdline completions
      nvim-dap # debug adapter protocol
      nvim-dap-ui # debug adapter protocol ui
      # vimspector # debugger
      haskell-tools-nvim
    ];

    programs.neovim.defaultEditor = true;
    programs.neovim = {
      viAlias = true;
      vimAlias = true;
    };
  };
}
