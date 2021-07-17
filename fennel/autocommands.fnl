(local { "autocmd" autocmd "event" event } (include "fennel/nvim"))

; (autocmd "mitchellwrosen" [event.bufEnter event.insertLeave] "*" (lambda [] (set vim.wo.relativenumber true)))
; (autocmd "mitchellwrosen" [event.bufLeave event.insertEnter] "*" (lambda [] (set vim.wo.relativenumber false)))
