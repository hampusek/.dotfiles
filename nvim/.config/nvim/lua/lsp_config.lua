-- setup LSP and nvim-comp

vim.opt.completeopt={"menu", "menuone", "noselect"}

local cmp = require'cmp'
local ls = require("luasnip")
require('luasnip.loaders.from_vscode').lazy_load()
-- /Users/hampusek/auto_docstring/autoDocstring
require('luasnip/loaders/from_vscode').lazy_load({path = '~/auto_docstring/autoDocstring'})

ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection
    history = true,

    -- Update dynamic snippets as you type
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    -- Crazy highlights!!
    --ext_opts = {
    --    [types.choiceNode] = {
    --        active = {
    --            virt_text = { { "<--", "Error" }},
    --        },
    --    },
    --},
}

-- keymaps for lua snips
-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set({ "i", "s" }, "<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end, { silent = true })

-- <c-j> jump backwards key e.g. move to previous item within the snippet
vim.keymap.set({ "i", "s" }, "<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end, { silent = true })

-- <c-l> selection within a list of options
vim.keymap.set( "i", "<c-l>", function()
    if ls.choice_active() then
        ls.choice_active(1)
    end
end)


cmp.setup({
    mappings = {
        ['<C-d'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<CR>'] = cmp.mapping.confirm({ select=true }),
        -- luasnip
        --['<c-k>'] = cmp.mapping(function(fallback)
        --    if cmp.visible() then
        --        cmp.select_next_item()

    },
    sources = {
        { name='nvim_lsp' },
        { name='luasnip' },
        { name='buffer' },
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
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
