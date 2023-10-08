-- bootstrap lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local packages = {
    "mbbill/undotree",
    -- TJ
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { {"nvim-lua/plenary.nvim"} }
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
    },
    -- Git stuff
    "tpope/vim-fugitive",
    "lewis6991/gitsigns.nvim",
    -- LSP
    "neovim/nvim-lspconfig",
    {
        "hrsh7th/nvim-cmp",
        dependencies = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip"}
    },
    "rafamadriz/friendly-snippets",
    {
        'tzachar/cmp-tabnine',
        build='./install.sh',
        dependencies = 'hrsh7th/nvim-cmp'
    },
    "folke/zen-mode.nvim",
    -- Prime
    "ThePrimeagen/git-worktree.nvim",
    "ThePrimeagen/harpoon",
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "nvim-treesitter/playground",
    "romgrk/nvim-treesitter-context",
    "mfussenegger/nvim-dap",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    -- markdown
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },

}

local options = {}

return require("lazy").setup(packages, options)

