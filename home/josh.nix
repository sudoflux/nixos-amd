{ config, pkgs, ... }: {
  home.username = "josh";
  home.homeDirectory = "/home/josh";

  programs.home-manager.enable = true;
  programs.zsh.enable = true;

  home.packages = with pkgs; [
    starship
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      exec-once = [
        "kitty"
        "firefox"
      ];
      bind = [
        "SUPER, RETURN, exec, kitty"
        "SUPER, B, exec, firefox"
        "SUPER, Q, exit"
      ];
    };
  };

  home.stateVersion = "24.05";
}
