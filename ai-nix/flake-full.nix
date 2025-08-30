{
  description = "AI CLI tools environment";

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
          # Core utilities
          curl
          wget
          unzip
          git
          
          # Native Nix packages (excluding vscode due to hash mismatch)
          neovim
          tmux
          zsh
          nano
          zellij
          
          # Development tools
          python3
          python3Packages.pip
          nodejs
          nodePackages.npm
          
          # AI tools from nix folder
          (import ./nix/gemini-cli.nix { inherit pkgs; })
          (import ./nix/qwen-code.nix { inherit pkgs; })
        ];
        
        shellHook = ''
          export PATH="$HOME/.local/bin:$PATH"
        '';
      };
    };
}
