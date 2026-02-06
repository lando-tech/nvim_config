return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        automatic_installation = true,
        ensure_installed = {
          "lua_ls",
          "ts_ls",           -- TypeScript/JavaScript
          "tailwindcss",     -- Tailwind CSS
          "intelephense",    -- PHP/Laravel
          "html",
          "cssls",
        },
      })
    end,
  }
}
