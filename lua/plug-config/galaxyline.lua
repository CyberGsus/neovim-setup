local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local function has_value(tbl, val)
  for i, v in ipairs(tbl) do
    if (v[1] == val) then
      return true
    end
  end
  return false
end
gl["short_line_list"] = {"NvimTree"}
local colors = {bg = "#282c34", blue = "#61afef", darkgrey = "#5c6370", fg = "#aab2bf", gray1 = "#5c6370", gray2 = "#2c323d", gray3 = "#3e4452", green = "#98c379", grey = "#848586", middlegrey = "#8791A", orange = "#e5c07b", purple = "#c678dd", red1 = "#e06c75", red2 = "#be5046", section_bg = "#38393f", yellow = "#e5c07b"}
return nil
