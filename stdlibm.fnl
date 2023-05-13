;; fennel-ls: macro-file

; (drop n xs) drops n elements from xs
(fn drop [n xs]
  `(icollect [i# x# (ipairs ,xs)] (if (<= i# ,n) nil x#))
)

(fn string-join [strings separator]
  `(table.concat ,strings ,separator)
)


; (take n xs) takes n elements from xs
(fn take [n xs]
  `(icollect [i# x# (ipairs ,xs)] (if (<= i# ,n) x# nil))
)

; (wither xs [x] body) maps `(\x -> body)` over `xs`] (.. acc " " arg)))
(fn wither [xs [x] body ...]
  (assert (not= nil body) "wither body must not be nil")
  (assert (= nil ...) "wither body must be one expression")
  `(icollect [_# ,x (ipairs ,xs)] ,body)
)

{ : drop : string-join : take : wither }
