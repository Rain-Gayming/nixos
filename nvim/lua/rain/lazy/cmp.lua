return {

    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-cmdline'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/nvim-cmp',
        config = function()
            local cmp = require('cmp')

            cmp.setup({
                snippet = {
                    expand = function(args)
                    end,
                },
                window = {  },
                mapping = cmp.mapping.preset.insert({
                    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                   ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                }),
                sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'luasnip' },
                }, 
                    {
                        { name = 'buffer' },
                    })
            })

            cmp.setup.cmdline({ '/', '?' }, {
                mapping = cmp.mapping.preset.cmdline(),
                sources = {
                    { name = 'buffer' }
                }
            })
            cmp.setup.cmdline(':', {
                mapping = cmp.mapping.preset.cmdline(),
                sources = cmp.config.sources({
                    { name = 'path' }
                }, {
                        { name = 'cmdline' }
                    }),
                matching = { disallow_symbol_nonprefix_matching = false }
            })

        end
    }
}
