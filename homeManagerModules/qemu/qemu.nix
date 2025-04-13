{ pkgs, config, lib, ... }: {
  options = {
    qemu.enable =
      lib.mkEnableOption "qemu";
  };

  config = lib.mkIf config.qemu.enable  {
    home.packages = with pkgs; [
      qemu
    ];
  };
}
