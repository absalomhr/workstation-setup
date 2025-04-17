local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config = {
  default_cursor_style = "SteadyBar",
  automatically_reload_config = true,
  adjust_window_size_when_changing_font_size = false,
  window_decorations = "RESIZE",
  tab_bar_at_bottom = true,
  font_size = 17.5,
  font = wezterm.font("Inconsolata Nerd Font Mono", {weight="Bold", stretch="Normal", style="Normal"}),
  enable_tab_bar = true,
  window_padding = {
    left = 15,
    right = 15,
    top = 15,
    bottom = 15,
  },
  background = {
    {
      source = {
        File = "/Users/" .. os.getenv("USER") .. "/.config/wezterm/dark-desert.jpg",
      },
      hsb = {
        hue = 1.0,
        saturation = 1.02,
        brightness = 0.25,
      },
      -- attachment = { Parallax = 0.3 },
      -- width = "100%",
      -- height = "100%",
    },
    {
      source = {
        Color = "#282833",
      },
      width = "100%",
      height = "100%",
      opacity = 0.55,
    },
  },
  -- from: https://akos.ma/blog/adopting-wezterm/
  hyperlink_rules = {
    -- Matches: a URL in parens: (URL)
    {
      regex = "\\((\\w+://\\S+)\\)",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in brackets: [URL]
    {
      regex = "\\[(\\w+://\\S+)\\]",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in curly braces: {URL}
    {
      regex = "\\{(\\w+://\\S+)\\}",
      format = "$1",
      highlight = 1,
    },
    -- Matches: a URL in angle brackets: <URL>
    {
      regex = "<(\\w+://\\S+)>",
      format = "$1",
      highlight = 1,
    },
    -- Then handle URLs not wrapped in brackets
    {
      -- Before
      --regex = '\\b\\w+://\\S+[)/a-zA-Z0-9-]+',
      --format = '$0',
      -- After
      regex = "[^(]\\b(\\w+://\\S+[)/a-zA-Z0-9-]+)",
      format = "$1",
      highlight = 1,
    },
    -- implicit mailto link
    {
      regex = "\\b\\w+@[\\w-]+(\\.[\\w-]+)+\\b",
      format = "mailto:$0",
    },
  },
}

config. keys = {

  -- Alt + Left Arrow to move to the previous word

  {key="LeftArrow", mods="ALT", action=wezterm.action{SendString="\x1bb"}},

  -- Alt + Right Arrow to move to the next word

  {key="RightArrow", mods="ALT", action=wezterm.action{SendString="\x1bf"}},

  -- Cmd + Left Arrow to move to the beginning of the line

  {key="LeftArrow", mods="CMD", action=wezterm.action{SendString="\x01"}},

  -- Cmd + Right Arrow to move to the end of the line

  {key="RightArrow", mods="CMD", action=wezterm.action{SendString="\x05"}},

}

return config
