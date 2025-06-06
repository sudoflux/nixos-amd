{ config, pkgs, ... }: {
  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprland
    firefox
    kitty
    wl-clipboard
    xdg-utils
    xdg-desktop-portal-hyprland
    glib
    noto-fonts
    noto-fonts-emoji
  ];
}
