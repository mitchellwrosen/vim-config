(local { "buf-map-fn" buf-map-fn "sys-format-buffer" sys-format-buffer } (require "fennel/nvim"))
(buf-map-fn [ "n" "v" ] " p" (lambda [] (sys-format-buffer "fnlfmt")) { "noremap" true "silent" true })
