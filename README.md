# Building Purescript with Nix
Clone this repo then simply `nix-build` from within directory.

## init project
Here is how I bootstrapped this project for use with Nix:
```
yarn add --dev purescript spago parcel-bundler
yarn spago init
yarn spago install halogen behaviors drawing
yarn2nix > yarn.nix
mkdir -p dist
spago2nix generate
```
https://discourse.purescript.org/t/recommended-tooling-for-purescript-applications-in-2019/948

## dev mode:
run in separate terminals
```
yarn spago build --watch
yarn parcel assets/*.html
```
## useful commands
```
yarn spago serve
```

## nix
```
yarn http-server /nix/store/pwxnky098n304pr3ka1m70p6g0jfs0nd-purescript-multivac/libexec/multivac/deps/multivac/dist/
```