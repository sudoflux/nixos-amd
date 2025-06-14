{ config, pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    git
    curl
    wget
    vim
    neovim
    zsh
  ];

  programs.zsh.enable = true;

  sound.enable = true;
  hardware.pulseaudio.enable = false;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };
}
