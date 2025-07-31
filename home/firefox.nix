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
        
        # Firefox preferences optimized for Zen-like experience with Sidebery
        settings = {
          # Zen Browser-like interface optimizations
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "svg.context-properties.content.enabled" = true;
          "layout.css.backdrop-filter.enabled" = true;
          "layout.css.color-mix.enabled" = true;
          
          # Tab behavior for sidebar tabs - optimized for Sidebery
          "browser.tabs.tabmanager.enabled" = false;
          "browser.tabs.firefox-view" = false;
          "browser.tabs.tabClipWidth" = 83;
          "browser.tabs.animate" = true;
          
          # Sidebery-specific optimizations
          "sidebar.position_start" = true;
          "sidebar.revamp" = true;
          
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
        
        # Extensions optimized for Sidebery workflow
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
          sidebery                # Modern tree-style tab management with better UX
          darkreader              # Better dark mode for websites  
          stylus                  # For custom CSS styling
          privacy-badger
          decentraleyes
          clearurls               # Remove tracking parameters
        ];
        
        # Bookmarks section
        bookmarks = {
          force = true;
          settings = [
            # Future bookmarks will go here
          ];
        };
        
        # Search engines with DuckDuckGo as default
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
              icon = "https://nixos.wiki/favicon.png";
              definedAliases = [ "@nw" ];
            };
            
            "GitHub" = {
              urls = [{ template = "https://github.com/search?q={searchTerms}"; }];
              icon = "https://github.com/favicon.ico";
              definedAliases = [ "@gh" ];
            };
          };
        };
        
        # Enhanced Zen-style theme optimized for Sidebery
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
            
            /* Sidebery-optimized Sidebar */
            --zen-sidebar-width: 320px;
            --zen-sidebar-collapsed-width: 48px;
            --zen-sidebar-bg: var(--zen-bg-secondary);
            --zen-sidebar-transition: 0.25s cubic-bezier(0.25, 0.46, 0.45, 0.94);
          }
          
          /* Hide default tab bar for Sidebery */
          #TabsToolbar {
            visibility: collapse !important;
            margin-bottom: 0 !important;
          }
          
          /* Enhanced sidebar optimized for Sidebery */
          #sidebar-box {
            background-color: var(--zen-sidebar-bg) !important;
            border-right: 1px solid var(--zen-border-light) !important;
            min-width: var(--zen-sidebar-collapsed-width) !important;
            max-width: var(--zen-sidebar-width) !important;
            width: var(--zen-sidebar-width) !important;
            transition: width var(--zen-sidebar-transition), min-width var(--zen-sidebar-transition) !important;
            position: relative !important;
            overflow: visible !important;
          }
          
          /* Sidebery auto-hide functionality */
          #sidebar-box:not(:hover):not(:focus-within) {
            width: var(--zen-sidebar-collapsed-width) !important;
            min-width: var(--zen-sidebar-collapsed-width) !important;
          }
          
          #sidebar-box:not(:hover):not(:focus-within) #sidebar {
            opacity: 0.8 !important;
          }
          
          /* Smooth expand on hover */
          #sidebar-box:hover,
          #sidebar-box:focus-within {
            width: var(--zen-sidebar-width) !important;
            min-width: var(--zen-sidebar-width) !important;
            z-index: 999 !important;
          }
          
          /* Sidebery-specific header styling */
          #sidebar-header {
            background-color: var(--zen-bg-secondary) !important;
            border-bottom: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
            padding: 8px 12px !important;
            min-height: 44px !important;
            display: flex !important;
            align-items: center !important;
          }
          
          /* Hide sidebar header when collapsed for cleaner look */
          #sidebar-box:not(:hover):not(:focus-within) #sidebar-header {
            padding: 8px 4px !important;
          }
          
          #sidebar-box:not(:hover):not(:focus-within) #sidebar-header .sidebar-title {
            opacity: 0 !important;
            transform: scale(0.8) !important;
          }
          
          /* Sidebar content optimized for Sidebery */
          #sidebar {
            background-color: var(--zen-sidebar-bg) !important;
            transition: opacity var(--zen-sidebar-transition) !important;
            border: none !important;
          }
          
          /* Enhanced sidebar splitter */
          #sidebar-splitter {
            background-color: transparent !important;
            border: none !important;
            width: 1px !important;
            transition: all 0.2s ease !important;
            position: relative !important;
          }
          
          #sidebar-splitter::before {
            content: "";
            position: absolute;
            left: 0;
            top: 0;
            bottom: 0;
            width: 1px;
            background-color: var(--zen-border-light);
            transition: all 0.2s ease;
          }
          
          #sidebar-splitter:hover::before {
            background-color: var(--zen-accent-primary) !important;
            width: 3px !important;
            box-shadow: 0 0 8px rgba(0, 120, 212, 0.3) !important;
          }
          
          /* Sidebar toggle button styling */
          #sidebar-button,
          #sidebar-switcher-target {
            background-color: var(--zen-bg-tertiary) !important;
            border: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
            border-radius: 6px !important;
            transition: all 0.2s ease !important;
            padding: 6px !important;
          }
          
          #sidebar-button:hover,
          #sidebar-switcher-target:hover {
            background-color: var(--zen-bg-hover) !important;
            border-color: var(--zen-accent-primary) !important;
            transform: translateY(-1px) !important;
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
            padding: 6px 12px !important;
          }
          
          /* URL bar styling */
          #urlbar {
            background-color: var(--zen-bg-tertiary) !important;
            border: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
            border-radius: 10px !important;
            transition: all 0.2s ease !important;
            margin: 0 8px !important;
          }
          
          #urlbar:focus-within {
            background-color: var(--zen-bg-hover) !important;
            border-color: var(--zen-accent-primary) !important;
            box-shadow: 0 0 0 3px rgba(0, 120, 212, 0.2) !important;
            transform: translateY(-1px) !important;
          }
          
          #urlbar-input::placeholder {
            color: var(--zen-text-muted) !important;
          }
          
          /* Button styling */
          .toolbarbutton-1 {
            fill: var(--zen-text-secondary) !important;
            color: var(--zen-text-secondary) !important;
            border-radius: 8px !important;
            transition: all 0.2s ease !important;
            padding: 8px !important;
          }
          
          .toolbarbutton-1:hover {
            background-color: var(--zen-bg-hover) !important;
            fill: var(--zen-text-primary) !important;
            color: var(--zen-text-primary) !important;
            transform: translateY(-1px) !important;
          }
          
          /* Menu styling */
          menupopup {
            background-color: var(--zen-bg-secondary) !important;
            border: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
            border-radius: 10px !important;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.4) !important;
            padding: 4px !important;
          }
          
          menuitem {
            color: var(--zen-text-primary) !important;
            border-radius: 6px !important;
            margin: 2px !important;
            padding: 8px 12px !important;
            transition: all 0.15s ease !important;
          }
          
          menuitem:hover {
            background-color: var(--zen-bg-hover) !important;
            transform: translateX(2px) !important;
          }
          
          /* Scrollbar styling for Sidebery */
          scrollbar {
            background-color: transparent !important;
            width: 6px !important;
          }
          
          scrollbar thumb {
            background-color: var(--zen-bg-hover) !important;
            border-radius: 6px !important;
            transition: background-color 0.2s ease !important;
          }
          
          scrollbar thumb:hover {
            background-color: var(--zen-border-medium) !important;
          }
          
          /* Status panel */
          #statuspanel {
            background-color: var(--zen-bg-secondary) !important;
            border: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
            border-radius: 8px !important;
            backdrop-filter: blur(10px) !important;
          }
          
          /* Content area */
          #content {
            background-color: var(--zen-bg-primary) !important;
          }
          
          /* Remove unnecessary elements for cleaner Sidebery workflow */
          #pageActionButton,
          #star-button-box,
          #pocket-button,
          #fxa-toolbar-menu-button {
            display: none !important;
          }
          
          /* Sidebery hover indicator */
          #sidebar-box::before {
            content: "";
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 3px;
            height: 60px;
            background: linear-gradient(to bottom, transparent, var(--zen-accent-primary), transparent);
            opacity: 0;
            transition: opacity var(--zen-sidebar-transition);
            border-radius: 0 3px 3px 0;
          }
          
          #sidebar-box:not(:hover):not(:focus-within)::before {
            opacity: 0.6;
          }
          
          /* Zen-like floating effect for interactive elements */
          #urlbar:focus-within,
          .toolbarbutton-1:hover,
          menuitem:hover,
          #sidebar-button:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2) !important;
          }
          
          /* Custom animations */
          @keyframes fadeInUp {
            from { 
              transform: translateY(10px); 
              opacity: 0; 
            }
            to { 
              transform: translateY(0); 
              opacity: 1; 
            }
          }
          
          /* Apply animations to menus */
          menupopup {
            animation: fadeInUp 0.2s ease-out !important;
          }
          
          /* Sidebery quick access hint */
          #sidebar-box::after {
            content: "Hover to expand";
            position: absolute;
            bottom: 16px;
            left: 50%;
            transform: translateX(-50%);
            color: var(--zen-text-muted);
            font-size: 10px;
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
            background: var(--zen-bg-secondary);
            padding: 4px 8px;
            border-radius: 4px;
            white-space: nowrap;
          }
          
          #sidebar-box:not(:hover):not(:focus-within):hover::after {
            opacity: 0.8;
          }
        '';
        
        # Dark theme for web content
        userContent = ''
          /* Enhanced dark theme for web content */
          @-moz-document url-prefix("about:") {
            body {
              background-color: var(--zen-bg-primary, #1a1a1a) !important;
              color: var(--zen-text-primary, #ffffff) !important;
            }
          }
          
          /* Sidebery-optimized scrollbar styling for web content */
          * {
            scrollbar-width: thin !important;
            scrollbar-color: #404040 #2d2d2d !important;
          }
          
          /* Zen-like smooth transitions for web elements */
          a, button, input, select, textarea {
            transition: all 0.2s ease !important;
          }
        '';
        
        # Container tabs for organization (works great with Sidebery)
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
