return {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = {
      'nvim-lua/plenary.nvim',
      "nvim-telescope/telescope-fzf-native.nvim",
      buile="make"

    },
    opts = {
      defaults = {

        previewer = false,

        file_ignore_patterns = {
          "^tmp/*",
          "^.git/",
          "^.cache/",
          "^target/",
          "^build/",
          "^dist/",
          "^bin/"
        },

        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case"
          }
        }
      }
    },
  }
