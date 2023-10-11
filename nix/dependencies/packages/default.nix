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
    imagemagick
    ;
}
