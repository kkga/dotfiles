local gitsigns = require("gitsigns")

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "+" },
		change = { hl = "GitSignsChange", text = "~" },
		delete = { hl = "GitSignsDelete", text = "x" },
		topdelete = { hl = "GitSignsDelete", text = "x" },
		changedelete = { hl = "GitSignsChangeDelete", text = "x~" },
	},
	max_file_length = 100000,
})
