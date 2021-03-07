require("plugins")
require("lsp_config")
require("telescope_config")
require("completion_config")

vim.cmd "au TextYankPost * lua vim.highlight.on_yank {on_visual = false}" -- disabled in visual mode
