{
  inputs,
  cell,
}: {
  nixpkgs-with-emacs-overlay = import inputs.nixpkgs {
    inherit (inputs.nixpkgs) system;
    overlays = [
      inputs.emacs-overlay.overlays.default
    ];
  };
}
