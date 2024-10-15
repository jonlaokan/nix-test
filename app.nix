{ pkgs ? import <nixpkgs> {} }:

pkgs.writeShellApplication {
    name = "small-apl";

    runtimeInputs = [ pkgs.cowsay pkgs.lolcat ];

    text = ''
      cowsay "Sample app hello" | lolcat
    '';
}
