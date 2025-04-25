return {
	"SmiteshP/nvim-navic",
	dependencies = "neovim/nvim-lspconfig",
  lazy = true,
  event = "BufReadPost", -- loads when a file is opened
	config = function()
		local vscode_icons = {
			File = " ",
			Module = " ",
			Namespace = " ",
			Package = " ",
			Class = " ",
			Method = " ",
			Property = " ",
			Field = " ",
			Constructor = " ",
			Enum = " ",
			Interface = " ",
			Function = " ",
			Variable = " ",
			Constant = " ",
			String = " ",
			Number = " ",
			Boolean = " ",
			Array = " ",
			Object = " ",
			Key = " ",
			Null = " ",
			EnumMember = " ",
			Struct = " ",
			Event = " ",
			Operator = " ",
			TypeParameter = " ",
		}

		require("nvim-navic").setup({
			highlight = true, -- Enable highlighting
			separator = " > ", -- Customize separator
			depth_limit = 0, -- Limit breadcrumb depth
			-- icons = vscode_icons,
			icons = {
				File = "󰈙 ",
				Module = " ",
				Namespace = "󰌗 ",
				Package = " ",
				Class = " ",
				Method = "󰆧 ",
				Property = " ",
				Field = " ",
				Constructor = "󰊕 ",
				Enum = "󰕘",
				Interface = "󰕘",
				Function = "󰊕 ",
				Variable = "󰆧 ",
				Constant = "󰏿 ",
				String = "󰀬 ",
				Number = "󰎠 ",
				Boolean = "◩ ",
				Array = "󰅪 ",
				Object = "󰅩 ",
				Key = "󰌋 ",
				Null = "󰟢 ",
				EnumMember = " ",
				Struct = "󰌗 ",
				Event = " ",
				Operator = "󰆕 ",
				TypeParameter = "󰊄 ",
			},
		})

	end,
}
