{ pkgs, ... }: {
  users.users.sproink = {
    isNormalUser = true;
    packages = with pkgs; [ tree ];
    extraGroups = [ "wheel" "input" "networkmanager" ];
    shell = pkgs.zsh;
  };

  programs.zsh.enable = true;
}
