from libqtile import widget
from libqtile import qtile
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration
from qtile_extras.widget.decorations import RectDecoration

colors = [
    ["#2e3440", "#2e3440"],  # 0 background
    ["#d8dee9", "#d8dee9"],  # 1 foreground
    ["#3b4252", "#3b4252"],  # 2 background lighter
    ["#bf616a", "#bf616a"],  # 3 red
    ["#a3be8c", "#a3be8c"],  # 4 green
    ["#ebcb8b", "#ebcb8b"],  # 5 yellow
    ["#81a1c1", "#81a1c1"],  # 6 blue
    ["#b48ead", "#b48ead"],  # 7 magenta
    ["#88c0d0", "#88c0d0"],  # 8 cyan
    ["#e5e9f0", "#e5e9f0"],  # 9 white
    ["#4c566a", "#4c566a"],  # 10 grey
    ["#d08770", "#d08770"],  # 11 orange
    ["#8fbcbb", "#8fbcbb"],  # 12 super cyan
    ["#5e81ac", "#5e81ac"],  # 13 super blue
    ["#242831", "#242831"],  # 14 super dark background
]

widget_defaults = dict(
    font = "Sans Regular",
    fontsize = 12,
    padding = 2,
    background = colors[0],
    decorations = [
        BorderDecoration(
            colour = colors[0],
            border_width = [6, 0, 5, 0],
        ),
    ],
)

extension_defaults = widget_defaults.copy()

group_box_settings = {
    "padding": 5,
    "borderwidth": 4,
    "active": colors[9],
    "inactive": colors[10],
    "disable_drag": True,
    "rounded": True,
    "highlight_color": colors[2],
    "block_highlight_text_color": colors[6],
    "highlight_method": "block",
    "this_current_screen_border": colors[10],
    "this_screen_border": colors[2],
    "other_current_screen_border": colors[2],
    "other_screen_border": colors[0],
    "foreground": colors[1],
    "background": colors[14],
    "urgent_border": colors[3],
}

text_box_settings = {
    "font": "font-awesome",
    "fontsize" : 18,
    "padding" : 4,
}

rounded_start = {
    "text": "",
    "foreground" : colors[14],
    "background" : colors[0],
    "fontsize" : 20,
    "padding" : 0,
}

rounded_end = {
    "text" : "",
    "foreground" : colors[14],
    "background" : colors[0],
    "fontsize" : 20,
    "padding" : 0,
}
