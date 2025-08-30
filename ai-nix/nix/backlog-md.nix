{ pkgs ? import <nixpkgs> {} }:

let
  nix-ai-tools = builtins.getFlake "github:numtide/nix-ai-tools";
in
nix-ai-tools.packages.${pkgs.system}.backlog-md
