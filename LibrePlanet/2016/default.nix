{ }:

let
  pkgs = import <nixpkgs> {};

in pkgs.stdenv.mkDerivation rec {
  name = "build-env";
  src = ./.;
  buildInputs = with pkgs; [
    wget
    python
    pythonPackages.lxml
    git
    gitAndTools.git-annex
  ];
}
