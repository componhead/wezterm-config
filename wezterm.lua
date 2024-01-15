local cfg = require('config'):init()
local wezterm = require('wezterm')
local mux = wezterm.mux

local openAiApiKey
wezterm.on("gui-startup",
  function()
    local tab, pane, window = mux.spawn_window {}
    window:gui_window():toggle_fullscreen()
  end
)

require('utils.backdrops'):set_files():random()

require('events.right-status').setup()
require('events.tab-title').setup()
require('events.new-tab-button').setup()

return cfg
    :append({
      set_environment_variables = {
        OPENAI_API_KEY = ''
      }
    })
    :append(require('config.appearance'))
    :append(require('config.bindings'))
    :append(require('config.domains'))
    :append(require('config.fonts'))
    :append(require('config.general'))
    :append(require('config.launch')).options
