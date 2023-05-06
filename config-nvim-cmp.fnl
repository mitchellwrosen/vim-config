(fn []
  (local cmp (require "cmp"))
  (cmp.setup
    { :mapping
        { "<CR>" (cmp.mapping.confirm { "select" false })
          "<Tab>" (cmp.mapping.select_next_item)
        }
      :sources
        (cmp.config.sources
          [ {:name "nvim_lsp"}
            {:name "buffer"}
          ]
        )
    }
  )
)
