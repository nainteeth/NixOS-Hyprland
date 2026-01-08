[
  "nm-applet"
  # This disables spotify whenever osu starts
  "socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do if echo \"$line\" | grep -q \"^openwindow>>.*osu!\"; then playerctl -p spotify pause; fi; done"
]
