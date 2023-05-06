(import-macros { : nmap } "nvim-stdlibm")

(fn []
  (local which-key (require "which-key"))

  (which-key.setup
    { :icons
        { :separator ""
        }
      :plugins
        { :marks true
          :presets
            { :g false
              :motions false
              :nav false
              :operators false
              :text_objects false
              :windows false
              :z false
            }
          :registers true
          :spelling { :enabled false }
        }
      :window
        { :border "single"
          :margin [ 0 0 0 0 ]
          :padding [ 0 0 0 0 ]
        }
    }
  )

  (which-key.register
    { :mode [ "n" "v" ]
      "<Space>l" { :name "+LSP" }
    }
  )

  ; this has to go *after* setup because which-key sucks ass and overwrites mappings
  ; setting "marks = false" doesn't work; it just disables the mark feature entirely
  (nmap "'" (fn [] (which-key.show "`" { :auto true :mode "n" })))
)
