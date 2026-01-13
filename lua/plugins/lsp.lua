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
          -- "pylsp",
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
      -- local lspconf = require("lspconfig")
      local lspconf = vim.lsp.config
      -- local navic = require("nvim-navic")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local bin_path = "C:/Users/hp/AppData/Local/nvim-data/mason/bin/"
      local on_attach = function(client, bufnr)
        -- if client.server_capabilities.documentSymbolProvider then
        --   navic.attach(client, bufnr)
        -- end
      end

      -- lspconf("pylsp", {
      --   on_attach = on_attach,
      --   capabilities = capabilities,
      --   cmd = { bin_path .. "pylsp.cmd" },
      -- })
      lspconf("lua_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "lua-language-server.cmd" },
      })
      lspconf("clangd", {
        on_attach = on_attach,
        capabilities = capabilities,
      })
      lspconf("jdtls", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "jdtls.cmd" },
      })
      lspconf("cmake", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "cmake-language-server.cmd" },
      })
      lspconf("powershell_es", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "powershell-editor-services.cmd" },
      })
      lspconf("glsl_analyzer", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "glsl_analyzer.cmd" },
      })
      lspconf("prismals", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "prisma-language-server.cmd" },
      })
      lspconf("jsonls", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "vscode-json-language-server.cmd" },
      })
      lspconf("html", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "vscode-html-language-server.cmd" },
      })
      lspconf("cssls", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "vscode-css-language-server.cmd" },
      })
      lspconf("ts_ls", {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { bin_path .. "typescript-language-server.cmd", "--stdio" },
      })
    end,
  },
}
