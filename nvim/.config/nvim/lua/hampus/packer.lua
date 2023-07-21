return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    use("mbbill/undotree")

    -- TJ
    use {
        "nvim-telescope/telescope.nvim",
        requires = { {"nvim-lua/plenary.nvim"} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
    })

    -- Git stuff
    use("tpope/vim-fugitive")
    use('lewis6991/gitsigns.nvim')
    if vim.fn.executable "gh" == 1 then
        use {
            "pwntester/octo.nvim",
            requires = {
                'nvim-lua/plenary.nvim',
                'nvim-telescope/telescope.nvim',
                'kyazdani42/nvim-web-devicons',
            },
            config = function ()
                require"octo".setup()
            end
        }
    end


    -- LSP
    use("neovim/nvim-lspconfig")
    use {
        "hrsh7th/nvim-cmp",
        requires = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"}
    }
    use("rafamadriz/friendly-snippets")

    use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
    --use("glepnir/lspsaga.nvim")
    --use("simrat39/symbols-outline.nvim")

    -- java
    -- use('mfussenegger/nvim-jdtls')

    use("folke/zen-mode.nvim")

    -- Prime
    use("ThePrimeagen/git-worktree.nvim")
    use("ThePrimeagen/harpoon")


    use("nvim-treesitter/nvim-treesitter", {
        run = ":TSUpdate"
    })

    use("nvim-treesitter/playground")
    use("romgrk/nvim-treesitter-context")

    use("mfussenegger/nvim-dap")
    use("rcarriga/nvim-dap-ui")
    use("theHamsta/nvim-dap-virtual-text")

    -- markdown
    use({
        "iamcco/markdown-preview.nvim",
        run = function() vim.fn["mkdp#util#install"]() end,
    })


end)

