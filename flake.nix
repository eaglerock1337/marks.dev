{
  description = "Docsify site dev shell";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

  outputs = { self, nixpkgs, ... }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
    node = pkgs.nodejs_20;  # LTS version with good npm compatibility
  in {
    devShells.${system}.default = pkgs.mkShell {
      packages = [
        node
      ];

      shellHook = ''
        export NODE_PATH="$(npm root -g)"
        export PATH="$(npm bin -g):$PATH"

        if ! command -v docsify > /dev/null; then
          echo "📦 Installing docsify-cli..."
          npm install -g docsify-cli
        fi

        echo "📚 Docsify environment ready! Run: docsify serve ./"
      '';
    };
  };
}
