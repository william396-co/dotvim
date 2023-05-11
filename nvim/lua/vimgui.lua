
local vimgui = {}

function vimgui.load()
    return {
        -- dashboard
        {
            'nvimdev/dashboard-nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' },
            opts = {
                theme = 'hyper',
                disable_move = true,
                config = {
                    week_header = { enable = true },
                    project = { enable = false },
                },
            },
        },

        -- which-key
        {
            'folke/which-key.nvim', 
            opts = {

            },
        },

        -- rainbow
        {
            'luochen1990/rainbow',
            init = function()
                vim.cmd([[
                    syntax on
                    let g:rainbow_active = 1
                    let g:rainbow_conf = { 'ctermfgs': ['darkblue', 'darkyellow', 'darkcyan', 'darkmagenta'] }
                ]])
            end
        },

        -- nvim-neo-tree
        {
            'nvim-neo-tree/neo-tree.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons', 'nvim-lua/plenary.nvim', 'MunifTanjim/nui.nvim' },
            init = function()
                vim.g.neo_tree_remove_legacy_commands = 1
            end,
            opts = {
                close_if_last_window = false,
                popup_border_style = "rounded",
                enable_git_status = true,
                enable_diagnostics = true,
                open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
                sort_case_insensitive = false,
            },
            keys = {
                { "<leader>ft", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
            },
        },

        -- bufferline
        {
            'akinsho/bufferline.nvim',
            dependencies = 'nvim-tree/nvim-web-devicons',
            config = function()
                local plugin = require( 'bufferline' )
                plugin.setup( {
                    options = {
                        style_preset = plugin.style_preset.no_italic,
                        numbers = true,
                        offsets = {
                            { filetype = 'neo-tree', text = 'File Explorer', highlight = 'Directory', text_align = 'center' },
                        },
                        custom_filter = function(buf, buf_numbers)
                            local buf_type = vim.bo[buf].filetype
                            if buf_type == 'gitcommit' or buf_type == 'help' then
                                return false 
                            end
                            return true 
                        end
                    },
                } )
            end,
        },

        -- statusline
        {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons', opt=true },
            opts = {
                options = {
                    theme = 'nightfox',
                    disabled_filetypes = { statusline = { 'gitcommit' }, winbar = {} },
                },
                setions = {
                    lualine_a = {
                        'diff',
                        colored = true,
                        diff_color = {
                            added    = 'DiffAdd',
                            modified = 'DiffChange',
                            removed  = 'DiffDelete',
                        },
                        source = nil,
                        symbols = {added = '+', modified = '~', removed = '-'},
                    },
                },
            },
        },
    }
end

return vimgui
