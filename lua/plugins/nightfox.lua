return {
    "EdenEast/nightfox.nvim",
    priority = 1000,
    config = function()
      require("nightfox").setup({
        options = {
          transparent = false,
          dim_inactive = true,
          styles = {
            keywords = "bold",
            functions = "bold",
          },
        },
      })
    end,
  }
