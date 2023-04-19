; (drop n xs) drops n elements from xs
(fn drop [n xs]
  `(icollect [i# x# (ipairs ,xs)] (if (<= i# ,n) nil x#))
)

; (take n xs) takes n elements from xs
(fn take [n xs]
  `(icollect [i# x# (ipairs ,xs)] (if (<= i# ,n) x# nil))
)

; (wither f xs) applies f to each element in xs
(fn wither [f xs]
  `(icollect [_# x# (ipairs ,xs)] (,f x#))
)

{ : drop : take : wither }
