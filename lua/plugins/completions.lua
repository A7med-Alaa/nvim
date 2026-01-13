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
		-- commit = "6c84bc75c64f778e9f1dcb798ed41c7fcb93b639",
		-- event = "BufEnter",
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
			-- require("vim-react-snippets").lazy_load()

			local config = require("vim-react-snippets.config")
			config.readonly_props = false

			cmp.setup({
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
					end,
				},
				mapping = cmp.mapping.preset.insert({
					-- ["<TAB>"] = cmp.mapping.select_next_item(cmp_select),
					-- ["<S-TAB>"] = cmp.mapping.select_prev_item(cmp_select),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
					-- ["<Down>"] = cmp.mapping(function(fallback)
					-- 	cmp.close()
					-- 	fallback()
					-- end, { "i" }),
					-- ["<Up>"] = cmp.mapping(function(fallback)
					-- 	cmp.close()
					-- 	fallback()
					-- end, { "i" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" }, -- For luasnip users.
					{ name = "supermaven" },
					{ name = "path" },
					{ name = "nvim_lua" },
					{ name = "buffer" },
				}),
			})
		end,
	},
}
