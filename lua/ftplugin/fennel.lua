local _local_1_ = require("fennel/nvim")
local buf_map_fn = _local_1_["buf-map-fn"]
local sys_format_buffer = _local_1_["sys-format-buffer"]
local function _2_()
  return sys_format_buffer("fnlfmt")
end
return buf_map_fn({"n"}, " p", _2_, {noremap = true})
