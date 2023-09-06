{
  inputs,
  cell,
}: let
  pkgs = inputs.nixpkgs;
in {
  inherit
    (pkgs)
    tree-sitter
    ;
}
