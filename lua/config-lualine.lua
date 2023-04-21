local mode_code_to_name = {n = "normal", niI = "normal", niR = "normal", niV = "normal", nt = "normal", ntT = "normal", no = "operator", nv = "operator", noV = "operator", ["no\22"] = "operator", v = "visual", vs = "visual", V = "visual", Vs = "visual", ["\22"] = "visual", ["\22s"] = "visual", s = "select", S = "select", ["\19"] = "select", i = "insert", ic = "insert", ix = "insert", r = "replace", R = "replace", Rc = "replace", Rx = "replace", Rv = "replace", Rvc = "replace", Rvx = "replace", c = "command", cv = "ex", ce = "ex", rm = "more", ["r?"] = "confirm", ["!"] = "shell", t = "terminal"}
local config
local function _1_()
  local mode_code = vim.api.nvim_get_mode().mode
  return (mode_code_to_name[mode_code] or mode_code)
end
local function _2_(name, _buffer)
  if ("[No Name]" == name) then
    return ""
  else
    return name
  end
end
config = {component_separators = "", globalstatus = true, section_separators = "", sections = {lualine_a = {_1_}, lualine_b = {"branch"}, lualine_c = {{"filename", symbols = {unnamed = ""}}, "diagnostics", "searchcount"}, lualine_x = {"filetype"}, lualine_y = {"selectioncount"}, lualine_z = {"progress", "location"}}, refresh = {statusline = 30000, tabline = 30000, winbar = 30000}, tabline = {lualine_a = {{"buffers", filetype_names = {fzf = "fzf"}, fmt = _2_, show_filenames_only = true, symbols = {alternate_file = ""}, show_modified_status = false}}, lualine_b = {}, lualine_c = {}, lualine_x = {}, lualine_y = {}, lualine_z = {}}, icons_enabled = false}
local function _4_()
  return (require("lualine")).setup(config)
end
return _4_
