local gitsigns = require("gitsigns")

gitsigns.setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "▎" },
		change = { hl = "GitSignsChange", text = "▎" },
		delete = { hl = "GitSignsDelete", text = "◢" },
		topdelete = { hl = "GitSignsDelete", text = "◥" },
		changedelete = { hl = "GitSignsChangeDelete", text = "▌" },
	},
	keymaps = {
		buffer = true,
		["n ]g"] = "<cmd>lua require\"gitsigns\".next_hunk({wrap = true})<CR>",
		["n [g"] = "<cmd>lua require\"gitsigns\".prev_hunk({wrap = true})<CR>",
		["n <Space>+"] = "<cmd>lua require\"gitsigns\".stage_hunk()<CR>",
		["n <Space>-"] = "<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>",
		["n <Space>p"] = "<cmd>lua require\"gitsigns\".preview_hunk()<CR>",
	},
	max_file_length = 100000,
})
