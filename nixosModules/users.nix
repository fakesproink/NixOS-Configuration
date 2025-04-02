{ pkgs, ... }: {
  users.users.sproink = {
    isNormalUser = true;
    packages = with pkgs; [ tree ];
    extraGroups = [ "wheel" "input" "networkmanager" ];
    shell = pkgs.fish;
  };

  programs.fish.enable = true;
  # programs.zsh.enable = true;
}
