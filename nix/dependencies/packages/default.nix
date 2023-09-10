{
  inputs,
  cell,
}: let
  pkgs = inputs.nixpkgs;
in {
  inherit
    (pkgs)
    git
    ccls
    tree-sitter
    libvterm
    ;
}
