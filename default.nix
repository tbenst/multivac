with import <nixpkgs> {};

stdenv.mkDerivation {
  name = "purescript-tooling-2019";

  buildInputs = [
    pkgs.nodejs-12_x
    pkgs.yarn
  ];

  shellHook = ''
    export PATH="$PWD/node_modules/.bin/:$PATH"
  '';
}