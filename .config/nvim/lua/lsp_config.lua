local lsp = require('lspconfig')
local status = require('lsp-status')

local mapper = function(mode, key, result)
  vim.api.nvim_buf_set_keymap(0, mode, key, "<cmd>lua "..result.."<cr>", {noremap = true, silent = true})
end

local custom_attach = function(client, bufnr)
  print("LSP started");
  -- completion.on_attach(client, bufnr)
  status.on_attach(client, bufnr)

  -- Move cursor to the next and previous diagnostic
  mapper('n', 'gj', 'vim.lsp.diagnostic.goto_next()')
  mapper('n', 'gk', 'vim.lsp.diagnostic.goto_prev()')
  mapper('n', 'gd', 'vim.lsp.buf.definition()')
  mapper('n', 'gD', 'vim.lsp.buf.declaration()')
  mapper('n', 'gh', 'vim.lsp.buf.hover()')
  mapper('n', 'gR', 'vim.lsp.buf.rename()')
  mapper('n', 'gr', 'vim.lsp.buf.references()')
  mapper('n', 'gF', 'vim.lsp.buf.formatting()')
  mapper('n', 'ga', 'vim.lsp.buf.code_action()')
end

status.config({
  status_symbol = '',
  indicator_errors = 'E',
  indicator_warnings = 'W',
  indicator_info = 'I',
  indicator_hint = 'H',
  indicator_ok = '✔️',
  spinner_frames = { '⣾', '⣽', '⣻', '⢿', '⡿', '⣟', '⣯', '⣷' },
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lsp.gopls.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
lsp.tsserver.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
lsp.html.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
lsp.svelte.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
lsp.cssls.setup{
  on_attach = custom_attach,
  capabilities = capabilities
}
lsp.cssls.setup{
  on_attach = custom_attach,
  capabilities = status.capabilities
}
