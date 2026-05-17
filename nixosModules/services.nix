{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  services = {
    xserver = {
      enable = true;
      displayManager.gdm.enable = true;
    };

    hardware.openrgb.enable = true;

    pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
    };

    syncthing = {
      enable = true;
      openDefaultPorts = true;
    };

    udisks2.enable = true;
    gvfs.enable = true;
    # blueman.enable = true;
    dbus.implementation = "dbus";
  };

  programs.steam.enable = true;
  programs.hyprland.enable = true;
  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      glibc
    ];
  };

  systemd.services.disable-wakeup-gpp0 = {
    description = "disable GPP0 wakeup";
    wantedBy = [ "multi-user.target" ];
    serviceConfig.Type = "oneshot";
    script = ''
      echo GPP0 > /proc/acpi/wakeup
    '';
  };
}
