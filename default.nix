{ pkgs }:
with pkgs;
emacs.override {
  withGTK3  = false;
  withMotif = true;
}
