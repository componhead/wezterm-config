local platform = require('utils.platform')()

local mod = {}

if platform.is_mac then
   mod.SUPER = 'SUPER'
   mod.SHIFT = 'SHIFT'
   mod.CTRL = 'CTRL'
   mod.ALT = 'ALT'
   mod.LEADER = 'LEADER'
   mod.SHIFTSUPER = 'SHIFT|SUPER'
   mod.CTRLSUPER = 'CTRL|SUPER'
elseif platform.is_win then
   mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
   mod.SUPER = 'ALT|CTRL'
end

return mod
