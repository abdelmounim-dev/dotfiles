{
  services.kanshi = {
    enable = true;
    systemdTarget = "hyprland-session.target";

    settings = [
      {
        profile.name = "out";
        profile.outputs = [
          {
            criteria = "eDP-1";
            scale = 1.3;
            status = "enable";
          }
        ];
      }

      {
        profile.name = "home_office";
        profile.outputs = [
          {
            criteria = "LG Electronics LG ULTRAWIDE 0x0000FC6D";
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
      }
    ];
  };
}
