{...}: {
  programs.librewolf = {
    enable = true;

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
        # Tampermonkey
        "firefox@tampermonkey.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/firefox@tampermonkey.net/latest.xpi";
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
    profiles.default = {
      bookmarks = {
        force = true;
        settings = import ../../../values/browser-bookmarks.nix;
      };
      isDefault = true;
      search = {
        default = "searxng";
        force = true;
        engines = {
          "searxng" = {
            name = "Searxng";
            urls = [
              {
                template = "https://search.fovir.fyi/search";
                params = [
                  {
                    name = "q";
                    value = "{searchTerms}";
                  }
                ];
              }
            ];
          };
        };
      };
      settings = {
        "browser.uiCustomization.navBarWhenVerticalTabs" = ''
          [
            "back-button",
            "forward-button",
            "stop-reload-button",
            "customizableui-special-spring1",
            "vertical-spacer",
            "urlbar-container",
            "customizableui-special-spring2",
            "downloads-button",
            "fxa-toolbar-menu-button",
            "unified-extensions-button",
            "alltabs-button",
            "sidebar-button"
          ]
        '';
        "browser.uiCustomization.state" = ''
          {
            "placements": {
              "widget-overflow-fixed-list": [],
              "unified-extensions-area": [
                "_b3e677f4-1150-4387-8629-da738260a48e_-browser-action",
                "_74145f27-f039-47ce-a470-a662b129930a_-browser-action",
                "_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action",
                "_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action",
                "_fb25c100-22ce-4d5a-be7e-75f3d6f0fc13_-browser-action",
                "keepassxc-browser_keepassxc_org-browser-action",
                "addon_darkreader_org-browser-action",
                "wappalyzer_crunchlabz_com-browser-action",
                "firefox_tampermonkey_net-browser-action"
              ],
              "nav-bar": [
                "back-button",
                "forward-button",
                "stop-reload-button",
                "customizableui-special-spring1",
                "vertical-spacer",
                "urlbar-container",
                "customizableui-special-spring2",
                "downloads-button",
                "fxa-toolbar-menu-button",
                "unified-extensions-button",
                "ublock0_raymondhill_net-browser-action",
                "addon_darkreader_org-browser-action",
                "wappalyzer_crunchlabz_com-browser-action",
                "_74145f27-f039-47ce-a470-a662b129930a_-browser-action",
                "simple-tab-groups_drive4ik-browser-action",
                "sidebar-button"
              ],
              "toolbar-menubar": ["menubar-items"],
              "TabsToolbar": [],
              "vertical-tabs": ["tabbrowser-tabs"],
              "PersonalToolbar": ["personal-bookmarks"]
            },
            "seen": [
              "developer-button",
              "ublock0_raymondhill_net-browser-action",
              "_b3e677f4-1150-4387-8629-da738260a48e_-browser-action",
              "_d7742d87-e61d-4b78-b8a1-b469842139fa_-browser-action",
              "_74145f27-f039-47ce-a470-a662b129930a_-browser-action",
              "_a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7_-browser-action",
              "_036a55b4-5e72-4d05-a06c-cba2dfcc134a_-browser-action",
              "simple-tab-groups_drive4ik-browser-action",
              "_fb25c100-22ce-4d5a-be7e-75f3d6f0fc13_-browser-action",
              "keepassxc-browser_keepassxc_org-browser-action",
              "addon_darkreader_org-browser-action",
              "wappalyzer_crunchlabz_com-browser-action",
              "screenshot-button",
              "firefox_tampermonkey_net-browser-action"
            ],
            "dirtyAreaCache": [
              "nav-bar",
              "vertical-tabs",
              "unified-extensions-area",
              "TabsToolbar",
              "toolbar-menubar",
              "PersonalToolbar"
            ],
            "currentVersion": 23,
            "newElementCount": 2
          }
        '';
        "devtools.toolbox.host" = "right";
        "privacy.clearOnShutdown_v2.cache" = false;
        "privacy.clearOnShutdown_v2.cookiesAndStorage" = false;
        "sidebar.position_start" = false;
        "sidebar.verticalTabs" = true;
        "sidebar.verticalTabs.dragToPinPromo.dismissed" = true;
        "sidebar.visibility" = "expand-on-hover";
      };
    };
  };
}
