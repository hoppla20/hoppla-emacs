{
  inputs,
  cell,
}: let
  pkgs = inputs.nixpkgs;
in {
  inherit
    (pkgs)
    ccls
    libvterm
    ;

  treesit-grammars = pkgs.treesit-grammars.with-all-grammars;
}
