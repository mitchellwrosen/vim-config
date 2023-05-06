(fn []
  (local notify (require "notify"))
  (notify.setup
    { :stages "static" ; don't animate, it looks janky
    }
  )
  (set vim.notify notify)
)
