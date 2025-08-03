return {
    "nvim-lualine/lualine.nvim",
    config = function()
      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          -- component_separators = { left = '', right = '' },
          -- section_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          component_separators = { left = '⟡', right = '⟡'},
          always_divide_middle = true,
          globalstatus = false,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { {'mode', icon = ''} },
          lualine_b = { {'branch', icon = ''}, 'diff' },
          -- lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {
              {'diagnostics', symbols = {
                  error = ' ', warn = ' ', info = ' ' } },
              },
          lualine_z = { {'location', icon = '󰞷'} },
        },
        -- inactive_sections = {
        --   lualine_c = {'filename'}
        -- },
      }
    end
  }
