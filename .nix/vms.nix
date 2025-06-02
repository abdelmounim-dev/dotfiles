{ config, pkgs, ... }:

{
  programs.dconf.enable = true;
  programs.virt-manager.enable = true;

  virtualisation.podman = {
    enable = true;
  };

  virtualisation.virtualbox.host.enable = true;
  virtualisation.virtualbox.host.enableExtensionPack = true;
  # users.extraGroups.vboxusers.members = [ "ab" ];

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice
    spice-gtk
    spice-protocol
    win-virtio
    win-spice
    adwaita-icon-theme
    distrobox
    docker-machine-kvm2
    qemu
    gnome-boxes
  ];

  virtualisation = {
    libvirtd = {
      enable = true;
      qemu = {
        swtpm.enable = true;
        ovmf.enable = true;
        ovmf.packages = [ pkgs.OVMFFull.fd ];
      };
    };
    spiceUSBRedirection.enable = true;
  };
  users.users.ab = {
    extraGroups = [
      "libvirtd"
      "kvm"
      "vboxusers"
    ];
  };
  services.spice-vdagentd.enable = true;
}
