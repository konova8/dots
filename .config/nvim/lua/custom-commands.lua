-- Create a local command `:ToggleWrap` local
vim.api.nvim_create_user_command('ToggleWrap', function(_)
    if vim.o.wrap then
        vim.o.wrap = false
        vim.o.linebreak = false
    else
        vim.o.wrap = true
        vim.o.linebreak = true
    end
end, { desc = 'Toggle Wrap with nolinebreak' })
