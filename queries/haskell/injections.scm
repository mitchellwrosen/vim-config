((quasiquote (quoter)) @html (#lua-match? @html "html"))

((quasiquote_body) @sql (#lua-match? @sql "^%s*DELETE"))

((quasiquote_body) @sql (#lua-match? @sql "^%s*DROP"))

((quasiquote_body) @sql (#lua-match? @sql "^%s*INSERT"))

((quasiquote_body) @sql (#lua-match? @sql "^%s*SELECT"))

((quasiquote_body) @sql (#lua-match? @sql "^%s*UPDATE"))

((quasiquote_body) @sql (#lua-match? @sql "^%s*WITH"))
