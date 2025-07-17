{ pkgs, ... }: {
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

    syncthing = {
      enable = true;
      openDefaultPorts = true;
    };

    udisks2.enable = true;
    gvfs.enable = true;
    blueman.enable = true;
  };

  programs.hyprland.enable = true;
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc
    ];
  };
}
