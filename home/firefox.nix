{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    
    # Set Firefox as default browser
    package = pkgs.firefox;
    
    profiles = {
      default = {
        id = 0;
        name = "zen-style";
        isDefault = true;
        
        # Firefox preferences optimized for Zen-like experience
        settings = {
          # Zen Browser-like interface optimizations
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "svg.context-properties.content.enabled" = true;
          "layout.css.backdrop-filter.enabled" = true;
          "layout.css.color-mix.enabled" = true;
          
          # Tab behavior for sidebar tabs
          "browser.tabs.tabmanager.enabled" = false;
          "browser.tabs.firefox-view" = false;
          "browser.tabs.tabClipWidth" = 83;
          "browser.tabs.animate" = true;
          
          # Privacy settings (Zen-like defaults)
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.resistFingerprinting" = false; # Keep false for better theming
          
          # Performance optimizations
          "browser.cache.disk.enable" = true;
          "browser.cache.memory.enable" = true;
          "browser.sessionstore.interval" = 15000;
          "gfx.webrender.all" = true;
          "media.ffmpeg.vaapi.enabled" = true;
          
          # UI preferences for clean Zen-like interface
          "browser.startup.homepage" = "about:home";
          "browser.newtabpage.enabled" = true;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.tabs.warnOnClose" = false;
          "browser.urlbar.suggest.searches" = true;
          "browser.urlbar.suggest.quicksuggest.sponsored" = false;
          "browser.urlbar.suggest.quicksuggest.nonsponsored" = false;
          
          # Compact mode
          "browser.compactmode.show" = true;
          "browser.uidensity" = 1;
          
          # Smooth scrolling
          "general.smoothScroll" = true;
          "general.smoothScroll.lines.durationMaxMS" = 125;
          "general.smoothScroll.lines.durationMinMS" = 125;
          "general.smoothScroll.mouseWheel.durationMaxMS" = 200;
          "general.smoothScroll.mouseWheel.durationMinMS" = 100;
          "general.smoothScroll.msdPhysics.enabled" = true;
          "general.smoothScroll.other.durationMaxMS" = 125;
          "general.smoothScroll.other.durationMinMS" = 125;
          "general.smoothScroll.pages.durationMaxMS" = 125;
          "general.smoothScroll.pages.durationMinMS" = 125;
          
          # Disable telemetry
          "datareporting.healthreport.uploadEnabled" = false;
          "datareporting.policy.dataSubmissionEnabled" = false;
          "toolkit.telemetry.enabled" = false;
          "toolkit.telemetry.unified" = false;
          "toolkit.telemetry.server" = "";
          
          # Security
          "security.tls.version.fallback-limit" = 3;
          "security.tls.version.min" = 3;
          "dom.security.https_only_mode" = true;
        };
        
        # Extensions for Zen-like functionality - FIXED: moved to extensions.packages
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          tree-style-tab          # Essential for sidebar tabs
          darkreader              # Better dark mode for websites  
          stylus                  # For custom CSS styling
          privacy-badger
          decentraleyes
          clearurls               # Remove tracking parameters
          # Add more extensions as needed
        ];
        
        # Bookmarks section - FIXED: new submodule format
        bookmarks = {
          force = true;
          settings = [
            # Future bookmarks will go here
          ];
        };
        
        # Search engines with DuckDuckGo as default - FIXED: use 'ddg' ID
        search = {
          force = true;
          default = "ddg";
          engines = {
            "Nix Packages" = {
              urls = [{
                template = "https://search.nixos.org/packages";
                params = [
                  { name = "type"; value = "packages"; }
                  { name = "query"; value = "{searchTerms}"; }
                ];
              }];
              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };
            
            "NixOS Wiki" = {
              urls = [{ template = "https://nixos.wiki/index.php?search={searchTerms}"; }];
              # FIXED: use icon instead of iconUpdateURL
              icon = "https://nixos.wiki/favicon.png";
              definedAliases = [ "@nw" ];
            };
            
            "GitHub" = {
              urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
              # FIXED: use icon instead of iconUpdateURL  
              icon = "https://github.com/favicon.ico";
              definedAliases = [ "@gh" ];
            };
          };
        };
        
        # Zen-style dark theme with customizable CSS variables
        userChrome = ''
          /* CSS Variables for easy color customization */
          :root {
            /* Primary Colors */
            --zen-bg-primary: #1a1a1a;
            --zen-bg-secondary: #2d2d2d;
            --zen-bg-tertiary: #3d3d3d;
            --zen-bg-hover: #404040;
            --zen-bg-active: #4a4a4a;
            
            /* Text Colors */
            --zen-text-primary: #ffffff;
            --zen-text-secondary: #cccccc;
            --zen-text-muted: #999999;
            
            /* Accent Colors */
            --zen-accent-primary: #0078d4;
            --zen-accent-hover: #106ebe;
            --zen-accent-active: #005a9e;
            
            /* Border Colors */
            --zen-border-light: #404040;
            --zen-border-medium: #606060;
            --zen-border-dark: #2d2d2d;
            
            /* Tab Colors */
            --zen-tab-bg: var(--zen-bg-secondary);
            --zen-tab-hover: var(--zen-bg-hover);
            --zen-tab-active: var(--zen-bg-primary);
            --zen-tab-border: var(--zen-border-light);
            
            /* Sidebar */
            --zen-sidebar-width: 250px;
            --zen-sidebar-bg: var(--zen-bg-secondary);
          }
          
          /* Hide default tab bar for Tree Style Tab sidebar */
          #TabsToolbar {
            visibility: collapse !important;
          }
          
          /* Sidebar styling for Tree Style Tab */
          #sidebar-box {
            background-color: var(--zen-sidebar-bg) !important;
            border-right: 1px solid var(--zen-border-light) !important;
            min-width: var(--zen-sidebar-width) !important;
            max-width: var(--zen-sidebar-width) !important;
          }
          
          #sidebar-header {
            background-color: var(--zen-bg-secondary) !important;
            border-bottom: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
          }
          
          #sidebar {
            background-color: var(--zen-sidebar-bg) !important;
          }
          
          /* Main browser area adjustments */
          #browser {
            background-color: var(--zen-bg-primary) !important;
          }
          
          /* Toolbar styling */
          #nav-bar {
            background: var(--zen-bg-secondary) !important;
            border-bottom: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
            box-shadow: none !important;
          }
          
          /* URL bar styling */
          #urlbar {
            background-color: var(--zen-bg-tertiary) !important;
            border: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
          }
          
          #urlbar:focus-within {
            background-color: var(--zen-bg-hover) !important;
            border-color: var(--zen-accent-primary) !important;
          }
          
          #urlbar-input::placeholder {
            color: var(--zen-text-muted) !important;
          }
          
          /* Button styling */
          .toolbarbutton-1 {
            fill: var(--zen-text-secondary) !important;
            color: var(--zen-text-secondary) !important;
          }
          
          .toolbarbutton-1:hover {
            background-color: var(--zen-bg-hover) !important;
            fill: var(--zen-text-primary) !important;
            color: var(--zen-text-primary) !important;
          }
          
          /* Menu styling */
          menupopup {
            background-color: var(--zen-bg-secondary) !important;
            border: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
          }
          
          menuitem {
            color: var(--zen-text-primary) !important;
          }
          
          menuitem:hover {
            background-color: var(--zen-bg-hover) !important;
          }
          
          /* Scrollbar styling */
          scrollbar {
            background-color: var(--zen-bg-secondary) !important;
          }
          
          scrollbar thumb {
            background-color: var(--zen-bg-hover) !important;
            border-radius: 6px !important;
          }
          
          scrollbar thumb:hover {
            background-color: var(--zen-border-medium) !important;
          }
          
          /* Status panel */
          #statuspanel {
            background-color: var(--zen-bg-secondary) !important;
            border: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
          }
          
          /* Content area */
          #content {
            background-color: var(--zen-bg-primary) !important;
          }
          
          /* Remove unnecessary elements for cleaner look */
          #pageActionButton,
          #star-button-box {
            display: none !important;
          }
          
          /* Compact spacing */
          #nav-bar {
            padding: 2px 4px !important;
          }
          
          .toolbarbutton-1 {
            padding: 4px !important;
            margin: 2px !important;
          }
        '';
        
        # Dark theme for web content
        userContent = ''
          /* Additional dark theme enhancements for websites */
          @-moz-document url-prefix("about:") {
            body {
              background-color: var(--zen-bg-primary, #1a1a1a) !important;
              color: var(--zen-text-primary, #ffffff) !important;
            }
          }
          
          /* Scrollbar styling for web content */
          * {
            scrollbar-width: thin !important;
            scrollbar-color: #404040 #2d2d2d !important;
          }
        '';
        
        # Container tabs for organization
        containers = {
          work = {
            color = "blue";
            icon = "briefcase";
            id = 1;
          };
          personal = {
            color = "green";
            icon = "circle";
            id = 2;
          };
          development = {
            color = "orange";
            icon = "chill";
            id = 3;
          };
          social = {
            color = "pink";
            icon = "pet";
            id = 4;
          };
        };
      };
    };
    
    # Enterprise policies for enhanced privacy and Zen-like defaults
    policies = {
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
      DisablePocket = true;
      DisableFirefoxAccounts = false;
      DisableFirefoxScreenshots = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      DontCheckDefaultBrowser = true;
      DefaultDownloadDirectory = "\${home}/Downloads";
      PromptForDownloadLocation = false;
    };
  };
  
  # Set Firefox as default browser at system level
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "firefox.desktop";
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
      "x-scheme-handler/about" = "firefox.desktop";
      "x-scheme-handler/unknown" = "firefox.desktop";
    };
  };
}
