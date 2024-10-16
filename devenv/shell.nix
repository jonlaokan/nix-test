{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    packages = [
      pkgs.nodejs
      pkgs.python3
      pkgs.lolcat
      pkgs.cowsay
    ];

    shellHook = ''
      fish
      cowsay "Welcome into you dev shell" | lolcat
    '';

    FOO = "BAR";
    BAR = "FOO";

    LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [pkgs.ncurses]}";
}
