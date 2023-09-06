{
  inputs,
  cell,
}: let
  pkgs = cell.nixpkgs.nixpkgs-with-emacs-overlay;
in rec {
  default = hoppla-emacs;
  hoppla-emacs = pkgs.emacsWithPackagesFromUsePackage {
    package = pkgs.emacs-pgtk;

    config = "${inputs.self}/etc/hoppla.org";
    defaultInitFile = false;
    alwaysEnsure = true;
    alwaysTangle = false;

    extraEmacsPackages = epkgs:
      builtins.attrValues {
        inherit
          (epkgs)
          use-package
          no-littering # is configured before use-package is available
          ;
      };
  };

  python3WithPackages = pkgs.python3.withPackages (p: with p; [epc orjson sexpdata six paramiko]);
}
