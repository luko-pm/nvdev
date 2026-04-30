return{
    {
        "neovim/nvim-lspconfig",

        dependencies = {
            --    "folke/lazydev.nvim",
            {
                "mason-org/mason.nvim",
                config = function()
                    require("mason").setup()
                end
            },
            {
                "mason-org/mason-lspconfig.nvim",
                dependencies = {"mason-org/mason.nvim"},
                opts = {
                    ensure_installed = {"lua_ls","hls","clangd","pyright","jdtls", "arduino_language_server"},
                    automatic_enable = { exclude = {'jdtls'}}
                }
            },
            "onsails/lspkind.nvim",
            "hrsh7th/nvim-cmp",
            "hrsh7th/cmp-nvim-lsp",
            "L3MON4D3/LuaSnip",
            "j-hui/fidget.nvim",

            --"stevearc/conform.nvim",
            -- TODO: Mirar supermaven, es ia en plan copilot
        },

        config = function ()

            require("fidget").setup({})

            local cmp_lsp = require('cmp_nvim_lsp')
            local capabilities = cmp_lsp.default_capabilities()

            vim.keymap.set('n', 'gd', vim.lsp.buf.definition , {desc = "lsp go to definition"})

            -- Lista de lsp's que configurar con default_capabilities
            local lsp_servers = {'lua_ls', 'hyprls', 'haskell', 'pyright', 'clangd', 'arduino_language_server', 'jdtls'}

            for _, server in ipairs(lsp_servers) do
                vim.lsp.config(server, { capabilities = capabilities })
                vim.lsp.enable(server)
            end


        end
    },
    {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
            library = {
                -- See the configuration section for more details
                -- Load luvit types when the `vim.uv` word is found
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    },
}
