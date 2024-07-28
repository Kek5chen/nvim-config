require("presence").setup({
    -- General options
    auto_update         = true,
    neovim_image_text   = "real",
    main_image          = "neovim",
    client_id           = "793271441293967371",
    enable_line_number  = true,                      -- Displays the current line number instead of the current project
    buttons             = {{ label = "be real", url = "http://xsglq2kdl72b2wmtn5b2b7lodjmemnmcct37owlz5inrhzvyfdnryqid.onion/" }},
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "I can't see like i just got made",
    file_explorer_text  = "Fuck a plane",
    git_commit_text     = "Pop a perky, look like im chinese",
    plugin_manager_text = "Fuck a phone",
    reading_text        = "I be high with the gods",
    workspace_text      = "Everything we did was too legitly",
    line_number_text    = "Line %s out of %s",
})

