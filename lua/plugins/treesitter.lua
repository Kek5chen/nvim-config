require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "vim", "nix", "glsl", "rust", "asm" },
  highlight = {
    enable = true,
  },
}
