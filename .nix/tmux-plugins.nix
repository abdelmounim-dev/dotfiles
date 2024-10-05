{ pkgs, ... }:

{

   programs.tmux = {
      enable = true;
   extraConfig = with pkgs.tmuxPlugins;
   ''
         # Plugins
         run-shell '${catppuccin}/share/tmux-plugins/catppuccin/catppuccin.tmux'
         run-shell '${weather}/share/tmux-plugins/weather/weather.tmux'
         run-shell '${vim-tmux-navigator}/share/tmux-plugins/vim-tmux-navigator/vim-tmux-navigator.tmux'
         run-shell '${tilish}/share/tmux-plugins/tilish/tilish.tmux'
         run-shell '${sysstat}/share/tmux-plugins/sysstat/sysstat.tmux'
         run-shell '${resurrect}/share/tmux-plugins/resurrect/resurrect.tmux'
         run-shell '${open}/share/tmux-plugins/open/open.tmux'
         run-shell '${continuum}/share/tmux-plugins/continuum/continuum.tmux'
         run-shell '${yank}/share/tmux-plugins/yank/yank.tmux'
      '';
   };
   environment.systemPackages= with pkgs.tmuxPlugins; [
      catppuccin
      weather
      vim-tmux-navigator
      tilish
      sysstat
      resurrect
      open
      continuum
      yank
  ];
}
