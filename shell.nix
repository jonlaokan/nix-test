{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    packages = [ pkgs.nodejs pkgs.python3 ];
    
    shellHook = ''
      echo "Project x shell"
    '';
    runtimeInputs = [ pkgs.cowsay pkgs.lolcat ];

    FOO = "BAR";
    BAR = "FOO";

    LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [pkgs.ncurses]}";
}
