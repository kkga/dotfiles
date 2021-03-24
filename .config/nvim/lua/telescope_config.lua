local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		sorting_strategy = "ascending",
		preview_cutout = 1,
		results_height = 20,
		layout_strategy = "center",
		results_title = false,
		preview_title = false,
		borderchars = {
			{ "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
			prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
			results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
			preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		},
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-l>"] = actions.smart_send_to_qflist,
			},
			n = {
				["<esc>"] = actions.close,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("fzy_native")
