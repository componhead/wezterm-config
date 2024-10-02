local wezterm = require('wezterm')
local platform = require('utils.platform')()
local backdrops = require('utils.backdrops')
local act = wezterm.action

local mod = {}

if platform.is_mac then
   mod.SUPER = 'SUPER'
   mod.SHIFT = 'SHIFT'
   mod.CTRL = 'CTRL'
   mod.ALT = 'ALT'
   mod.LEADER = 'LEADER'
   mod.CTRLSUPER = 'CTRL|SUPER'
elseif platform.is_win then
   mod.SUPER = 'ALT' -- to not conflict with Windows key shortcuts
   mod.SUPER = 'ALT|CTRL'
end

local keys = {
   { key = 'Escape', mods = mod.LEADER, action = 'PopKeyTable' },
   {
      key = 'F1',
      mods = mod.LEADER,
      action = act.ShowLauncherArgs({ flags = 'LAUNCH_MENU_ITEMS' }),
   },
   { key = 'F2', mods = mod.LEADER, action = act.ActivateCommandPalette },
   { key = 'F3', mods = mod.LEADER, action = act.ShowLauncherArgs({ flags = 'FUZZY|TABS' }) },
   { key = 'F4', mods = mod.LEADER, action = act.ShowLauncherArgs({ flags = 'FUZZY|WORKSPACES' }) },
   -- Prompt for a name to use for a new workspace and switch to it.
   {
      key = 'F5',
      mods = mod.LEADER,
      action = act.PromptInputLine({
         description = wezterm.format({
            { Attribute = { Intensity = 'Bold' } },
            { Foreground = { AnsiColor = 'Fuchsia' } },
            { Text = 'Enter name for new workspace' },
         }),
         action = wezterm.action_callback(function(window, pane, line)
            -- line will be `nil` if they hit escape without entering anything
            -- An empty string if they just hit enter
            -- Or the actual line of text they wrote
            if line then
               window:perform_action(
                  act.SwitchToWorkspace({
                     name = line,
                  }),
                  pane
               )
            end
         end),
      }),
   },

   {
      key = 'a',
      mods = mod.LEADER,
      action = act.SpawnTab('CurrentPaneDomain'),
      -- background = {
      --    source = backdrops.random(),
      -- },
   },
   {
      key = 'r',
      mods = mod.LEADER,
      action = act.PromptInputLine({
         description = 'Enter new name for tab',
         action = wezterm.action_callback(function(window, pane, line)
            local tab, pane, window = window:spawn_tab({ args = { 'top' } }).await()
            -- line will be `nil` if they hit escape without entering anything
            -- An empty string if they just hit enter
            -- Or the actual line of text they wrote
            -- if line then
            --    window:active_tab():set_title(line)
            -- end
         end),
      }),
   },

   -- wez bug?
   { key = 'v', mods = mod.LEADER, action = act.SplitHorizontal },
   -- wez bug?
   { key = 'h', mods = mod.LEADER, action = act.SplitVertical },
   { key = 'f', mods = mod.SUPER, action = act.Search({ CaseInSensitiveString = '' }) },
   { key = 'f', mods = mod.CTRLSUPER, action = act.ToggleFullScreen },

   -- copy/paste --
   { key = 'c', mods = mod.SUPER, action = act.CopyTo('Clipboard') },
   { key = 'v', mods = mod.SUPER, action = act.PasteFrom('Clipboard') },

   -- tabs: navigation
   { key = 'T', mods = mod.LEADER, action = act.ActivateTabRelative(0) },
   { key = 't', mods = mod.LEADER, action = act.ActivateTabRelative(1) },
   { key = '{', mods = mod.LEADER, action = act.MoveTabRelative(-1) },
   { key = '}', mods = mod.LEADER, action = act.MoveTabRelative(1) },

   { key = 'w', mods = mod.SUPER, action = act.CloseCurrentTab({ confirm = false }) },

   -- window --
   -- spawn windows
   { key = 'n', mods = mod.LEADER, action = act.SpawnWindow },

   -- {
   --    key = [[/]],
   --    mods = mod.SUPER,
   --    action = wezterm.action_callback(function(window, _pane)
   --       backdrops:random(window)
   --    end),
   -- },
   {
      key = 'H',
      mods = mod.LEADER,
      action = wezterm.action.QuickSelectArgs({
         label = 'select sha',
         patterns = {
            ' [0-9a-f]{7,40} ',
         },
      }),
   },
   {
      key = 'U',
      mods = mod.LEADER,
      action = wezterm.action.QuickSelectArgs({
         label = 'open url',
         patterns = {
            'https?://\\S+',
         },
         action = wezterm.action_callback(function(window, pane)
            local url = window:get_selection_text_for_pane(pane)
            wezterm.log_info('opening: ' .. url)
            wezterm.open_with(url)
         end),
      }),
   },
   -- panes: zoom+close pane
   { key = 'z', mods = mod.LEADER, action = act.TogglePaneZoomState },
   { key = 'w', mods = mod.SUPER, action = act.CloseCurrentTab({ confirm = true }) },

   -- panes: navigation
   { key = 'k', mods = mod.SUPER, action = act.ActivatePaneDirection('Up') },
   { key = 'j', mods = mod.SUPER, action = act.ActivatePaneDirection('Down') },
   { key = 'h', mods = mod.SUPER, action = act.ActivatePaneDirection('Left') },
   { key = 'l', mods = mod.SUPER, action = act.ActivatePaneDirection('Right') },

   -- key-tables --
   -- resizes fonts
   {
      key = 'f',
      mods = mod.LEADER,
      action = act.ActivateKeyTable({
         name = 'resize_font',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
   -- resize panes
   {
      key = 'p',
      mods = mod.LEADER,
      action = act.ActivateKeyTable({
         name = 'resize_pane',
         one_shot = false,
         timemout_miliseconds = 1000,
      }),
   },
}

-- tab to Function keys
for i = 1, 8 do
   table.insert(keys, {
      key = 'F' .. tostring(i),
      action = act.ActivateTab(i - 1),
   })
end

local key_tables = {
   resize_font = {
      { key = 'k', action = act.IncreaseFontSize },
      { key = 'j', action = act.DecreaseFontSize },
      { key = 'r', action = act.ResetFontSize },
   },
   resize_pane = {
      { key = 'k', action = act.AdjustPaneSize({ 'Up', 1 }) },
      { key = 'j', action = act.AdjustPaneSize({ 'Down', 1 }) },
      { key = 'h', action = act.AdjustPaneSize({ 'Left', 1 }) },
      { key = 'l', action = act.AdjustPaneSize({ 'Right', 1 }) },
   },
}

local mouse_bindings = {
   -- Ctrl-click will open the link under the mouse cursor
   {
      event = { Up = { streak = 1, button = 'Left' } },
      mods = 'CTRL',
      action = act.OpenLinkAtMouseCursor,
   },
}

return {
   disable_default_key_bindings = true,
   leader = { key = 'a', mods = 'SUPER' },
   keys = keys,
   key_tables = key_tables,
   mouse_bindings = mouse_bindings,
}
