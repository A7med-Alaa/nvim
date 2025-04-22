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
          "powershell_es",
          "glsl_analyzer",
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
      local navic = require("nvim-navic")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local bin_path = "C:/Users/hp/AppData/Local/nvim-data/mason/bin/"
      local on_attach = function(client, bufnr)
        if client.server_capabilities.documentSymbolProvider then
          navic.attach(client, bufnr)
        end
      end

      lspconf.pylsp.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "pylsp.cmd" },
      })
      lspconf.lua_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "lua-language-server.cmd" },
      })
      lspconf.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf.cmake.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "cmake-language-server.cmd" },
      })
      lspconf.tailwindcss.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "tailwindcss-language-server.cmd" },
      })
      lspconf.glsl_analyzer.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "glsl_analyzer.cmd" },
      })
      lspconf.prismals.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "prisma-language-server.cmd" },
      })
      lspconf.jsonls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "vscode-json-language-server.cmd" },
      })
      lspconf.html.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "vscode-html-language-server.cmd" },
      })
      lspconf.cssls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "vscode-css-language-server.cmd" },
      })
      lspconf.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "typescript-language-server.cmd", "--stdio" },
      })
      lspconf.jdtls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "jdtls.cmd" },
      })
      lspconf.powershell_es.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "powershell-editor-services.cmd" },
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
