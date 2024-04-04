local cfg = require('config'):init()
local wezterm = require('wezterm')
local mux = wezterm.mux

wezterm.on('gui-startup', function()
   local tab, pane, window = mux.spawn_window({})
   window:gui_window():toggle_fullscreen()
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
