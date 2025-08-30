{
  description = "AI CLI tools environment - minimal";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
          # Core utilities only
          curl
          wget
          git
          
          # AI tools from nix folder - just a few key ones
          (import ./nix/gemini-cli.nix { inherit pkgs; })
          (import ./nix/qwen-code.nix { inherit pkgs; })
        ];
        
        shellHook = ''
          export PATH="$HOME/.local/bin:$PATH"
        '';
      };
    };
}
