return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    keys = {
        {"<leader>pf","<cmd>Telescope find_files<cr>",desc = "Find Files"},
        {"<leader>vh","<cmd>Telescope help_tags<cr>",desc = "Search Help"},
        {"<C-p>","<cmd>Telescope git_files<cr>",desc = "Find Files in Git"},
        {"<leader>ps", function()
            local builtin = require("telescope.builtin")
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end,
            desc = "Find Files that contains input",
        },
    },
}
