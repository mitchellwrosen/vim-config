; mapping stolen from lualine source code, modified to have the string names I like
(local mode-code-to-name
  { :n "normal"
    :niI "normal"
    :niR "normal"
    :niV "normal"
    :nt "normal"
    :ntT "normal"

    :no "operator"
    :nv "operator"
    :noV "operator"
    "no\22" "operator"

    :v "visual"
    :vs "visual"
    :V "visual"
    :Vs "visual"
    "\22" "visual"
    "\22s" "visual"

    :s "select"
    :S "select"
    "\19" "select"

    :i "insert"
    :ic "insert"
    :ix "insert"

    :r "replace"
    :R "replace"
    :Rc "replace"
    :Rx "replace"
    :Rv "replace"
    :Rvc "replace"
    :Rvx "replace"

    :c "command"

    :cv "ex"
    :ce "ex"

    :rm "more"
    :r? "confirm"
    :! "shell"
    :t "terminal"
  }
)

(local config
  { :component_separators ""
    :icons_enabled false
    :globalstatus true
    :section_separators ""
    :sections
      { :lualine_a
          [ (fn []
              (local mode-code (. (vim.api.nvim_get_mode) "mode"))
              (or (. mode-code-to-name mode-code) mode-code)
            )
          ]
        :lualine_b [ "branch" ]
        :lualine_c
          [ { 1 "filename"
              :symbols { :unnamed "" }
            }
            "diagnostics"
            "searchcount"
          ]
        :lualine_x [ "filetype" ]
        :lualine_y [ "selectioncount" ]
        :lualine_z [ "progress" "location" ]
      }
    ; very awkward and inelegant that this plugin takes "refresh" timeouts. they default to 1000, but why
    ; would i want to see my statusline update some relevant info after an entire second?
    ; set this to 30s so I really feel the pain of not refreshing it when I should be (which is also
    ; awkward an inelegant)
    :refresh
      { :statusline 30000
        :tabline 30000
        :winbar 30000
      }
    :tabline
      { :lualine_a
            [ { 1 "buffers"
                :filetype_names
                  { :fzf "fzf"
                  }
                :fmt
                  ; don't like lualine's [No Name], so we hook in here and set it to the empty string
                  ; there are other awkward names lualine gives to various buffers does that we could override here
                  (fn [name _buffer]
                    (if (= "[No Name]" name) "" name)
                  )
                :show_filenames_only true
                :show_modified_status false
                :symbols { :alternate_file "" }
              }
            ]
        :lualine_b [ ]
        :lualine_c [ ]
        :lualine_x [ ]
        :lualine_y [ ]
        :lualine_z [ ]
      }
  }
)

(fn [] ((. (require "lualine") "setup") config))
