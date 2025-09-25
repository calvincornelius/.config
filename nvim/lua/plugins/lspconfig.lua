local lspconfig = require('lspconfig')
local lsphint = require('lsp-inlayhints')
local servers = { 'lua_ls', 'ts_ls', 'jsonls', 'hyprls', 'pyright', 'html' }
vim.diagnostic.config({
  virtual_text = false
})

vim.api.nvim_create_augroup("LspAttach_inlayhints", {})
vim.api.nvim_create_autocmd("LspAttach", {
  group = "LspAttach_inlayhints",
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    lsphint.on_attach(client, bufnr)
  end,
})
for _, lsp in pairs(servers) do
	lspconfig[lsp].setup {
		on_attach = bufnr,
		capabilites = {},
	}
end
-- Show line diagnostics automatically in hover window
vim.o.updatetime = 250
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]
