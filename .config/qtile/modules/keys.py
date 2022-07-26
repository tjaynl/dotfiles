from libqtile.lazy import lazy
from libqtile.config import Key

mod = "mod4"
terminal = "alacritty"
browser = "firefox"
volume = "pavucontrol"
filemanager = "pcmanfm"
editor = "geany"
mediaplayer = "vlc"
screenshot = "flameshot"

keys = [
    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod], "a", lazy.spawn("rofi -show drun")),
    Key([mod], "w", lazy.spawn(browser)),
    Key([mod], "v", lazy.spawn(volume)),
    Key([mod], "e", lazy.spawn(filemanager)),
    Key([mod], "t", lazy.spawn(editor)),
    Key([mod], "m", lazy.spawn(mediaplayer)),
    Key([], "Print", lazy.spawn(screenshot)),

    Key([mod], "f", lazy.window.toggle_floating()),
    Key([mod, "shift"], "space", lazy.window.toggle_fullscreen()),

    # Qtile basics
    Key([mod], "r", lazy.spawncmd()),
    Key([mod, "shift"], "c", lazy.window.kill()),
    Key([mod, "shift"], "r", lazy.reload_config()),
    Key([mod, "shift"], "q", lazy.shutdown()),

    # Layout keys
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),

    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),

    Key([mod], "space", lazy.layout.next()),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod, "control"], "space", lazy.layout.flip()),

    # Brightness keys
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),

    # Audio keys
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer sset -q Master,0 5%-")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer sset -q Master,0 5%+")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -q set Master toggle")),
]
