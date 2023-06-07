{
  description = "An Elixir development environment";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in
  {
    devShells.${system}.default = pkgs.mkShell {
      buildInputs = with pkgs; [
        elixir_1_14
        rebar
        rebar3
        git
        inotify-tools
      ];

      shellHook = ''
        # Hex and rebar setup
        mix local.hex --if-missing --force
        mix local.rebar --if-missing --force

        # # Set Erlang cookie
        # echo "Setting Erlang cookie"
        # echo 'your_cookie' > ~/.erlang.cookie
        # chmod 400 ~/.erlang.cookie
      '';
    };
  };
}
