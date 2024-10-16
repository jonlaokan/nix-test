{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    packages = [
      (pkgs.python3.withPackages (ps: [
        ps.requests
        ps.ipython
        ps.numpy
      ]))
    ];

    shellHook = ''
      exec ipython
    '';
}
