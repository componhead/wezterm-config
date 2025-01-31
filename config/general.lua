local wezterm = require('wezterm')

return {
   window_close_confirmation = 'AlwaysPrompt',
   automatically_reload_config = true,
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
}
