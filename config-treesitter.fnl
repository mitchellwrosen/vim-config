(fn []
  (local treesitter (require "nvim-treesitter.configs"))
  (treesitter.setup
    { :highlight { :enable true }
      :incremental_selection
        { :enable true
          :keymaps
            { :init_selection false
              :node_incremental "<Enter>"
              :scope_incremental false
              :node_decremental "<BS>"
            }
        }
      :playground { :enable true }
    }
  )
)
