builtins.derivation {
    name = "demo_derivation";
    system = "x86_64-linux";
    builder = "/bin/sh";

    args = [
      "-c"
      "echo 'hello there' > $out"
    ];
}
