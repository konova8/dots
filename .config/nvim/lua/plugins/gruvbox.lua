return
{
    -- Gruvbox theme
    'ellisonleao/gruvbox.nvim',
    priority = 1000,
    -- [[ Theme options ]]
    config = function()
        require("gruvbox").setup({
            contrast = "hard", -- can be "hard", "soft" or empty string
        })
        vim.cmd([[colorscheme gruvbox]])
    end
}
