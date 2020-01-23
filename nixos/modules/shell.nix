{config, pkgs, ... }:

{
  imports = [
    ./zsh.nix
  ];
  environment.sessionVariables.TERMINAL = ["termite"];
  environment.systemPackages = with pkgs; [
    termite
  ];
}
