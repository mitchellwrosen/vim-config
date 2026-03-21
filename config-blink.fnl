(fn []
  (local blink (require "blink.cmp"))
  (blink.setup
    {
      :keymap {
        "<Tab>" [
          (fn [cmp]
            (if (cmp.snippet_active) (cmp.accept) (cmp.select_and_accept))
          )
          "snippet_forward"
          "fallback"
        ]
      }
      :sources { :default [ "lsp" "path" "buffer" ] }
    }
  )
)
