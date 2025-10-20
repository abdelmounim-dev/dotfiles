{
  inputs,
  config,
  pkgs,
  ...
}:

{

  imports = [
    # ./hypr
    ./kanshi.nix
  ];
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "smeetz";
  home.homeDirectory = "/home/smeetz";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.
  home.sessionPath = [
    "$HOME/go/bin"
    "$HOME/.npm-global/bin"
  ];
  # config

  programs.git = {
    enable = true;
    userName = "Abdelmounim Baouia";
    userEmail = "abdelmounim.baouia@lastingdynamics.com";
    extraConfig = {
      core.editor = "vim";
      init.defaultBranch = "main";
      # url = {
      #   "ssh://git@github.com/" = {
      #     insteadOf = "https://github.com/";
      #   };
      # };
    };
  };

  # The home.packages option allows you to install Nix packages into your
  # environment.
  #home.packages = with pkgs [
  # # Adds the 'hello' command to your environment. It prints a friendly
  # # "Hello, world!" when run.
  # pkgs.hello

  # # It is sometimes useful to fine-tune packages, for example, by applying
  # # overrides. You can do that directly here, just don't forget the
  # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
  # # fonts?
  # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

  # # You can also create simple shell scripts directly inside your
  # # configuration. For example, this adds a command 'my-hello' to your
  # # environment:
  # (pkgs.writeShellScriptBin "my-hello" ''
  #   echo "Hello, ${config.home.username}!"
  # '')
  #];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  #home.file {
  # # Building this configuration will create a copy of 'dotfiles/screenrc' in
  # # the Nix store. Activating the configuration will then make '~/.screenrc' a
  # # symlink to the Nix store copy.
  # ".screenrc".source = dotfiles/screenrc;

  # # You can also set the file content immediately.
  # ".gradle/gradle.properties".text = ''
  #   org.gradle.console=verbose
  #   org.gradle.daemon.idletimeout=3600000
  # '';
  #};

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/ab/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "vim";
  };

  programs.fish = {
    enable = true;

    interactiveShellInit = ''
      fish_vi_key_bindings
    '';

    functions = {
      fish_greeting = ''
        # no greeting
      '';
    };
  };
  programs.zsh.enable = true;
  programs.bash.enable = true;
  programs.kitty = {
    enable = true;
    # Optionally override the kitty package
    # package = pkgs.kitty;

    font = {
      name = "JetBrainsMono Nerd Font"; # or your preferred font
      size = 12.0;
      # package = pkgs.nerdfonts.override { fonts = [ "FiraCode" ]; };
    };

    # Main settings (not theme-related)
    settings = {
      background_opacity = 0.2;
      background_blur = 1;
      confirm_os_window_close = 0;
      tab_bar_min_tabs = 2;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
    };

    # Colors and theming
    extraConfig = ''
      # Cursor colors
      cursor                  #F5E0DC
      cursor_text_color       #1E1E2E

      # URL underline color
      url_color               #F5E0DC

      # Kitty window border colors
      active_border_color     #B4BEFE
      inactive_border_color   #6C7086
      bell_border_color       #F9E2AF

      # OS Window titlebar colors
      wayland_titlebar_color system
      macos_titlebar_color system

      # Tab bar colors
      active_tab_foreground   #11111B
      active_tab_background   #CBA6F7
      inactive_tab_foreground #CDD6F4
      inactive_tab_background #181825
      tab_bar_background      #11111B

      # Colors for marks
      mark1_foreground #1E1E2E
      mark1_background #B4BEFE
      mark2_foreground #1E1E2E
      mark2_background #CBA6F7
      mark3_foreground #1E1E2E
      mark3_background #74C7EC

      # 16 terminal colors
      foreground              #CDD6F4
      background              #1E1E2E
      selection_foreground    #1E1E2E
      selection_background    #F5E0DC

      color0  #45475A
      color8  #585B70
      color1  #F38BA8
      color9  #F38BA8
      color2  #A6E3A1
      color10 #A6E3A1
      color3  #F9E2AF
      color11 #F9E2AF
      color4  #89B4FA
      color12 #89B4FA
      color5  #F5C2E7
      color13 #F5C2E7
      color6  #94E2D5
      color14 #94E2D5
      color7  #BAC2DE
      color15 #A6ADC8
    '';
  };
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    # custom settings
    settings = {
      add_newline = true;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = false;
    };
  };
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
