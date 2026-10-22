-- Options are automatically loaded before lazy.nvim startup.

local has = vim.fn.has
local executable = vim.fn.executable

if has("macunix") == 1 and executable("pbcopy") == 1 and executable("pbpaste") == 1 then
  vim.g.clipboard = "pbcopy"
elseif vim.env.WAYLAND_DISPLAY and executable("wl-copy") == 1 and executable("wl-paste") == 1 then
  vim.g.clipboard = "wl-copy"
else
  vim.g.clipboard = "osc52"
end

vim.opt.clipboard = "unnamedplus"

