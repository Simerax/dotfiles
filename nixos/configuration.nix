# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  # boot.loader.grub.efiSupport = true;
  # boot.loader.grub.efiInstallAsRemovable = true;
  # boot.loader.efi.efiSysMountPoint = "/boot/efi";
  # Define on which hard drive you want to install Grub.

  networking.hostName = "nix"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
  networking.useDHCP = false;
  networking.interfaces.enp0s25.useDHCP = true;
  networking.interfaces.wlp3s0.useDHCP = true;
  networking.interfaces.wwp0s20u4i6.useDHCP = true;

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "de";
    defaultLocale = "de_DE.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Berlin";

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.sessionVariables.TERMINAL = ["termite"];
  environment.systemPackages = with pkgs; [
    wget
    git
    i3
    wpa_supplicant
    vim # basically only for easier setup of vundle
    neovim
    vimPlugins.vundle
    termite
    zsh
    oh-my-zsh
    xorg.transset # terminal transparency - see .zshrc
    firefox
    neofetch
    feh
    xorg.xev
  ];

  fonts.fonts = with pkgs; [
    font-awesome # for all the icons used in my i3config
    powerline-fonts # Zsh Agnoster Theme 
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = { enable = true; enableSSHSupport = true; };
  programs.zsh = {
    enable = true;
    promptInit = "";
    interactiveShellInit = "";
    ohMyZsh = {
      enable = true;
      theme = "agnoster";
      plugins = [
        "git"
      ];
    };
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  sound.enable = true;
  hardware.pulseaudio.enable = true;

  # I don't want the damn "askpass" program
  programs.ssh.askPassword = "";

  # Enable touchpad support.
  services.xserver.libinput.enable = true;

  environment.pathsToLink = ["/libexec"];

  services.xserver = {
    enable = true;
    layout = "de";
    xkbOptions = "eurosign:e";
    displayManager.sddm = {
      enable = true;
    };

    desktopManager = {
      xterm.enable = false;
      plasma5 = {
        enable = true;
      };
    };

    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        i3status
        i3lock
        compton # for transparency
        rofi-unwrapped # dmenu alternative
      ];
    };
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.xaver = {
    shell = pkgs.zsh;
    isNormalUser = true;
    home = "/home/xaver";
    extraGroups = ["wheel"];
  };
  # users.users.jane = {
  #   isNormalUser = true;
  #   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
  # };

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software such as database
  # servers. You should change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09"; # Did you read the comment?

}

