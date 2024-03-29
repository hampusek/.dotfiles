local augroup = vim.api.nvim_create_augroup
TheGroupe = augroup("TheGroup", {clear = true})

require("hampus.set")

require("hampus.lazy")
require("hampus.debugger")

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 70,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = TheGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25


