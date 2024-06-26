local wezterm = require('wezterm')
local colors = require('colors.custom')
local nf = wezterm.nerdfonts
local umath = require('utils.math')
local M = {}

local SEPARATOR_CHAR = nf.oct_dash .. ' '

local discharging_icons = {
   nf.md_battery_10,
   nf.md_battery_20,
   nf.md_battery_30,
   nf.md_battery_40,
   nf.md_battery_50,
   nf.md_battery_60,
   nf.md_battery_70,
   nf.md_battery_80,
   nf.md_battery_90,
   nf.md_battery,
}
local charging_icons = {
   nf.md_battery_charging_10,
   nf.md_battery_charging_20,
   nf.md_battery_charging_30,
   nf.md_battery_charging_40,
   nf.md_battery_charging_50,
   nf.md_battery_charging_60,
   nf.md_battery_charging_70,
   nf.md_battery_charging_80,
   nf.md_battery_charging_90,
   nf.md_battery_charging,
}

M.colors = {
   date_fg = "#9d7cd8",
   date_bg = '#181825',
   battery_fg = "#2ac3de",
   battery_bg = '#181825',
   separator_fg = '#74c7ec',
   separator_bg = '#181825',
   current_workspace_fg = '#9ece6a',
   current_workspace_bg = '#181825',
}

M.cells = {} -- wezterm FormatItems (ref: https://wezfurlong.org/wezterm/config/lua/wezterm/format.html)

---@param text string
---@param icon string
---@param fg string
---@param bg string
---@param separate boolean
M.push = function(text, icon, fg, bg, separate)
   table.insert(M.cells, { Foreground = { Color = fg } })
   table.insert(M.cells, { Background = { Color = bg } })
   table.insert(M.cells, { Attribute = { Intensity = 'Normal' } })
   table.insert(M.cells, { Text = icon .. ' ' .. text .. ' ' })

   if separate then
      table.insert(M.cells, { Foreground = { Color = M.colors.separator_fg } })
      table.insert(M.cells, { Background = { Color = M.colors.separator_bg } })
      table.insert(M.cells, { Text = SEPARATOR_CHAR })
   end

   table.insert(M.cells, 'ResetAttributes')
end

M.set_date = function()
   local date = wezterm.strftime('%m/%d/%Y, %H:%M:%S')
   M.push(date, nf.fa_calendar, M.colors.date_fg, M.colors.date_bg, false)
end

M.set_battery = function()
   -- ref: https://wezfurlong.org/wezterm/config/lua/wezterm/battery_info.html

   local charge = ''
   local icon = ''

   for _, b in ipairs(wezterm.battery_info()) do
      local idx = umath.clamp(umath.round(b.state_of_charge * 10), 1, 10)
      charge = string.format('%.0f%%', b.state_of_charge * 100)

      if b.state == 'Charging' then
         icon = charging_icons[idx]
      else
         icon = discharging_icons[idx]
      end
   end

   M.push(charge, icon, M.colors.battery_fg, M.colors.battery_bg, false)
end

M.set_current_workspace = function(window, _)
   M.push(window:active_workspace(), nf.cod_screen_full, M.colors.current_workspace_fg, M.colors.current_workspace_bg,
      false)
end

M.setup = function()
   wezterm.on('update-right-status', function(window, _pane)
      M.cells = {}
      M.set_date()
      M.set_battery()
      M.set_current_workspace(window, _pane)

      window:set_right_status(wezterm.format(M.cells))
   end)
end

return M
