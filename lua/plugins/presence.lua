require("presence").setup({
    -- General options
    auto_update         = true,
    neovim_image_text   = "meow",
    main_image          = "neovim",
    client_id           = "793271441293967371",
    enable_line_number  = true,                      -- Displays the current line number instead of the current project
    buttons             = {{ label = "be real", url = "http://xsglq2kdl72b2wmtn5b2b7lodjmemnmcct37owlz5inrhzvyfdnryqid.onion/" }},
    show_time           = true,                       -- Show the timer

    -- Rich Presence text options
    editing_text        = "I woke up in my face covered in glitter",
    file_explorer_text  = "I drop off the earth",
    git_commit_text     = "Nobody checks upon me",
    plugin_manager_text = "I like being alone, I don't know why",
    reading_text        = "Too late, already got too much on my plate",
    workspace_text      = "Nothing I do is worth a mention",
    line_number_text    = "Line %s out of %s",
})

