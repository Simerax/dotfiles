{config, pkgs, ... }:

{
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

  environment.systemPackages = with pkgs; [
    zsh
    oh-my-zsh
  ];

  fonts.fonts = with pkgs; [
    powerline-fonts # Zsh Agnoster Theme 
  ];
}
