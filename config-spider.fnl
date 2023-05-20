(fn []
  (local spider (require "spider"))
  (vim.keymap.set [ "n" "o" "x" ] "b" (fn [] (spider.motion "b")))
  (vim.keymap.set [ "n" "o" "x" ] "e" (fn [] (spider.motion "e")))
  (vim.keymap.set [ "n" "o" "x" ] "w" (fn [] (spider.motion "w")))
)
