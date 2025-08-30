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
          
          # Native Nix packages (verified common ones)
          neovim
          tmux
          zsh
          nano
          zellij
          vscode
          
          # Development tools
          python3
          python3Packages.pip
          nodejs
          nodePackages.npm
          
          # AI tools from nix folder
          (import ./nix/amp.nix { inherit pkgs; })
          (import ./nix/backlog-md.nix { inherit pkgs; })
          (import ./nix/catnip.nix { inherit pkgs; })
          (import ./nix/claude-code.nix { inherit pkgs; })
          (import ./nix/claude-code-router.nix { inherit pkgs; })
          (import ./nix/claude-desktop.nix { inherit pkgs; })
          (import ./nix/claudebox.nix { inherit pkgs; })
          (import ./nix/codex.nix { inherit pkgs; })
          (import ./nix/crush.nix { inherit pkgs; })
          (import ./nix/cursor-agent.nix { inherit pkgs; })
          (import ./nix/forge.nix { inherit pkgs; })
          (import ./nix/gemini-cli.nix { inherit pkgs; })
          (import ./nix/goose-cli.nix { inherit pkgs; })
          (import ./nix/groq-code-cli.nix { inherit pkgs; })
          (import ./nix/kiro.nix { inherit pkgs; })
          (import ./nix/opencode.nix { inherit pkgs; })
          (import ./nix/qwen-code.nix { inherit pkgs; })
        ];
        
        shellHook = ''
          export PATH="$HOME/.local/bin:$PATH"
        '';
      };
    };
}
