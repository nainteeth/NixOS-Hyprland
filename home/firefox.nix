{ config, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    
    # Set Firefox as default browser
    package = pkgs.firefox-wayland;
    
    profiles = {
      default = {
        id = 0;
        name = "zen-style";
        isDefault = true;
        
        settings = {
          # Basic interface optimizations
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "svg.context-properties.content.enabled" = true;
          "layout.css.backdrop-filter.enabled" = true;
          "layout.css.color-mix.enabled" = true;
          
          # Tab behavior
          "browser.tabs.tabClipWidth" = 83;
          "browser.tabs.animate" = true;
          "browser.tabs.warnOnClose" = false;
          
          # Privacy settings
          "privacy.trackingprotection.enabled" = true;
          "privacy.trackingprotection.socialtracking.enabled" = true;
          "privacy.donottrackheader.enabled" = true;
          "privacy.resistFingerprinting" = false;
          
          # Performance optimizations
          "browser.cache.disk.enable" = true;
          "browser.cache.memory.enable" = true;
          "browser.sessionstore.interval" = 15000;
          "gfx.webrender.all" = true;
          "media.ffmpeg.vaapi.enabled" = true;
          
          # UI preferences
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
        
        # Extensions
        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          ublock-origin
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
    
    # Enterprise policies for enhanced privacy
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
  #xdg.mimeApps = {
    #enable = true;
    #defaultApplications = {
      #"text/html" = "firefox.desktop";
      #"x-scheme-handler/http" = "firefox.desktop";
      #"x-scheme-handler/https" = "firefox.desktop";
      #"x-scheme-handler/about" = "firefox.desktop";
      #"x-scheme-handler/unknown" = "firefox.desktop";
    #};
  #};
}
