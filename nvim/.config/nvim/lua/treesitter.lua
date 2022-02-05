require'nvim-treesitter.configs'.setup {
    ensure_installed = {
        "python",
        "regex",
        "lua",
        "javascript",
        "bash",
        "toml",
        "rst",
        "html",
        "json",
        "yaml"
    },
    highlight = {
        enable = true
    },
    playground = {
        enable = true,
        disable = {},
        updatetime = 25,
        persist_queries = false
    },
    swap = {
        enable = true,
        swap_next = {
            ["<leader>fj"] = "@function.outer",
        },
        swap_previous = {
            ["<leader>fk"] = "@function.outer",
        },
    },
    textobject = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aB"] = "@block.outer",
                ["iB"] = "@block.inner",

            },
        },
        lsp_interop = {
            enable = true,
            border = 'none',
            peek_definition_code = {
                ["gh"] = "@function.outer",
                ["gH"] = "@class.outer",
            },
        },
    },
}
