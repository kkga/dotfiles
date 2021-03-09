local nvim_lsp = require("lspconfig")
local status = require("lsp-status")

-- local saga = require "lspsaga"

-- add your config value here
-- default value
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
-- code_action_keys = { quit = 'q',exec = '<CR>' }
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- 1: thin border | 2: rounded border | 3: thick border | 4: ascii border
-- border_style = 1
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}

-- saga.init_lsp_saga {
--   your custom option here
-- }

-- saga.init_lsp_saga()

local mapper = function(mode, key, result)
    vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua " .. result .. "<cr>", {noremap = true, silent = true})
end

local custom_attach = function(client, bufnr)
    print("LSP started")
    status.on_attach(client, bufnr)

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

status.config(
    {
        status_symbol = "",
        indicator_errors = "E",
        indicator_warnings = "W",
        indicator_info = "I",
        indicator_hint = "H",
        indicator_ok = "✔️",
        spinner_frames = {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"}
    }
)

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local servers = {"gopls", "svelte", "cssls", "html", "tsserver"}

for _, lsp in ipairs(servers) do
    nvim_lsp[lsp].setup {
        on_attach = custom_attach,
        capabilities = capabilities
    }
end

-- local eslint = {
--     lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
--     lintStdin = true,
--     lintFormats = {"%f:%l:%c: %m"},
--     lintIgnoreExitCode = true,
--     formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
--     formatStdin = true
-- }

-- require "lspconfig".efm.setup {
--     init_options = {documentFormatting = true},
--     filetypes = {"javascript", "typescript"},
--     -- root_dir = function(fname)
--     --     return util.root_pattern("tsconfig.json")(fname) or util.root_pattern(".eslintrc.js", ".git")(fname)
--     -- end,
--     init_options = {documentFormatting = true},
--     settings = {
--         rootMarkers = {".eslintrc.js", ".git/"},
--         languages = {
--             javascript = {eslint},
--             typescript = {eslint}
--         }
--     }
-- }
