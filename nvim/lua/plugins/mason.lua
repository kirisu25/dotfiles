return {
    'williamboman/mason.nvim',
    lazy = true,
    cmd = {
        "Mason",
        "MasonInstall",
        "MasonUninstall",
        "MasonUninstallAll",
        "MasonLog",
        "MasonUpdate",
        "MasonUpdateAll",
    },
    build = ":MasonUpdate",
}
