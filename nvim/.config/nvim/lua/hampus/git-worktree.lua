local Worktree = require("git-worktree")

local M = {}
function M.execute(path)
    print("path: ", path)
    local command = string.format(":silent !tmux-pem %s", path)
    vim.cmd(command)
end

Worktree.on_tree_change(function(_ --[[op]], path, _ --[[upstream]])
    M.execute(path.path)
end)

return M
