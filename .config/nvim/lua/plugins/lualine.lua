return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    requires = { 'nvim-tree/nvim-web-devicons', opt = true },
    opts = {
        options = {
            icons_enabled = false,
            theme = 'gruvbox',
            component_separators = '|',
            section_separators = '',
        },
    },
}
