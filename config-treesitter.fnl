(fn []
  (local treesitter (require "nvim-treesitter.configs"))
  (treesitter.setup
    { :highlight { :enable true }
      :playground { :enable true }
    }
  )
)
