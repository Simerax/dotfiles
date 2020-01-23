{config, pkgs, ... }:

{
  # I don't want the damn "askpass" program
  programs.ssh.askPassword = "";

  environment.pathsToLink = ["/libexec"];

  environment.systemPackages = let themes = pkgs.callPackage ../nixpkgs/pkgs/sddm-themes.nix {}; in [
    themes.sddm-abstract-dark
  ];

  services.xserver = {
    enable = true;
    libinput.enable = true; # Enable touchpad support. Otherwise the mouse is stuck under xfce - somehow i dont need this on plasma5
    layout = "de";
    xkbOptions = "eurosign:e";
    displayManager.sddm = {
      enable = true;
      theme = "abstract-dark";
    };

    desktopManager = {
      default = "xfce";
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };

    windowManager.i3 = {
      package = pkgs.i3-gaps; #lets actually use i3-gaps instead of regular i3
      enable = true;
      extraPackages = with pkgs; [
        i3status
        i3lock
        compton # for transparency
        rofi-unwrapped # dmenu alternative
        feh # background images
      ];
    };
  };

  fonts.fonts = with pkgs; [
    font-awesome # for all the icons used in my i3config
  ];
}
