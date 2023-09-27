local fn = vim.fn
local h = require("util.helper")

return {
    "Shougo/ddc.vim", 
    lazy = true, 
    event = "InsertEnter", 
    dependencies = {
        {"vim-denops/denops.vim"}, 
        -- UI
        {"Shougo/ddc-ui-native"}, 
        -- Source
        {"Shougo/ddc-source-around"},  
        {"Shougo/ddc-source-nvim-lsp"}, 
        {"LumaKernel/ddc-source-file"}, 
        -- Filter
        {"tani/ddc-fuzzy"},
    }, 
    config = function()
        local patch_global = fn["ddc#custom#patch_global"]

        patch_global("ui", "native")
        patch_global("sources", {
            "around", 
            "nvim-lsp", 
            "file", 
            "skkeleton", 
        })
        patch_global("sourceOptions",  {
            _ = {
                matchers = { "matcher_fuzzy" }, 
                sorters = { "sorter_fuzzy" }, 
                converters = { "converter_fuzzy" }, 
            }, 
            around = {
                mark = "[A]", 
            }, 
            ["nvim-lsp"] = {
                mark = "[LSP]", 
                forceCompletionPattern = [[\.\w*|:\w*|->\w*]], 
            }, 
            file = {
                mark = "[F]", 
                isVolatile = true, 
                forceCompletionPattern = [[\S/\S*]],
            }, 
            skkeleton = {
                mark = "[SKK]", 
                matchers = { "skkeleton" }, 
                sorters = {}, 
                converters = {}, 
                isVolatile = true, 
                minAutoCompleteLength = 2, 
            }, 
        })
        fn["ddc#enable"]()
    end
}
