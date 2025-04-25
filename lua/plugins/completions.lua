return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
    lazy = true,
		event = "BufEnter",
		dependencies = {
			"hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lua",
			"mlaursen/vim-react-snippets",
		},
		config = function()
			local cmp = require("cmp")
			local cmp_select = { behavior = cmp.SelectBehavior.Select }
			require("luasnip.loaders.from_vscode").lazy_load()
			require("vim-react-snippets").lazy_load()

			local config = require("vim-react-snippets.config")
			config.readonly_props = false

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<tab>"] = cmp.mapping.select_next_item(cmp_select),
					["<S-tab>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-Space>"] = cmp.mapping.complete(),
					["<Down>"] = cmp.mapping(function(fallback)
						cmp.close()
						fallback()
					end, { "i" }),
					["<Up>"] = cmp.mapping(function(fallback)
						cmp.close()
						fallback()
					end, { "i" }),
					["<CR>"] = cmp.mapping.confirm({ select = false }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "nvim_lua" },
					{ name = "buffer" },
				}),
			})
		end,
	},
}
