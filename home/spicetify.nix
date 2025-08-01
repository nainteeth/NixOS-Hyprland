{ config, pkgs, lib, spicetify-nix, ... }:

{
  imports = [
    spicetify-nix.homeManagerModules.default
  ];

  # Spicetify configuration
  programs.spicetify =
    let
      spicePkgs = spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      
      # Theme configuration
      theme = spicePkgs.themes.catppuccin;
      colorScheme = "mocha";
      
      # Extensions
      enabledExtensions = with spicePkgs.extensions; [
        fullAppDisplay
        autoSkipVideo
        skipStats
        goToSong
        copyToClipboard
        betterGenres
      ];

      # Custom apps
      enabledCustomApps = with spicePkgs.apps; [
        lyricsPlus
        newReleases
      ];

      # Optional: Custom color scheme override
      # customColorScheme = {
      #   text = "cdd6f4";
      #   subtext = "a6adc8";
      #   sidebar-text = "cdd6f4";
      #   main = "1e1e2e";
      #   sidebar = "181825";
      #   player = "181825";
      #   card = "313244";
      #   shadow = "11111b";
      #   selected-row = "313244";
      #   button = "89b4fa";
      #   button-active = "74c7ec";
      #   button-disabled = "6c7086";
      #   tab-active = "313244";
      #   notification = "a6e3a1";
      #   notification-error = "f38ba8";
      #   misc = "9399b2";
      # };
    };
}
