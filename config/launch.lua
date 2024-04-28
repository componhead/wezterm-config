local platform = require('utils.platform')()

local options = {
   default_prog = {},
   launch_menu = {},
}

if platform.is_win then
   options.default_prog = { 'pwsh' }
   options.launch_menu = {
      { label = 'Command Prompt', args = { 'cmd' } },
      { label = 'Nushell', args = { 'nu' } },
   }
elseif platform.is_mac then
   options.default_prog = { '/usr/local/bin/fish' }
   options.launch_menu = {
      { label = 'Nushell', args = { '/usr/local/bin/nu' } },
   }
elseif platform.is_linux then
   options.default_prog = { '/usr/local/bin/fish' }
   options.launch_menu = {
      { label = 'Nushell', args = { '/usr/local/bin/nu' } },
   }
end

return options
