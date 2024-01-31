local h = require("util.helper")

return {
	"vim-skk/skkeleton",
	lazy = true,
	event = "VimEnter",
	config = function()
		h.imap("<C-j>", "<Plug>(skkeleton-toggle)")
		h.cmap("<C-j>", "<Plug>(skkeleton-toggle)")

		-- find dict
		local dictionaries = {}
		local handle = io.popen("ls $HOME/.config/skk/*")
		if handle then
			for file in handle:lines() do
				table.insert(dictionaries, file)
			end
			handle:close()
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "skkeleton-initialize-pre",
			callback = function()
				vim.fn["skkeleton#config"]({
					eggLikeNewline = true,
					registerConvertResult = true,
					globalDictionaries = dictionaries,
				})
			end,
		})
	end,
}
