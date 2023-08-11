#!/bin/sh

export TERMINAL="foot"
export EDITOR="nvim"
export VISUAL="nvim"

# Wayland Configs
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
  export MOZ_ENABLE_WAYLAND=1
  # export QT_QPA_PLATFORM=wayland
  # export CLUTTER_BACKEND=wayland
  # export SDL_VIDEODRIVER=wayland
fi

# Sway Configs
if [ "$XDG_CURRENT_DESKTOP" == "sway" ]; then
  export DESKTOP_SESSION=sway
fi

sway --unsupported-gpu
