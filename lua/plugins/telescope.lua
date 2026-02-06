return {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
    config = function()
      require("telescope").setup({
        defaults = {
          previewer = true,
          file_ignore_patterns = {
            "^tmp/*",
            "^.git/",
            "^.cache/",
            "^target/",
            "^build/",
            "^dist/",
            "^bin/"
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
          }
        }
      })
      pcall(function() require("telescope").load_extension("fzf") end)
    end,
  }
