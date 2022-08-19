from libqtile import bar
from .widgets import *
from libqtile.config import Screen
import os
from qtile_extras import widget
from qtile_extras.widget.decorations import BorderDecoration
from qtile_extras.widget.decorations import RectDecoration

screens = [
    Screen(
        
        wallpaper='~/Pictures/Wallpapers/Gorilla-Wallpaper2.png',
        wallpaper_mode='fill',

        top=bar.Bar(
            [
                widget.TextBox(
                    text = ("  "),
                    font = "font-awesome",
                    fontsize = 20,
                    padding = 8,
                    foreground = colors[5],
                    background = colors[0],
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("rofi -show drun")}
                ),

                widget.TextBox(
                    **rounded_start,
                ),
                widget.GroupBox(
                    **group_box_settings,
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.Sep(
                    linewidth = 0,
                    foreground = colors[2],
                    background = colors[0],
                    padding = 10,
                    size_percent = 40,
                ),
                
                widget.TextBox(
                    **rounded_start,
                ),
                widget.CurrentLayoutIcon(
                    custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                    foreground = colors[2],
                    background = colors[14],
                    padding = -10,
                    scale = 0.40,
                ),
                widget.WindowCount(
                    background=colors[14],
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.Prompt(),

                widget.Spacer(),
                widget.TextBox(
                    text = (""),
                    **text_box_settings,
                    foreground = colors[12],
                    background = colors[0],
                ),
                widget.WindowName(
                    background = colors[0],
                    foreground = colors[12],
                    width = bar.CALCULATED,
                    empty_group_string = "Desktop",
                    max_chars = 130,
                ),
                widget.Spacer(),

                widget.Systray(
                    icon_size = 18,
                    padding = 10,
                ),

                widget.Sep(
                    linewidth=0,
                    foreground=colors[2],
                    padding=10,
                    size_percent=50,
                ),

                widget.TextBox(
                    **rounded_start,
                ),
                widget.TextBox(
                    text = (""),
                    **text_box_settings,
                    foreground=colors[8],
                    background=colors[14],
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("pavucontrol")},
                ),
                widget.Volume(
                    foreground=colors[8],
                    background=colors[14],
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.Sep(
                    linewidth=0,
                    foreground=colors[2],
                    padding=10,
                    size_percent=50,
                ),

                widget.TextBox(
                    **rounded_start,
                ),
                widget.TextBox(
                    text = (""),
                    **text_box_settings,
                    foreground = colors[7],
                    background = colors[14],
                ),
                widget.Net(
                    interface = 'enp3s0',
                    format="{down} ↓↑ {up}",
                    foreground=colors[7],
                    background=colors[14],
                    prefix="k",
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.Sep(
                    linewidth = 0,
                    foreground = colors[2],
                    padding = 10,
                    size_percent = 50,
                ),


                widget.TextBox(
                    **rounded_start,
                ),
                widget.TextBox(
                    text = (""),
                    **text_box_settings,
                    foreground = colors[5],
                    background = colors[14],
                ),
                widget.Clock(
                    format = "%a, %b %d",
                    background = colors[14],
                    foreground = colors[5],
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.Sep(
                    linewidth = 0,
                    foreground = colors[2],
                    padding = 10,
                    size_percent = 50,
                ),

                widget.TextBox(
                    **rounded_start,
                ),
                widget.TextBox(
                    text = (""),
                    **text_box_settings,
                    foreground = colors[4],
                    background = colors[14],
                ),
                widget.Clock(
                    format = '%H:%M',
                    foreground = colors[4],
                    background = colors[14],
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.QuickExit(
                    default_text = "  ",
                    countdown_format = '[ {} seconds ]',
                    max_chars = 10,
                    fontsize = 20,
                    padding = 8,
                    foreground = colors[3],
                ),
            ],
            size = 36,
            # border_width = [0, 0, 3, 0],
            # border_color = "#3b4252",
            opacity = 20,
            margin = [10, 10, 5, 10],
            background = colors[0],
        ),
    ),

    Screen(
        
        wallpaper='~/Pictures/Wallpapers/Gorilla-Wallpaper2.png',
        wallpaper_mode='fill',

        top=bar.Bar(
            [
                widget.TextBox(
                    text = ("  "),
                    font = "font-awesome",
                    fontsize = 20,
                    padding = 8,
                    foreground = colors[5],
                    background = colors[0],
                    mouse_callbacks = {'Button1': lambda: qtile.cmd_spawn("rofi -show drun")}
                ),

                widget.TextBox(
                    **rounded_start,
                ),
                widget.GroupBox(
                    **group_box_settings,
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.Sep(
                    linewidth = 0,
                    foreground = colors[2],
                    background = colors[0],
                    padding = 10,
                    size_percent = 40,
                ),
                
                widget.TextBox(
                    **rounded_start,
                ),
                widget.CurrentLayoutIcon(
                    custom_icon_paths = [os.path.expanduser("~/.config/qtile/icons")],
                    foreground = colors[2],
                    background = colors[14],
                    padding = -10,
                    scale = 0.40,
                ),
                widget.WindowCount(
                    background=colors[14],
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.Prompt(),

                widget.Spacer(),
                widget.TextBox(
                    text = (""),
                    **text_box_settings,
                    foreground = colors[12],
                    background = colors[0],
                ),
                widget.WindowName(
                    background = colors[0],
                    foreground = colors[12],
                    width = bar.CALCULATED,
                    empty_group_string = "Desktop",
                    max_chars = 130,
                ),
                widget.Spacer(),

                widget.Sep(
                    linewidth=0,
                    foreground=colors[2],
                    padding=10,
                    size_percent=50,
                ),

                widget.TextBox(
                    **rounded_start,
                ),
                widget.TextBox(
                    text=(""),
                    **text_box_settings,
                    foreground=colors[7],
                    background=colors[14],
                ),
                widget.Net(
                    interface = 'enp3s0',
                    format="{down} ↓↑ {up}",
                    foreground=colors[7],
                    background=colors[14],
                    prefix="k",
                    padding=5,
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.Sep(
                    linewidth=0,
                    foreground=colors[2],
                    padding=10,
                    size_percent=50,
                ),


                widget.TextBox(
                    **rounded_start,
                ),
                widget.TextBox(
                    text = (""),
                    **text_box_settings,
                    foreground = colors[5],
                    background = colors[14],
                ),
                widget.Clock(
                    format = "%a, %b %d",
                    background = colors[14],
                    foreground = colors[5],
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.Sep(
                    linewidth=0,
                    foreground=colors[2],
                    padding=10,
                    size_percent=50,
                ),

                widget.TextBox(
                    **rounded_start,
                ),
                widget.TextBox(
                    text = (""),
                    **text_box_settings,
                    foreground=colors[4],
                    background=colors[14],
                ),
                widget.Clock(
                    format = '%H:%M',
                    foreground=colors[4],
                    background=colors[14],
                    padding = 5,
                ),
                widget.TextBox(
                    **rounded_end,
                ),

                widget.Sep(
                    linewidth=0,
                    foreground=colors[2],
                    padding=10,
                    size_percent=50,
                ),
            ],
            size = 36,
            # border_width = [0, 0, 3, 0],
            # border_color = "#3b4252",
            opacity = 20,
            margin = [10, 10, 5, 10],
            background = colors[0],
        ),
    ),
]
