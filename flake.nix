{
  description = "Aurelia TUI Flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in
    {
      packages = forAllSystems (
        system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          aurelia-tui = pkgs.callPackage ./default.nix { };
          default = self.packages.${system}.aurelia-tui;
        }
      );

      apps = forAllSystems (system: {
        aurelia-tui = {
          type = "app";
          program = "${self.packages.${system}.aurelia-tui}/bin/aurelia-tui";
        };
        default = self.apps.${system}.aurelia-tui;
      });
    };
}
