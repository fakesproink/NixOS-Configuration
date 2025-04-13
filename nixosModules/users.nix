{ pkgs, ... }: {
  users.users.sproink = {
    isNormalUser = true;
    packages = with pkgs; [ tree ];
    extraGroups = [ "wheel" "input" "networkmanager" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = [ "sproink" ];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  # programs.zsh.enable = true;
}
