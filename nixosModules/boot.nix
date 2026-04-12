{ ... }: {
  boot = {
    plymouth.enable = true;

    loader = {
      efi.canTouchEfiVariables = true;
      efi.efiSysMountPoint = "/boot/efi";
      grub = {
        enable = true;
        devices = [ "nodev" ];
        efiSupport = true;
        useOSProber = true;
        splashImage = ./grub-bg.jpg;
        configurationLimit = 10;
      };
    }; 

    consoleLogLevel = 0;
    supportedFilesystems = [ "ntfs" ];
    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];
  };

  time.hardwareClockInLocalTime = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 30d";
  };
}
