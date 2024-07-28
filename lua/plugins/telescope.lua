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
