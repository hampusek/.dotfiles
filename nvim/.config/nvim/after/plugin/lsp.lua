-- setup LSP and nvim-comp
local Remap = require("hampus.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

vim.opt.completeopt={"menu", "menuone", "noselect"}

local lspconfig = require("lspconfig")
local cmp = require("cmp")
local ls = require("luasnip")
local types = require("luasnip.util.types")
local tabnine = require("cmp_tabnine.config")
require('luasnip.loaders.from_vscode').lazy_load()

ls.config.set_config {
    -- This tells LuaSnip to remember to keep around the last snippet.
    -- You can jump back into it even if you move outside of the selection
    history = true,

    -- Update dynamic snippets as you type
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets:
    enable_autosnippets = true,

    -- Crazy highlights!!
    ext_opts = {
        [types.choiceNode] = {
            active = {
                virt_text = { { "<--", "GruvboxOrange" }},
            },
        },
    },
}

-- keymaps for lua snips
-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
inoremap("<c-k>", function()
    if ls.expand_or_jumpable() then
        ls.expand_or_jump()
    end
end)

-- <c-j> jump backwards key e.g. move to previous item within the snippet
inoremap("<c-j>", function()
    if ls.jumpable(-1) then
        ls.jump(-1)
    end
end)

-- <c-l> selection within a list of options
inoremap("<c-l>", function()
    if ls.choice_active() then
        ls.choice_active(1)
    end
end)

cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-u'] = cmp.mapping.scroll_docs(-4),
        ['<C-d>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.close(),
        ['<C-y>'] = cmp.mapping.confirm({ select=true }),
        -- luasnip
        ['<c-k>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            end
        end)

    }),
    sources = {
        { name = "cmp_tabnine" },
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

tabnine:setup({
	max_lines = 1000,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = "..",
})

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").default_capabilities(),
		on_attach = function()
			nnoremap("<leader>gd", function() vim.lsp.buf.definition() end)
			nnoremap("K", function() vim.lsp.buf.hover() end)
			nnoremap("<leader>vws", function() vim.lsp.buf.workspace_symbol() end)
			nnoremap("<leader>vd", function() vim.diagnostic.open_float() end)
			nnoremap("[d", function() vim.diagnostic.goto_next() end)
			nnoremap("]d", function() vim.diagnostic.goto_prev() end)
			nnoremap("<leader>vca", function() vim.lsp.buf.code_action() end)
			nnoremap("<leader>vrr", function() vim.lsp.buf.references() end)
			nnoremap("<leader>vrn", function() vim.lsp.buf.rename() end)
			inoremap("<C-h>", function() vim.lsp.buf.signature_help() end)
		end,
	}, _config or {})
end


-- setup lspconfig
-- Had problems with slow startuptime using pyright...
--
-- lspconfig.pyright.setup(config())

lspconfig.jedi_language_server.setup(config())
-- clangd
lspconfig.clangd.setup(config())
-- gopls
lspconfig.gopls.setup(config(
    {
      settings = {
        gopls = {
          analyses = {
            unusedparams = true,
          },
          staticcheck = true,
          gofumpt = true,
        },
      },
    }
))

local autocmd = vim.api.nvim_create_autocmd

autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})

lspconfig.rust_analyzer.setup(config(), {settings={ ["rust-analyzer"] = {} }})


ls.snippets = {
    all = {
        -- Available in any filetype
        ls.parser.parse_snippet("expand", "-- this is what was expanded!")
    },

    lua = {
        -- lua specific snippet go here...
        ls.parser.parse_snippet("lf", "local $1 = function($2)\n $0\nend"),
    },
}

