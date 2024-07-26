local wezterm = require('wezterm')
local colors = require('colors.custom')

return {
   hide_mouse_cursor_when_typing = true,
   animation_fps = 60,
   max_fps = 60,
   front_end = 'WebGpu',
   webgpu_power_preference = 'HighPerformance',
   enable_tab_bar = false,

   -- color scheme
   colors = colors,

   -- background
   background = {
      {
         source = { File = wezterm.GLOBAL.background },
      },
      {
         source = { Color = colors.background },
         height = '100%',
         width = '100%',
         opacity = 0.99,
      },
   },

   -- scrollbar
   enable_scroll_bar = true,

   -- -- tab bar
   use_fancy_tab_bar = false,
   tab_max_width = 50,
   switch_to_last_active_tab_when_closing_tab = true,

   -- window
   window_padding = {
      left = 5,
      right = 10,
      top = 12,
      bottom = 7,
   },
   window_close_confirmation = 'NeverPrompt',
   window_frame = {
      active_titlebar_bg = '#090909',
      -- font = fonts.font,
      -- font_size = fonts.font_size,
   },
   inactive_pane_hsb = { hue = 0.6, saturation = 0.4, brightness = 0.2 },
}
