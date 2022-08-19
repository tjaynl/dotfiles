import os
import subprocess

from libqtile import hook

@hook.subscribe.startup
def autostart():
    subprocess.Popen(["pipewire"])
    subprocess.Popen(["pipewire-pulse"])

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~/.config/qtile/autostart.sh')
    subprocess.Popen([home])
