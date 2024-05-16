return
{
    'nvim-telescope/telescope-symbols.nvim',
    keys = {
        { "<leader>ts", "<cmd>Telescope symbols<cr>", desc = "[T]elescope [S]ymbols" }
    },
    config = function()
        require('telescope')
    end,
}
