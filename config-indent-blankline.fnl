(fn []
  (local plugin (require "indent_blankline"))
  (plugin.setup
    { :char_list [ "│" "┊" ]
      :indent_level 40
    }
  )
)
