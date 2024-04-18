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

      tnoremap <Esc> <C-\><C-n>
      map <Space> <Leader>
      nnoremap <leader>gg :Neogit<CR>

      nnoremap <leader>ff <cmd>Telescope find_files<cr>
      nnoremap <leader>fg <cmd>Telescope live_grep<cr>
      nnoremap <leader>fb <cmd>Telescope buffers<cr>
      nnoremap <leader>fc <cmd>Telescope git_commits<cr>
      nnoremap <leader>fh <cmd>Telescope help_tags<cr>

      nnoremap <leader>n <cmd>NERDTreeToggle<cr>

      :colorscheme alduin
    '';
    programs.neovim.extraLuaConfig = ''
      require('neogit').setup {
      integrations = {
        diffview = true
      },
        kind = "split"
      }
    '';
      # programs.neovim.coc.enable = true;
    programs.neovim.plugins = with pkgs.vimPlugins; [
      (nvim-treesitter.withPlugins (p: [ p.c p.cpp p.nix p.lua p.vim ]))
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
