return
{
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
        -- Automatically install LSPs to stdpath for neovim
        { 'williamboman/mason.nvim', config = true },
        'williamboman/mason-lspconfig.nvim',

        -- Useful status updates for LSP
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        { 'folke/neodev.nvim',       config = true },
    },
    config = function()
        -- [[ Configure LSP ]]
        -- TODO capire se servono davvero tutte queste shortcut
        --	This function gets run when an LSP connects to a particular buffer.
        local on_attach = function(_, bufnr)
            -- NOTE: Remember that lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself
            -- many times.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local nmap = function(keys, func, desc)
                if desc then
                    desc = 'LSP: ' .. desc
                end

                vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
            end

            nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
            nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

            nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
            nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
            nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
            nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
            nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
            nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

            -- See `:help K` for why this keymap
            nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
            nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

            -- Lesser used LSP functionality
            nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
            nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
            nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
            nmap('<leader>wl', function()
                print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
            end, '[W]orkspace [L]ist Folders')

            -- Create a command `:Format` local to the LSP buffer
            vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
                vim.lsp.buf.format()
            end, { desc = 'Format current buffer with LSP' })
        end

        -- [[ Configure Mason ]]
        -- Enable the following language servers
        -- Add any additional override configuration in the following tables
        -- They will be passed to the `settings` field of the server config

        -- [[ Word list for ltex-ls ]]
        local words = {
            'Saverio',
            'Giallorenzo',
            'Jacopo',
            'Kubernetes',
            'OrTools',
            'Z3',
            'incrementality',
            'Satisfiability',
            'MiniZinc',
            'cpu',
            'sub-optimal',
            'Micro services',
            'Micro',
            'services',
            'de-facto',
            'Jolie',
            'HyperVisor',
            'Matita',
            'ssd-disk',
            'schedulable',
            'kubelet',
            'kube-proxy',
            'kube-scheduler',
            'Autoscalability',
            'EAs',
            'PreEnqueue',
            'EnqueueExtension',
            'QueueingHint',
            'QueueSort',
            'PreFilter',
            'PostFilter',
            'PreScore',
            'NormalizeScore',
            'PreBind',
            'PostBind',
            'schedulerName',
            'MostAllocated',
            'RequestedToCapacityRatio',
            'NodeResourcesFit',
            'Unschedulable',
            'Unreserve',
            'Schedulable',
        }

        -- [[ Servers to install by default ]]
        local servers = {
            bashls = {},
            clangd = {},
            gopls = {},
            html = {},
            ltex = {
                ltex = {
                    dictionary = {
                        ['en-US'] = words, }
                },
            },
            lua_ls = {
                Lua = {
                    workspace = {
                        checkThirdParty = false },
                    telemetry = { enable = false },
                },
            },
            pyright = {},
            texlab = {},
            ts_ls = {},
        }

        local mason_lspconfig = require 'mason-lspconfig'

        -- Ensure the servers above are installed
        mason_lspconfig.setup {
            ensure_installed = vim.tbl_keys(servers),
        }
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
        mason_lspconfig.setup {
            function(server_name)
                require('lspconfig')[server_name].setup {
                    capabilities = capabilities,
                    on_attach = on_attach,
                    settings = servers[server_name],
                }
            end,
        }
    end,
}
