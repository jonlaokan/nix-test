{ pkgs ? import <nixpkgs> { system = "x86_64-linux"; } }:

let
    nginxConf = pkgs.writeText "nginx.conf" ''
      user nobody nobody;
      daemon off;
      error_log /dev/stdout info;
      pid /dev/null;
      events {}
      http {
        access_log /dev/stdout;
        server {
          listen 80;
          index index.html;
          location / {
            root html;
          }
        }
      }
    '';
in
pkgs.dockerTools.buildLayeredImage {
    name = "nix-nginx";
    tag  = "latest";
    contents = [ pkgs.nginx pkgs.fakeNss pkgs.coreutils pkgs.bash ];

    extraCommands = ''
      mkdir -p var/log/nginx
      mkdir -p var/cache/nginx
      mkdir tmp
    '';

    config = {
      Cmd = ["nginx" "-c" nginxConf];
    };
}
