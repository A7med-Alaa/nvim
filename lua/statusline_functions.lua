
local M = {}

function M.lsp_progress()
  local messages = vim.lsp.status()
  if #messages == 0 then
    return ""
  end

  local status = {}
  for _, msg in pairs(messages) do
    table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
  end

  local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
  local ms = vim.loop.hrtime() / 1000000
  local frame = math.floor(ms / 120) % #spinners
  return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

function M.lsp_status()
  local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
  if lsps and #lsps > 0 then
    local names = {}
    for _, lsp in ipairs(lsps) do
      table.insert(names, lsp.name)
    end
    return table.concat(names, ", ")
  else
    return ""
  end
end

return M
