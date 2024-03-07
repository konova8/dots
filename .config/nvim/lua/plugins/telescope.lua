return
{
    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        keys = {
            { '<leader>ff', function() require('telescope.builtin').find_files() end,                desc = '[ff] Find Files' },
            { '<leader>lg', function() require('telescope.builtin').live_grep() end,                 desc = '[lg] Find Grep' },
            { '<leader>gf', function() require('telescope.builtin').git_files() end,                 desc = '[gf] If in a git directory find git files' },
            { '<leader>/',  function() require('telescope.builtin').current_buffer_fuzzy_find() end, desc = '[/] Fuzzily search in current buffer' },
        },
    },

    -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        -- build = 'make',
        -- cond = function()
        --     return vim.fn.executable 'make' == 1
        -- end,
    },
    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    config = function()
        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                    },
                },
            },
        }
        -- Enable telescope fzf native, if installed
        pcall(require('telescope').load_extension, 'fzf')
    end,
    init = function()
        -- See `:help telescope.builtin`
    end
}
