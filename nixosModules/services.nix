{ ... }: {
  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };

    hardware.openrgb.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
    };

    udisks2.enable = true;
    gvfs.enable = true;
  };

  programs.hyprland.enable = true;
}
