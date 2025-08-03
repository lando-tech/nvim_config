return {
    "romgrk/barbar.nvim",
    dependencies = {
      "lewis6991/gitsigns.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      animation = true,
      clickable = true,
      auto_hide = false,
      gitsigns = {
        added = {enabled = true, icon = '+'},
        changed = {enabled = true, icon = '~'},
        deleted = {enabled = true, icon = '-'},
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
      separator = {left = ' ', right = ''},
      maximum_padding = 1,
      maximum_length = 30,
      sidebar_filetypes = {
        NvimTree = true,
      },
    },
  }
