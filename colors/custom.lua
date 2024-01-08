-- A slightly altered version of catppucchin mocha
local mochaTokio = {
   -- mocha
   rosewaterMocha = '#f5e0dc',
   flamingoMocha = '#f2cdcd',
   pinkMocha = '#f5c2e7',
   mauveMocha = '#cba6f7',
   redMocha = '#f38ba8',
   maroonMocha = '#eba0ac',
   peachMocha = '#fab387',
   yellowMocha = '#f9e2af',
   greenMocha = '#a6e3a1',
   tealMocha = '#94e2d5',
   skyMocha = '#89dceb',
   sapphireMocha = '#74c7ec',
   blueMocha = '#89b4fa',
   lavenderMocha = '#b4befe',
   textMocha = '#cdd6f4',
   subtext1Mocha = '#bac2de',
   subtext0Mocha = '#a6adc8',
   overlay2Mocha = '#9399b2',
   overlay1Mocha = '#7f849c',
   overlay0Mocha = '#6c7086',
   surface2Mocha = '#585b70',
   surface1Mocha = '#45475a',
   surface0Mocha = '#313244',
   baseMocha = '#1f1f28',
   mantleMocha = '#181825',
   crustMocha = '#11111b',

   -- tokio
   bg_darkTokio = "#1f2335",
   bgTokio = "#24283b",
   bg_highlightTokio = "#292e42",
   terminal_blackTokio = "#414868",
   fgTokio = "#c0caf5",
   fg_darkTokio = "#a9b1d6",
   fg_gutterTokio = "#3b4261",
   dark3Tokio = "#545c7e",
   commentTokio = "#565f89",
   dark5Tokio = "#737aa2",
   blue0Tokio = "#3d59a1",
   blueTokio = "#7aa2f7",
   cyanTokio = "#7dcfff",
   blue1Tokio = "#2ac3de",
   blue2Tokio = "#0db9d7",
   blue5Tokio = "#89ddff",
   blue6Tokio = "#b4f9f8",
   blue7Tokio = "#394b70",
   magentaTokio = "#bb9af7",
   magenta2Tokio = "#ff007c",
   purpleTokio = "#9d7cd8",
   orangeTokio = "#ff9e64",
   yellowTokio = "#e0af68",
   greenTokio = "#9ece6a",
   green1Tokio = "#73daca",
   green2Tokio = "#41a6b5",
   tealTokio = "#1abc9c",
   redTokio = "#f7768e",
   red1Tokio = "#db4b4b"
}

local colorscheme = {
   foreground = mochaTokio.dark5Tokio,
   background = mochaTokio.bgTokio,
   cursor_bg = mochaTokio.blue6Tokio,
   cursor_border = mochaTokio.rosewaterMocha,
   cursor_fg = mochaTokio.crustMocha,
   selection_bg = mochaTokio.blue0Tokio,
   selection_fg = mochaTokio.textMocha,
   ansi = {
      '#0C0C0C', -- black
      '#C50F1F', -- red
      '#13A10E', -- green
      '#C19C00', -- yellow
      '#0037DA', -- blue
      '#881798', -- magenta/purple
      '#3A96DD', -- cyan
      '#CCCCCC', -- white
   },
   brights = {
      '#767676', -- black
      '#E74856', -- red
      '#16C60C', -- green
      '#F9F1A5', -- yellow
      '#3B78FF', -- blue
      '#B4009E', -- magenta/purple
      '#61D6D6', -- cyan
      '#F2F2F2', -- white
   },
   tab_bar = {
      background = '#000000',
      active_tab = {
         bg_color = mochaTokio.surface2Mocha,
         fg_color = mochaTokio.textMocha,
      },
      inactive_tab = {
         bg_color = mochaTokio.surface0Mocha,
         fg_color = mochaTokio.subtext1Mocha,
      },
      inactive_tab_hover = {
         bg_color = mochaTokio.surface0Mocha,
         fg_color = mochaTokio.textMocha,
      },
      new_tab = {
         bg_color = mochaTokio.baseMocha,
         fg_color = mochaTokio.textMocha,
      },
      new_tab_hover = {
         bg_color = mochaTokio.mantleMocha,
         fg_color = mochaTokio.textMocha,
         italic = true,
      },
   },
   visual_bell = mochaTokio.surface0Mocha,
   indexed = {
      [16] = mochaTokio.peachMocha,
      [17] = mochaTokio.rosewaterMocha,
   },
   scrollbar_thumb = mochaTokio.surface2Mocha,
   split = mochaTokio.overlay0Mocha,
   compose_cursor = mochaTokio.flamingoMocha,
}


return colorscheme
