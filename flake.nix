{
  description = "Hoppla Emacs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    std = {
      url = "github:divnix/std";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    emacs-overlay.url = "github:hoppla20/emacs-overlay/patch-1";
  };

  outputs = {
    self,
    std,
    ...
  } @ inputs:
    std.growOn {
      inherit inputs;
      systems = ["x86_64-linux" "aarch64-linux"];
      cellsFrom = ./nix;
      cellBlocks = with std.blockTypes; [
        (pkgs "nixpkgs")
        (installables "packages" {})
      ];
    }
    {
      packages = std.harvest self ["emacs" "packages"];
      dependencies = std.harvest self ["dependencies" "packages"];
    };
}
