#!/bin/sh

export TERMINAL="foot"
export EDITOR="nvim"
export VISUAL="nvim"

# Wayland Configs
if [ "$XDG_SESSION_TYPE" == "wayland" ]; then
  export MOZ_ENABLE_WAYLAND=1
fi

# Sway Configs
if [ "$XDG_CURRENT_DESKTOP" == "sway" ]; then
  export DESKTOP_SESSION=sway
  # For Flameshot
  export SDL_VIDEODRIVER=wayland
  export _JAVA_AWT_WM_NONREPARENTING=1
  export QT_QPA_PLATFORM=wayland
  export XDG_CURRENT_DESKTOP=sway
  export XDG_SESSION_DESKTOP=sway
fi

sway --unsupported-gpu
