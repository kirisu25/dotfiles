local fn = vim.fn
local h = require("util.helper")

return{
    "vim-skk/skkeleton", 
    lazy = false, 
    dependencies = { "vim-denops/denops.vim" }, 
    init = function()
        -- keymap
        h.imap("<C-j>", "<Plug>(skkeleton-toggle)")
        h.cmap("<C-j>", "<Plug>(skkeleton-toggle)")

        -- search dictionaries
        local dict = {}
        local handle = io.popen("ls $HOME/.skk/*")
        if handle then
            for file in handle:lines() do
                table.insert(dict, file)
            end
            handle:close()
        end

        vim.api.nvim_create_autocmd("User", {
            pattern = "skkeleton-initialize-pre", 
            callback = function()
                fn["skkeleton#config"]({
                    eggLikeNewline = true, 
                    registerConvertResult = true, 
                    globalDictionaries = dict, 
                })
            end, 
        })
    end
} 
