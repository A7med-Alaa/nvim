return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    lazy = false,
    config = function()
      require("mason").setup()

      require("mason-lspconfig").setup({
        ensure_installed = {
          "pylsp",
          "lua_ls",
          "clangd",
          "jdtls",
          "cmake",
          "prismals",
          "jsonls",
          "html",
          "cssls",
          "ts_ls",
        },
        automatic_installation = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "nvim-lua/diagnostic-nvim",
    },
    config = function()
      local lspconf = require("lspconfig")
      -- local navic = require("nvim-navic")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local on_attach = function(client, bufnr)
        -- if client.server_capabilities.documentSymbolProvider then
        --   navic.attach(client, bufnr)
        -- end
      end

      lspconf.pylsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.cmake.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.glsl_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.prismals.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.jdtls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.powershell_es.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- vim.diagnostic.config({
      --   update_in_insert = true,
      --   float = {
      --     focusable = false,
      --     style = 'minimal',
      --     border = 'rounded',
      --     source = 'always',
      --     header = '',
      --     prefex = '',
      --   }
      -- })
    end,
  },
}
