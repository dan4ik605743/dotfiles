{
  description = "NixOS configuration using Nix Flakes";

  inputs = {
    unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    stable.url = "github:nixos/nixpkgs/nixos-20.09";
    home.url = "github:nix-community/home-manager/release-21.05";
    neovim.url = "github:neovim/neovim?dir=contrib";

    nixpkgs.follows = "unstable";
  };

  outputs = { self, home, nixpkgs, ... } @ inputs:
  with nixpkgs.lib;
  let
    config = {
      allowBroken = true;
      allowUnfree = true;
    };
    overlays = with inputs; [
      (final: _:
      let
        system = final.stdenv.hostPlatform.system;
      in
      {
        neovim-nightly = neovim.packages.${system}.neovim;
        stable = import stable { inherit config system; };
      })
    ];
  in
  {
    nixosConfigurations.nixos = import ./system {
      inherit config home inputs nixpkgs overlays;
    };

    nixos = self.nixosConfigurations.nixos.config.system.build.toplevel;
  };
}
