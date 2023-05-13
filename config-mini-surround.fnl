(fn []
  (local mini-surround (require "mini.surround"))
  (mini-surround.setup
    { :custom_surroundings nil
      :highlight_duration 300
      :mappings
        { :add "za"
          :delete "zd"
          :find ""
          :find_left ""
          :highlight ""
          :replace "zr"
          :update_n_lines ""
          :suffix_last ""
          :suffix_next ""
        }
      :n_lines 20
      :search_method "cover_or_next"
    }
  )
)
