{ sources ? import ./nix/sources.nix { }, pkgs ? import sources.nixpkgs { }, ...
}:
with pkgs;
let
  gitignore = pkgs.callPackage sources.gitignore { };
  naersk = pkgs.callPackage sources.naersk { };
in naersk.buildPackage {
  src = gitignore.gitignoreSource ./.;

  meta = with pkgs.lib; {
    description = "Bootstrap Nix environments.";
    homepage = "https://github.com/allenap/firstaide";
    license = with licenses; [ asl20 ];
    maintainers = [ ];
    platforms = platforms.all;
  };
}
