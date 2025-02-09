require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls" }
})

local lsp = require("lspconfig")
--lsp.lua_ls.setup{}
