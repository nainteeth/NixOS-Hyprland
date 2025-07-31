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
        
        # Firefox preferences optimized for native vertical tabs
        settings = {
          # Zen Browser-like interface optimizations
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "svg.context-properties.content.enabled" = true;
          "layout.css.backdrop-filter.enabled" = true;
          "layout.css.color-mix.enabled" = true;
          
          # Enable native vertical tabs
          "sidebar.verticalTabs" = true;
          "sidebar.revamp" = true;
          "browser.tabs.inTitlebar" = 0;
          "browser.tabs.drawInTitlebar" = false;
          
          # Tab behavior optimized for vertical layout
          "browser.tabs.tabmanager.enabled" = true;
          "browser.tabs.firefox-view" = true;
          "browser.tabs.tabClipWidth" = 83;
          "browser.tabs.animate" = true;
          "browser.tabs.warnOnClose" = false;
          
          # Sidebar positioning
          "sidebar.position_start" = true;
          
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
          
          # UI preferences for clean interface with vertical tabs
          "browser.startup.homepage" = "about:home";
          "browser.newtabpage.enabled" = true;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.showSponsored" = false;
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
        
        # Only uBlock Origin - no Sidebery
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin       # Ad blocking only
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
        
        # Theme with auto-hide specifically for vertical tabs
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
            
            /* Toolbar height */
            --zen-toolbar-height: 36px;
            
            /* Vertical tabs dimensions */
            --vertical-tabs-width: 250px;
            --vertical-tabs-collapsed-width: 48px;
            --vertical-tabs-transition: 0.3s cubic-bezier(0.25, 0.46, 0.45, 0.94);
          }
          
          /* Hide horizontal tab bar completely */
          #TabsToolbar {
            visibility: collapse !important;
            margin-bottom: 0 !important;
          }
          
          /* Default sidebar styling (no auto-hide for general sidebar) */
          #sidebar-box {
            background-color: var(--zen-bg-secondary) !important;
            border-right: 1px solid var(--zen-border-light) !important;
            min-width: 250px !important;
            position: relative !important;
          }
          
          /* Auto-hide ONLY for vertical tabs panel */
          #sidebar-box[sidebarcommand="viewTabsSidebar"] {
            min-width: var(--vertical-tabs-collapsed-width) !important;
            width: var(--vertical-tabs-collapsed-width) !important;
            max-width: var(--vertical-tabs-width) !important;
            transition: width var(--vertical-tabs-transition), min-width var(--vertical-tabs-transition) !important;
            overflow: hidden !important;
          }
          
          /* Expand vertical tabs on hover */
          #sidebar-box[sidebarcommand="viewTabsSidebar"]:hover,
          #sidebar-box[sidebarcommand="viewTabsSidebar"]:focus-within {
            width: var(--vertical-tabs-width) !important;
            min-width: var(--vertical-tabs-width) !important;
            overflow: visible !important;
          }
          
          /* Style sidebar header */
          #sidebar-header {
            background-color: var(--zen-bg-secondary) !important;
            border-bottom: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
            padding: 4px 8px !important;
            min-height: 32px !important;
          }
          
          /* Style sidebar content */
          #sidebar {
            background-color: var(--zen-bg-secondary) !important;
            border: none !important;
            color: var(--zen-text-primary) !important;
          }
          
          /* Fade content when vertical tabs are collapsed */
          #sidebar-box[sidebarcommand="viewTabsSidebar"]:not(:hover):not(:focus-within) #sidebar {
            opacity: 0.8 !important;
            transition: opacity var(--vertical-tabs-transition) !important;
          }
          
          /* Style sidebar splitter */
          #sidebar-splitter {
            background-color: var(--zen-border-light) !important;
            border: none !important;
            width: 1px !important;
            transition: all 0.2s ease !important;
            position: relative !important;
          }
          
          #sidebar-splitter:hover {
            background-color: var(--zen-accent-primary) !important;
            width: 3px !important;
            box-shadow: 0 0 8px rgba(0, 120, 212, 0.3) !important;
          }
          
          /* Style native vertical tabs */
          .sidebar-panel[data-panel="tabs"] {
            background-color: var(--zen-bg-secondary) !important;
            color: var(--zen-text-primary) !important;
          }
          
          /* Style tab items in vertical sidebar */
          .tab-item,
          .tab,
          .tabbrowser-tab {
            background-color: transparent !important;
            border-radius: 4px !important;
            margin: 2px 4px !important;
            padding: 8px !important;
            transition: all 0.2s ease !important;
            color: var(--zen-text-secondary) !important;
            border: 1px solid transparent !important;
          }
          
          .tab-item:hover,
          .tab:hover,
          .tabbrowser-tab:hover {
            background-color: var(--zen-bg-hover) !important;
            color: var(--zen-text-primary) !important;
            border-color: var(--zen-border-light) !important;
          }
          
          .tab-item.active,
          .tab.selected,
          .tab[selected],
          .tabbrowser-tab[selected] {
            background-color: var(--zen-accent-primary) !important;
            color: var(--zen-text-primary) !important;
            border-color: var(--zen-accent-hover) !important;
            box-shadow: 0 2px 6px rgba(0, 120, 212, 0.3) !important;
          }
          
          /* Add hover indicator ONLY for vertical tabs when collapsed */
          #sidebar-box[sidebarcommand="viewTabsSidebar"]::before {
            content: "";
            position: absolute;
            left: 0;
            top: 50%;
            transform: translateY(-50%);
            width: 3px;
            height: 60px;
            background: linear-gradient(to bottom, transparent, var(--zen-accent-primary), transparent);
            opacity: 0;
            transition: opacity var(--vertical-tabs-transition);
            border-radius: 0 3px 3px 0;
            z-index: 1000;
          }
          
          #sidebar-box[sidebarcommand="viewTabsSidebar"]:not(:hover):not(:focus-within)::before {
            opacity: 0.6;
          }
          
          /* Main browser area */
          #browser {
            background-color: var(--zen-bg-primary) !important;
          }
          
          /* CLEAN THIN TOOLBAR */
          #nav-bar {
            background: var(--zen-bg-secondary) !important;
            border-bottom: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
            box-shadow: none !important;
            padding: 2px 8px !important;
            height: var(--zen-toolbar-height) !important;
            min-height: var(--zen-toolbar-height) !important;
            max-height: var(--zen-toolbar-height) !important;
            display: flex !important;
            align-items: center !important;
          }
          
          /* Style the URL bar for thin toolbar */
          #urlbar {
            background-color: var(--zen-bg-tertiary) !important;
            border: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
            border-radius: 6px !important;
            transition: all 0.2s ease !important;
            margin: 0 4px !important;
            flex: 1 !important;
            height: 26px !important;
            min-height: 26px !important;
          }
          
          #urlbar:focus-within {
            background-color: var(--zen-bg-hover) !important;
            border-color: var(--zen-accent-primary) !important;
            box-shadow: 0 0 0 2px rgba(0, 120, 212, 0.2) !important;
          }
          
          #urlbar-input {
            padding: 2px 8px !important;
            font-size: 13px !important;
          }
          
          #urlbar-input::placeholder {
            color: var(--zen-text-muted) !important;
          }
          
          /* Compact button styling */
          .toolbarbutton-1 {
            fill: var(--zen-text-secondary) !important;
            color: var(--zen-text-secondary) !important;
            border-radius: 4px !important;
            transition: all 0.2s ease !important;
            padding: 4px !important;
            margin: 0 1px !important;
            min-width: 24px !important;
            height: 24px !important;
          }
          
          .toolbarbutton-1:hover {
            background-color: var(--zen-bg-hover) !important;
            fill: var(--zen-text-primary) !important;
            color: var(--zen-text-primary) !important;
          }
          
          /* Style sidebar toggle button in toolbar */
          #sidebar-button {
            background-color: var(--zen-bg-tertiary) !important;
            border: 1px solid var(--zen-border-light) !important;
            border-radius: 4px !important;
            transition: all 0.2s ease !important;
          }
          
          #sidebar-button:hover {
            background-color: var(--zen-bg-hover) !important;
            border-color: var(--zen-accent-primary) !important;
            transform: translateY(-1px) !important;
            box-shadow: 0 2px 6px rgba(0, 0, 0, 0.2) !important;
          }
          
          /* Menu styling */
          menupopup {
            background-color: var(--zen-bg-secondary) !important;
            border: 1px solid var(--zen-border-light) !important;
            color: var(--zen-text-primary) !important;
            border-radius: 8px !important;
            box-shadow: 0 6px 20px rgba(0, 0, 0, 0.4) !important;
            padding: 4px !important;
          }
          
          menuitem {
            color: var(--zen-text-primary) !important;
            border-radius: 4px !important;
            margin: 2px !important;
            padding: 6px 10px !important;
            transition: all 0.15s ease !important;
            font-size: 13px !important;
          }
          
          menuitem:hover {
            background-color: var(--zen-bg-hover) !important;
          }
          
          /* Scrollbar styling */
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
            border-radius: 6px !important;
            backdrop-filter: blur(10px) !important;
          }
          
          /* Content area */
          #content {
            background-color: var(--zen-bg-primary) !important;
          }
          
          /* Remove unnecessary elements */
          #pageActionButton,
          #star-button-box,
          #pocket-button,
          #fxa-toolbar-menu-button {
            display: none !important;
          }
          
          /* Ensure toolbar layout is compact */
          #nav-bar-customization-target {
            display: flex !important;
            align-items: center !important;
            flex: 1 !important;
            height: 100% !important;
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
          
          menupopup {
            animation: fadeInUp 0.2s ease-out !important;
          }
          
          /* Zen-like subtle shadows */
          #urlbar:focus-within,
          .toolbarbutton-1:hover,
          menuitem:hover,
          #sidebar-button:hover {
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.15) !important;
          }
          
          /* Sidebar hint ONLY for vertical tabs when collapsed */
          #sidebar-box[sidebarcommand="viewTabsSidebar"]::after {
            content: "→";
            position: absolute;
            right: 8px;
            top: 50%;
            transform: translateY(-50%);
            color: var(--zen-text-muted);
            font-size: 16px;
            opacity: 0;
            transition: opacity 0.3s ease;
            pointer-events: none;
          }
          
          #sidebar-box[sidebarcommand="viewTabsSidebar"]:not(:hover):not(:focus-within)::after {
            opacity: 0.7;
          }
        '';
        
        # Clean userContent without Sidebery-specific styling
        userContent = ''
          /* Enhanced dark theme for web content */
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
          
          /* Zen-like smooth transitions for web elements */
          a, button, input, select, textarea {
            transition: all 0.2s ease !important;
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
