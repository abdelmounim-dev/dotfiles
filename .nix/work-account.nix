{pkgs, ...}:
{

  users.users.ab-work = {
    isNormalUser = true;
    description = "Abdelmounim work";
    extraGroups = [ "networkmanager" "wheel" ];
    # packages = with pkgs; [
    #   kdePackages.yakuake
    #   kdePackages.konsole
    #   kdePackages.kate
    #   stow
    #
    #   starship
    #   zoxide
    #
    #   telegram-desktop
    #   qbittorrent
    # ];
    shell = pkgs.fish;
  };
}
