return {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
        require('dashboard').setup {
            hide = {
                statusline,
                tabline
            }, 
        }
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'}}
}
