vim.opt.cursorline = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.number = true
vim.opt.completeopt = { "fuzzy", "noinsert", "popup", "menuone" }
vim.cmd.colorscheme("catppuccin")

vim.pack.add{
  { src = 'https://github.com/neovim/nvim-lspconfig' },
  { src = 'https://github.com/kylechui/nvim-surround' }
}

-- diagnostics
vim.keymap.set("n", "gh", vim.diagnostic.open_float, { desc = "Show diagnostic" })
vim.keymap.set("n", "g]", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set("n", "g[", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })

-- LSP
vim.lsp.enable('pyright')
vim.lsp.enable('clangd')
vim.lsp.enable('bashls')
vim.lsp.enable('jsonls')

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    vim.lsp.completion.enable(true, client.id, args.buf, {
      autotrigger = true
    })
	
	vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get, { desc = "Trigger LSP completion" })
	vim.keymap.set("i", "<C-S-Space>", vim.lsp.buf.signature_help, { desc = "Show parameter hints" })
	vim.keymap.set("n", "cd", vim.lsp.buf.rename, { desc = "Rename symbol" })
	vim.keymap.set("n", "g.", vim.lsp.buf.code_action, { desc = "Code action" })
  end,
})
