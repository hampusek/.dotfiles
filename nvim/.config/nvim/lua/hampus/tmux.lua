-- Some helper methods for tmux

local function getSelection()
  local line_start, line_end, lines

  line_start = vim.fn.line("'<")
  line_end = vim.fn.line("'>")

  lines = vim.fn.getline(line_start, line_end)
  return table.concat(lines, "\n")
end

local function getCurrentLine()
  local line_start, line_end, lines
  line_start = vim.fn.line(".")
  line_end = line_start
  lines = vim.fn.getline(line_start, line_end)
  return table.concat(lines, "\n")
end

local function sendToTmux(pane, command)

  -- Escape single quotes for safe shell usage
  command = command:gsub("'", "'\\''")

  -- Send to the specified tmux pane as a single command
  os.execute(string.format("tmux send-keys -t %s '%s' Enter", pane, command))
end

function SelectionToTmux(pane)
    local command
    command = getSelection()
    sendToTmux(pane, command)
end


function LineToTmux(pane)
    local command
    command = getCurrentLine()
    sendToTmux(pane, command)
end

