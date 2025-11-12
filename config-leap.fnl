(import-macros { : create-autocmd } "nvim-stdlibm")

(fn []
  (local leap (require "leap"))
  (set leap.opts.equivalence_classes
    [ " \t\r\n"
      ; I think I want "." equivalent to any operator character, since it's convenient to type
      ; this does mean it's impossible to jump to the comma in the three-character sequence "," though, as an example
      ".`~!@#$%^&*()-_=+[{]}\\|;:'\",<>/?"
    ]
  )
  (set leap.opts.labels [ "j" "f" "k" "d" "l" "s" "a" "m" "c" "n" "v" "u" "r" "y" "t" "," "x" "i" "e" "." "z" "o" "w" "/" "p" "q" ])
  ; disable auto-jump, requiring three keypresses even for the closest match
  (set leap.opts.safe_labels [])
  (vim.keymap.set
    [ "n" ]
    "s"
    (fn []
      (leap.leap
        { :target_windows [ (vim.api.nvim_get_current_win) ]
        }
      )
    )
  )
  (vim.keymap.set
    [ "x" "o" ]
    "s"
    (fn []
      (leap.leap
        { :inclusive_op true
          :target_windows [ (vim.api.nvim_get_current_win) ]
        }
      )
    )
  )

  (create-autocmd
    "User"
    { :pattern "LeapEnter" }
    (fn []
      (set vim.g.mitchell-leaping true)
      (local lualine (require "lualine"))
      (lualine.refresh { :place [ "statusline" ] })
      nil
    )
  )

  (create-autocmd
    "User"
    { :pattern "LeapLeave" }
    (fn []
      (set vim.g.mitchell-leaping false)
      (local lualine (require "lualine"))
      (lualine.refresh { :place [ "statusline" ] })
      nil
    )
  )
)
