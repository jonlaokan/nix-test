{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    packages = with pkgs; [
        google-cloud-sdk
        awscli
        azure-cli
        opentofu
        kubectl
        k9s
    ];

    shellHook = ''
      exec fish
    '';
}
