vim.diagnostic.config({
  virtual_text = true, -- ✅ 开启虚拟文本
  signs = true,        -- ✅ 开启左侧标志
  underline = true,    -- ✅ 开启下划线
  update_in_insert = false, -- 插入模式下是否更新
  severity_sort = true, -- 严重级别排序
})

require("mason").setup({
  ui = {
      icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
      }
  }
})

require("mason-lspconfig").setup({
  -- 确保安装，根据需要填写
  ensure_installed = {
    "lua_ls",
    "clangd",
    "bashls",
    "jdtls",
    "pyright",
    "ltex",
    "rust_analyzer"
  },
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

-- require("lspconfig").lua_ls.setup {
--   capabilities = capabilities,
-- }
-- require("lspconfig").clangd.setup {
--   capabilities = capabilities,
-- }
-- require("lspconfig").bashls.setup {
--   capabilities = capabilities,
-- }
-- require("lspconfig").jdtls.setup {
--   capabilities = capabilities,
-- }
-- require("lspconfig").pyright.setup {
--   capabilities = capabilities,
-- }
-- require("lspconfig").ltex.setup {
--   capabilities = capabilities,
-- }
-- require("lspconfig").rust_analyzer.setup {
--   capabilities = capabilities,
-- }
