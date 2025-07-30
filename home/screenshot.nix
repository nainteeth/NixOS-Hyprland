{ config, lib, pkgs, ... }:

{
  # Create screenshot directory
  home.file."Pictures/Screenshots/.keep".text = "";
  
  # Install screenshot script
  home.file."bin/screenshot-menu" = {
    text = ''
      #!/usr/bin/env bash
      
      SCREENSHOT_DIR="$HOME/Pictures/Screenshots"
      
      # Menu options with emojis
      options="🖥️ Full Screen\n📱 Select Area\n🪟 Active Window\n✏️ Edit Area\n📋 Copy to Clipboard\n🎨 Annotate with Satty"
      
      # Show menu using wofi with your existing style
      chosen=$(echo -e "$options" | wofi \
          --dmenu \
          --prompt "📸 Screenshot:" \
          --width 400 \
          --height 320 \
          --columns 1 \
          --matching "contains" \
          --hide_scroll \
          --allow_markup \
          --style "${config.xdg.configHome}/wofi/style.css")
      
      case "$chosen" in
          "🖥️ Full Screen")
              grimblast --notify copysave screen "$SCREENSHOT_DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"
              ;;
          "📱 Select Area")
              grimblast --notify copysave area "$SCREENSHOT_DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"
              ;;
          "🪟 Active Window")
              grimblast --notify copysave active "$SCREENSHOT_DIR/$(date +'%Y-%m-%d_%H-%M-%S').png"
              ;;
          "✏️ Edit Area")
              grimblast --notify save area - | swappy -f -
              ;;
          "📋 Copy to Clipboard")
              grimblast --notify copy area
              ;;
          "🎨 Annotate with Satty")
              grimblast --notify save area - | satty -f -
              ;;
      esac
    '';
    executable = true;
  };
}
