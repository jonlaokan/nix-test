{ pkgs, lib, config, inputs, ... }:

{
  env.GREET = "devenv";
  cachix.enable = false;

  # https://devenv.sh/packages/
    packages = [
      (pkgs.python3.withPackages (ps: [
        ps.requests
        ps.ipython
        ps.numpy
      ]))
    ];

  # https://devenv.sh/languages/
  # languages.rust.enable = true;

  # https://devenv.sh/processes/
  # processes.cargo-watch.exec = "cargo-watch";

  # https://devenv.sh/services/
  #services.postgres.enable = true;

  # https://devenv.sh/scripts/
  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  enterShell = ''
    hello
  '';

  # https://devenv.sh/tasks/
  # tasks = {
  #   "myproj:setup".exec = "mytool build";
  #   "devenv:enterShell".after = [ "myproj:setup" ];
  # };

  # https://devenv.sh/tests/
  enterTest = ''
      ipython --version
  '';

}
