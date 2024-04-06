return {
    "RRethy/vim-illuminate",
    opts = {
        delay = 200,
        large_file_cutoff = 2000,
        large_file_overrides = {
            providers = { "lsp" },
        },
    },
    config = function(_, opts)
        require("illuminate").configure(opts)
        -- TODO Make this theme independent (default color really bad)
        vim.api.nvim_set_hl(0, 'IlluminatedWordWrite',
            { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("GruvboxBg1")), "fg#") })
        vim.api.nvim_set_hl(0, 'IlluminatedWordRead',
            { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("GruvboxBg1")), "fg#") })
    end,
}
