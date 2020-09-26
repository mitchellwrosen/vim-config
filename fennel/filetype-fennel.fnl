(local { "buf-map-fn" buf-map-fn "sys-format-buffer" sys-format-buffer } (require "fennel/nvim"))
(buf-map-fn [ "n" ] " p" (lambda [] (sys-format-buffer "fnlfmt")) { "noremap" true })

; (let
;   [popup (require "popup")]
;   (buf-map-fn [ "n" ] " g" 
;     (lambda []
;       (popup.create 
;         ["hi"] 
;         {""}))
;     {}))
