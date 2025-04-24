-- local function lsp_progress()
-- 	local messages = vim.lsp.status()
-- 	if #messages == 0 then
-- 		return ""
-- 	end
-- 	local status = {}
-- 	for _, msg in pairs(messages) do
-- 		table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
-- 	end
-- 	local spinners = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" }
-- 	local ms = vim.loop.hrtime() / 1000000
-- 	local frame = math.floor(ms / 120) % #spinners
-- 	return table.concat(status, " | ") .. " " .. spinners[frame + 1]
-- end

return {
	"nvim-lualine/lualine.nvim",
	-- dependencies = { "nvim-tree/nvim-web-devicons" },
	dependencies = { "echasnovski/mini.icons", "SmiteshP/nvim-navic"},
	config = function()
		local mytheme = require("lualine.themes.codedark")
		-- mytheme.normal.c.bg = '#000000'
		-- mytheme.normal.b.fg = '#828697'
		-- mytheme.normal.a.bg = '#828697'
		-- mytheme.insert.c.bg = '#000000'
		--
		-- mytheme.insert.a.bg = '#608b4e'
		-- mytheme.insert.b.fg = '#608b4e'

		mytheme.normal.a.bg = "#828697"
		mytheme.normal.b.fg = "#828697"
		mytheme.normal.c.bg = nil
		-- mytheme.insert.a.bg = "#779f94"
		-- mytheme.insert.b.fg = "#779f94"
		mytheme.insert.a.bg = "#608b4e"
		mytheme.insert.b.fg = "#608b4e"
		mytheme.insert.c.bg = nil
		mytheme.visual.a.bg = "#f28534"
		mytheme.visual.b.fg = "#f28534"

    -- local btest = function()
    --   if require('lspsaga.symbol.winbar').get_bar() == nil then
    --     return ''
    --   else
    --     return require('lspsaga.symbol.winbar').get_bar()
    --   end
    -- end
    local navic = function() return require("nvim-navic").get_location() end
		require("lualine").setup({
			options = {
				icons_enabled = true,
				component_separators = '|',
				section_separators = '',
				theme = mytheme,
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff", "diagnostics" },
				lualine_c = { "filename", navic },
				-- lualine_x = { "encoding", "fileformat", "filetype" },
				-- lualine_x = {
				-- 	lsp_progress,
				-- 	{
				-- 		function()
				-- 			local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
				-- 			-- local icon = require("nvim-web-devicons").get_icon_by_filetype(
				-- 			-- 	vim.api.nvim_buf_get_option(0, "filetype")
				-- 			-- )
				-- 			if lsps and #lsps > 0 then
				-- 				local names = {}
				-- 				for _, lsp in ipairs(lsps) do
				-- 					table.insert(names, lsp.name)
				-- 				end
				-- 				-- return string.format("%s %s", table.concat(names, ", "), icon)
				-- 				return string.format("%s", table.concat(names, ", "))
				-- 			else
				-- 				return ""
				-- 			end
				-- 		end,
				-- 		color = function()
				-- 			return { fg = "#b09c84" }
				-- 		end,
				-- 	},
				--       -- "prgress",
				-- },
				lualine_x = {},
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
			-- sections = {
			-- 	lualine_a = { "mode" },
			-- 	lualine_b = { "branch", { "diagnostics", update_in_insert = true } },
			-- 	lualine_c = {
			-- 		{
			-- 			"filename",
			-- 			file_status = false,
			-- 			path = 1,
			-- 		},
			-- 	},
			-- 	lualine_x = {
			-- 		lsp_progress,
			-- 		{
			-- 			function()
			-- 				local lsps = vim.lsp.get_active_clients({ bufnr = vim.fn.bufnr() })
			-- 				-- local icon = require("nvim-web-devicons").get_icon_by_filetype(
			-- 				-- 	vim.api.nvim_buf_get_option(0, "filetype")
			-- 				-- )
			-- 				if lsps and #lsps > 0 then
			-- 					local names = {}
			-- 					for _, lsp in ipairs(lsps) do
			-- 						table.insert(names, lsp.name)
			-- 					end
			-- 					-- return string.format("%s %s", table.concat(names, ", "), icon)
			-- 					return string.format("%s", table.concat(names, ", "))
			-- 				else
			-- 					return ""
			-- 				end
			-- 			end,
			-- 			color = function()
			-- 				return { fg = "#b09c84" }
			-- 			end,
			-- 		},
			--        -- "prgress",
			--        "location"
			-- 	},
			-- 	lualine_y = { "" },
			-- 		  -- {
			-- 			-- function()
			-- 			-- 	local wc = vim.fn.wordcount()
			-- 			-- 	if wc["visual_words"] then -- text is selected in visual mode
			-- 			-- 		return wc["visual_words"] .. " Words/" .. wc["visual_chars"] .. " Chars (Vis)"
			-- 			-- 	else -- all of the document
			-- 			-- 		return wc["words"] .. " Words"
			-- 			-- 	end
			-- 			-- end} ,"progress"},
			-- 	lualine_z = { "" },
			-- },
		})
	end,
}
