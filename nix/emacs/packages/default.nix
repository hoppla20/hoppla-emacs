{
  inputs,
  cell,
}: let
  pkgs = cell.nixpkgs.nixpkgs-with-emacs-overlay;
in rec {
  default = hoppla-emacs;
  hoppla-emacs = pkgs.emacsWithPackagesFromUsePackage {
    package = pkgs.emacs-unstable-pgtk;

    config = "${inputs.self}/etc/hoppla.org";
    defaultInitFile = false;
    alwaysEnsure = true;
    alwaysTangle = true;

    extraEmacsPackages = epkgs:
      builtins.attrValues {
        inherit
          (epkgs)
          no-littering # is configured before use-package is available
          ivy # TODO somewhere there is a dependency for ivy-hydra, which requires ivy
          ;
      }
      ++ [epkgs.treesit-grammars.with-all-grammars];
  };
}
