--[[
local Remap = require("hampus.keymap")
local nnoremap = Remap.nnoremap
local inoremap = Remap.inoremap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

local config = {
    cmd = {'/mnt/home/a392673/jdtls/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
    capabilities = capabilities,
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
            nnoremap("<leader>f>", function() require'jdtls'.organize_imports() end)
            nnoremap("crv", function() require('jdtls').extract_variable() end)
            vnoremap("crv", function() require('jdtls').extract_variable(true) end)
            nnoremap("crc", function() require('jdtls').extract_constant() end)
            vnoremap("crc", function() require('jdtls').extract_constant(true) end)
            vnoremap("crm", function() require('jdtls').extract_method(true) end)
		end,
}
require('jdtls').start_or_attach(config)
--]]

