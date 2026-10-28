local treesitter = require("nvim-treesitter")

treesitter.setup({
  install_dir = vim.fn.stdpath("data") .. "/site",
})

treesitter.install({
  "c", "cpp", "lua", "vim", "nix", "glsl", "rust", "asm",
  "markdown", "markdown_inline",
})

vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true }),
  callback = function(event)
    local language = vim.treesitter.language.get_lang(vim.bo[event.buf].filetype)
    if language and vim.treesitter.language.add(language) then
      vim.treesitter.start(event.buf, language)
    end
  end,
})
