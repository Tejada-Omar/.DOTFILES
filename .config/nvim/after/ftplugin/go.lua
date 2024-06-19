vim.o.expandtab = false

local winid = vim.api.nvim_get_current_win()
vim.wo[winid][0].list = false
