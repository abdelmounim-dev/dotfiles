
{ pkgs, ... }:

{

  users.users.ab.packages = with pkgs; [
    
      obsidian
      obsidian-export
      rofi-obsidian

      openpomodoro-cli


      ticktick
  ];
}
