return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function ()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { "c", "cpp", "java", "python", "javascript", "typescript", "lua", "rust", "bash" },
            sync_install = true,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
