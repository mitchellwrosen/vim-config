local utils = require('utils')

utils.buf_nnoremap_func(' p', function() utils.format_buffer("fnlfmt") end)
