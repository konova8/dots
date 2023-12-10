return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true },
    opts = {
        options = {
            icons_enabled = true,
            theme = 'gruvbox',
            component_separators = '|',
            section_separators = '',
        },
    },
}
