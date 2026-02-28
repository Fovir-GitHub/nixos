{
  inputs,
  pkgs,
  ...
}: {
  nixpkgs.overlays = [
    (_final: prev: {
      sui = prev.callPackage ../../pkgs/sui {
        platform = prev.stdenv.hostPlatform;
      };
    })
    (final: prev: {
      vimPlugins =
        prev.vimPlugins
        // {
          hlchunk-nvim = prev.vimPlugins.hlchunk-nvim.overrideAttrs (oldAttrs: {
            src = pkgs.fetchFromGitHub {
              owner = "shellRaining";
              repo = "hlchunk.nvim";
              rev = "3bc2bd7aef28fbed6643534a0fdd0f19966544bc";
              sha256 = "sha256-NcfH9AnURII+MTSoyDgnotpzjcLNxXx1BXnKYXP2C/0=";
            };
          });
        };
    })
    (final: prev: {
      ollama-cuda = prev.ollama-cuda.overrideAttrs (oldAttrs: {
        version = "0.17.4";
        src = pkgs.fetchFromGitHub {
          owner = "ollama";
          repo = "ollama";
          tag = "v0.17.4";
          hash = "sha256-9yJ8Jbgrgiz/Pr6Se398DLkk1U2Lf5DDUi+tpEIjAaI=";
        };
        vendorHash = "sha256-Lc1Ktdqtv2VhJQssk8K1UOimeEjVNvDWePE9WkamCos=";
        proxyVendor = true;
      });
    })
    inputs.nix-vscode-extensions.overlays.default
  ];
}
