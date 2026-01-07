{ pkgs, inputs, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.default
  ];

  programs.zen-browser = {
    enable = true;
    # Ensure the package is explicitly set to avoid undefined variable errors
    package = inputs.zen-browser.packages.${pkgs.system}.default;
    
    profiles.default = {
      id = 0;
      name = "default";
      isDefault = true;
      
      settings = {
        "zen.urlbar.replace-newtab" = false;
        "browser.startup.homepage" = "about:home";
        "browser.newtabpage.enabled" = true;
        "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
        "browser.newtabpage.activity-stream.showSponsored" = false;
        "browser.urlbar.suggest.searches" = true;
        "browser.urlbar.suggest.quicksuggest.sponsored" = false;
        "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
        
        # Telemetry
        "datareporting.healthreport.uploadEnabled" = false;
        "datareporting.policy.dataSubmissionEnabled" = false;
        "toolkit.telemetry.enabled" = false;
        "toolkit.telemetry.unified" = false;
        "toolkit.telemetry.server" = "";

        # Zen UI specifics
        "zen.view.use-multiple-toolbars" = true;
        "zen.view.sidebar.show-essentials" = false;
        "zen.view.show-pinned-tabs" = false;

        # New Tab Shortcuts
        "browser.newtabpage.activity-stream.default.sites" = "https://github.com,https://nixos.org,https://reddit.com";

        # Toolbar layout
        "browser.uiCustomization.state" = builtins.toJSON {
          placements = {
            "nav-bar" = [
              "zoom-controls"
              "history-panelmenu"
              "back-button"
              "forward-button"
              "stop-reload-button"
              "urlbar-container"
              "downloads-button"
              "unified-extensions-button"
            ];
            "toolbar-menubar" = [ "menubar-items" ];
            "PersonalToolbar" = [ "personal-bookmarks" ];
          };
          seen = [ "zoom-controls" "history-panelmenu" "developer-button" ];
          dirtyAreaCache = [ "nav-bar" "PersonalToolbar" "TabsToolbar" ];
          currentVersion = 20;
          newElementCount = 4;
        };
      };
      
      search = {
        force = true;
        default = "DuckDuckGo";
        engines = {
          "My NixOS" = {
            urls = [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
            icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
            definedAliases = ["@nx"];
          };
        };
      };
    };
  };

  # This must be outside the programs.zen-browser block
  xdg.mimeApps = {
    enable = true;
    defaultApplications = let
      desktopFile = "zen.desktop"; 
    in {
      "text/html" = desktopFile;
      "x-scheme-handler/http" = desktopFile;
      "x-scheme-handler/https" = desktopFile;
      "x-scheme-handler/about" = desktopFile;
      "x-scheme-handler/unknown" = desktopFile;
      "application/xhtml+xml" = desktopFile;
      "application/x-extension-htm" = desktopFile;
      "application/x-extension-html" = desktopFile;
      "application/x-extension-shtml" = desktopFile;
      "application/x-extension-xhtml" = desktopFile;
      "application/x-extension-xht" = desktopFile;
    };
  };
}
