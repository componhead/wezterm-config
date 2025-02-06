local cfg = require('config'):init()
local wezterm = require('wezterm')
local mux = wezterm.mux
local session_manager = require('wezterm-session-manager/session-manager')

wezterm.on('gui-startup', function()
   local tab, pane, window = mux.spawn_window({})
   window:gui_window():toggle_fullscreen()
end)

wezterm.on('user-var-changed', function(window, pane, name, value)
   local overrides = window:get_config_overrides() or {}
   if name == 'ZEN_MODE' then
      local incremental = value:find('+')
      local number_value = tonumber(value)
      if incremental ~= nil then
         while number_value > 0 do
            window:perform_action(wezterm.action.IncreaseFontSize, pane)
            number_value = number_value - 1
         end
         overrides.enable_tab_bar = false
      elseif number_value < 0 then
         window:perform_action(wezterm.action.ResetFontSize, pane)
         overrides.font_size = nil
         overrides.enable_tab_bar = true
      else
         overrides.font_size = number_value
         overrides.enable_tab_bar = false
      end
   end
   window:set_config_overrides(overrides)
end)

wezterm.on('save_session', function(window)
   session_manager.save_state(window)
end)
wezterm.on('load_session', function(window)
   session_manager.load_state(window)
end)
wezterm.on('restore_session', function(window)
   session_manager.restore_state(window)
end)

require('utils.backdrops'):set_files():random()
require('events.right-status').setup()
require('events.tab-title').setup()
require('events.new-tab-button').setup()

local base_configuration = cfg:append(require('config.appearance'))
   :append(require('config.bindings'))
   :append(require('config.domains'))
   :append(require('config.fonts'))
   :append(require('config.general'))
   :append(require('config.launch')).options

return base_configuration
