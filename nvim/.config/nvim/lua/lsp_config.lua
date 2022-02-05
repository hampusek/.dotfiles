-- setup LSP and nvim-comp

vim.opt.completeopt={"menu", "menuone", "noselect"}

local cmp = require'cmp'

cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mappings = {
        ['<C-d'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select=true }),
    },
    sources = {
        { name='nvim_lsp' },
        { name='luasnip' },
        --{ name='buffer' },
    }
})

-- setup lspconfig
require('lspconfig')['pyright'].setup {
    on_atttach = function()
    -- vim.keymap.set() only works for nvim 0.7 or later
    --  map in normal mode K to buf hover
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer=0})
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definiition, {buffer=0})
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {buffer=0})
    vim.keymap.set("n", "<leader>dj", vim.disgnostic.goto_next, {buffer=0})
    vim.keymap.set("n", "<leader>dk", vim.disgnostic.goto_prev, {buffer=0})
    vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer=0})
    capabilities = require('cmp_nvim_lsp').update_cappabilities(vim.lsp.protocol.make_client_capabilities())
    end,
}
