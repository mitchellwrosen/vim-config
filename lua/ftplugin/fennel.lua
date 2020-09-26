local _0_ = require("fennel/nvim")
local buf_map_fn = _0_["buf-map-fn"]
local sys_format_buffer = _0_["sys-format-buffer"]
local function _1_()
  return sys_format_buffer("fnlfmt")
end
return buf_map_fn({"n", "v"}, " p", _1_, {noremap = true, silent = true})
