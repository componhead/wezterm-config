local wezterm = require('wezterm')

return {
   -- behaviours
   automatically_reload_config = true,
   exit_behavior = 'CloseOnCleanExit', -- if the shell program exited with a successful status
   status_update_interval = 1000,

   command_palette_font_size = 18.0,

   scrollback_lines = 100000,

   -- hyperlink rules
   hyperlink_rules = table.insert(wezterm.default_hyperlink_rules(), {
      {
         -- Matches: a filename
         regex = ' ?(\\/?[\\w]*\\/[\\w]*)+\\s?',
         format = '$1',
         highlight = 1,
      },
   }),

   inactive_pane_hsb = {
      hue = 0.5,
      saturation = 0.5,
      brightness = 0.6,
   },
}
