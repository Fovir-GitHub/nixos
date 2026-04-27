{pkgs, ...}: {
  programs.firefox = {
    enable = true;

    package = pkgs.firefox-devedition;
    languagePacks = ["en-US"];
    policies = {
      DisableAccounts = true;
      DisableAppUpdate = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxScreenshots = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DisplayBookmarksToolbar = "newtab";
      DisplayMenuBar = "default-off";
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Cryptomining = true;
        Fingerprinting = true;
        Locked = true;
        Value = true;
      };
      OfferToSaveLogins = false;
      OfferToSaveLoginsDefault = false;

      # Get ID with:
      # nix run github:tupakkatapa/mozid -- <URL>
      ExtensionSettings = {
        "*" = {
          installation_mode = "blocked";
        };
        # Dark Reader
        "addon@darkreader.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/addon@darkreader.org/latest.xpi";
          installation_mode = "force_installed";
        };
        # uBlock Origin
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # KeepassXC
        "keepassxc-browser@keepassxc.org" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/keepassxc-browser@keepassxc.org/latest.xpi";
          installation_mode = "force_installed";
        };
        # ClearURLs
        "{74145f27-f039-47ce-a470-a662b129930a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{74145f27-f039-47ce-a470-a662b129930a}/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # KISS Translator
        "{fb25c100-22ce-4d5a-be7e-75f3d6f0fc13}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{fb25c100-22ce-4d5a-be7e-75f3d6f0fc13}/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # TWP - Translate Web Pages
        "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{036a55b4-5e72-4d05-a06c-cba2dfcc134a}/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # User-Agent Switcher and Manager
        "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # Wappalyzer - Technology profiler
        "wappalyzer@crunchlabz.com" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/wappalyzer@crunchlabz.com/latest.xpi";
          installation_mode = "force_installed";
          private_browsing = true;
        };
        # Vimium
        "{d7742d87-e61d-4b78-b8a1-b469842139fa}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{d7742d87-e61d-4b78-b8a1-b469842139fa}/latest.xpi";
          installation_mode = "force_installed";
        };
        # Smart HTTPS
        "{b3e677f4-1150-4387-8629-da738260a48e}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/{b3e677f4-1150-4387-8629-da738260a48e}/latest.xpi";
          installation_mode = "force_installed";
        };
        # Simple Tab Groups
        "simple-tab-groups@drive4ik" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/simple-tab-groups@drive4ik/latest.xpi";
          installation_mode = "force_installed";
        };
        # Auto Tab Discard
        "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/4045009/latest.xpi";
          installation_mode = "force_installed";
        };
      };

      Preferences = {
        "browser.ctrlTab.sortByRecentlyUsed" = true;
        "browser.ml.linkPreview.enabled" = false;
        "browser.sessionstore.max_tabs_undo" = 3;
        "browser.sessionstore.restore_on_demand" = true;
        "browser.sessionstore.restore_pinned_tabs_on_demand" = true;
        "browser.sessionstore.restore_tabs_lazily" = true;
        "browser.startup.page" = 3;
        "browser.tabs.fadeOutExplicitlyUnloadedTabs" = true;
        "browser.tabs.unloadOnLowMemory" = true;
        "browser.tabs.unloadTabInContextMenu" = false;
        "browser.urlbar.trimHttps" = false;
        "browser.urlbar.trimURLs" = false;
      };
    };
  };
}
