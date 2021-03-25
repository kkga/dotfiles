local nvim_lsp = require("lspconfig")
local status = require("lsp-status")

local mapper = function(mode, key, result)
	vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<cr>", { noremap = true, silent = true })
end

local custom_attach = function(client, bufnr)
	print("LSP started")
	status.on_attach(client, bufnr)

	vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
		virtual_text = {
			prefix = "»",
			spacing = 4,
		},
		signs = true,
		update_in_insert = false,
	})

	vim.fn.sign_define("LspDiagnosticsSignError", { text = "E" })
	vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "W" })
	vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "I" })
	vim.fn.sign_define("LspDiagnosticsSignHint", { text = "H" })

	mapper("n", "gj", "vim.lsp.diagnostic.goto_next()")
	mapper("n", "gk", "vim.lsp.diagnostic.goto_prev()")
	mapper("n", "gd", "vim.lsp.buf.definition()")
	mapper("n", "gD", "vim.lsp.buf.declaration()")
	mapper("n", "gh", "vim.lsp.buf.hover()")
	mapper("n", "gR", "vim.lsp.buf.rename()")
	mapper("n", "gr", "vim.lsp.buf.references()")
	mapper("n", "gF", "vim.lsp.buf.formatting()")
	mapper("n", "ga", "vim.lsp.buf.code_action()")

	-- Set autocommands conditional on server_capabilities
	if client.resolved_capabilities.document_highlight then
		vim.api.nvim_exec(
			[[
              hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
              hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
              hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
              augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
              augroup END
            ]],
			false
		)
	end
end

status.config({
	status_symbol = "",
	indicator_errors = "E:",
	indicator_warnings = "W:",
	indicator_info = "I:",
	indicator_hint = "H:",
	indicator_ok = "✔️",
	spinner_frames = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
})

local lua_settings = {
	Lua = {
		runtime = {
			-- LuaJIT in the case of Neovim
			version = "LuaJIT",
			path = vim.split(package.path, ";"),
		},
		diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = { "vim", "use" },
		},
		workspace = {
			-- Make the server aware of Neovim runtime files
			library = {
				[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
			},
		},
	},
}

local function make_config()
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities.textDocument.completion.completionItem.snippetSupport = true
	return {
		capabilities = capabilities,
		on_attach = custom_attach,
	}
end

-- lsp-install
local function setup_servers()
	require("lspinstall").setup()

	-- get all installed servers
	local servers = require("lspinstall").installed_servers()

	for _, server in pairs(servers) do
		local config = make_config()
		if server == "lua" then
			config.settings = lua_settings
		end

		-- language specific config
		if server == "tailwindcss" then
			config.filetypes = { "svelte" }
		end
		if server == "efm" then
			config.init_options = { documentFormatting = true }
			config.filetypes = { "markdown", "lua" }
			config.settings = {
				rootMarkers = { ".git/", ".package.json" },
				languages = {
					lua = { "stylua" },
				-- lua = {
				--   {formatCommand = "stylua", formatStdin = true}
				-- }
				},
			}
		end

		nvim_lsp[server].setup(config)
	end
end

setup_servers()

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require("lspinstall").post_install_hook = function()
	setup_servers() -- reload installed servers
	vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
