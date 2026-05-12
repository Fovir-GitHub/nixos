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
      ExtensionSettings = let
        mkExtensions = {
          ids,
          privateIds ? [],
          urlMap ? {},
        }: let
          allIds = ids ++ privateIds;
          defaultUrl = id: "https://addons.mozilla.org/firefox/downloads/latest/${id}/latest.xpi";
          mkEntry = id: {
            name = id;
            value = {
              install_url = urlMap.${id} or (defaultUrl id);
              installation_mode = "force_installed";
              private_browsing = builtins.elem id privateIds;
            };
          };
        in
          builtins.listToAttrs (map mkEntry allIds);
      in
        {
          "*" = {
            installation_mode = "blocked";
          };
        }
        // mkExtensions {
          ids = [
            "addon@darkreader.org" # Dark Reader
            "firefox@tampermonkey.net" # Tampermonkey
            "keepassxc-browser@keepassxc.org" # KeepassXC
            "simple-tab-groups@drive4ik" # Simple Tab Groups
            "{c2c003ee-bd69-42a2-b0e9-6f34222cb046}" # Auto Tab Discard
            "{d7742d87-e61d-4b78-b8a1-b469842139fa}" # Vimium
          ];
          privateIds = [
            "uBlock0@raymondhill.net" # uBlock Origin
            "wappalyzer@crunchlabz.com" # Wappalyzer - Technology profiler
            "{036a55b4-5e72-4d05-a06c-cba2dfcc134a}" # TWP - Translate Web Pages
            "{74145f27-f039-47ce-a470-a662b129930a}" # ClearURLs
            "{a6c4a591-f1b2-4f03-b3ff-767e5bedf4e7}" # User-Agent Switcher and Manager
            "{b3e677f4-1150-4387-8629-da738260a48e}" # Smart HTTPS
            "{fb25c100-22ce-4d5a-be7e-75f3d6f0fc13}" # KISS Translator
          ];
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
        "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
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
