with import <nixpkgs> {};

mkYarnPackage rec {
  name = "purescript-multivac";

  src = ./.;

  # buildInputs = [
  #   pkgs.nodejs-12_x
  #   pkgs.yarn
  # ];

  packageJSON = ./package.json;
  yarnLock = ./yarn.lock;

  meta = with stdenv.lib; {
    description = "HTML/js viz helpers.";
    homepage = "https://github.com/tbenst/multivac";
    maintainers = with maintainers; [ tbenst ];
  };
}