local wez = require('wezterm')
local act = wez.action
local c = {}

c.color_scheme = 'Gruvbox Dark (Gogh)'

c.enable_tab_bar = true
c.use_fancy_tab_bar = false
c.window_decorations = "RESIZE"

c.font = wez.font('FiraCode Nerd Font Mono')

c.window_padding = {
   left = '1cell',
   right = '1cell',
   top = '0.5cell',
   bottom = '0.5cell',
}

c.leader = { key = ' ', mods = 'CTRL', timeout_milliseconds = 1000 }

c.keys = {
   {
      key = 's',
      mods = 'LEADER|CTRL',
      action = act.SplitVertical { domain = 'CurrentPaneDomain' },
   },
   {
      key = 'v',
      mods = 'LEADER|CTRL',
      action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
   },
   {
      key = 'h',
      mods = 'LEADER|CTRL',
      action = act.ActivatePaneDirection('Left'),
   },
   {
      key = 'l',
      mods = 'LEADER|CTRL',
      action = act.ActivatePaneDirection('Right'),
   },
   {
      key = 'k',
      mods = 'LEADER|CTRL',
      action = act.ActivatePaneDirection('Up'),
   },
   {
      key = 'j',
      mods = 'LEADER|CTRL',
      action = act.ActivatePaneDirection('Down'),
   },
   { key = ' ', mods = 'LEADER|CTRL', action = act.ActivateCopyMode },
}

return c
