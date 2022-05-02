{ pkgs, lib, cfg, ... }: {
  console.keyMap = "ja";

  time.timeZone = "Asia/Tokyo";

  networking.firewall.allowedTCPPorts = [ 22 ];
  networking.timeServers = [
    "0.jp.pool.ntp.org"
    "1.jp.pool.ntp.org"
    "2.jp.pool.ntp.org"
    "3.jp.pool.ntp.org"
  ];

  services.openssh = {
    enable = true;
    passwordAuthentication = false;
    ports = [ 22 ];
  };
  services.chrony = { enable = true; };

  programs.zsh = {
    enable = true;
    autosuggestions = { enable = true; };
    syntaxHighlighting = { enable = true; };
    history = {
      extended = true;
      share = false;
      save = 100000;
      size = 100000;
    };
  };
  programs.starship = {
    enable = true;
  };
  programs.vim = {
    enable = true;
    defaultEditor = true;
  };

  users.users.root = {
    isSystemUser = true;
    shell = pkgs.zsh;
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ02RYFEONAr/5a3fokBYHUFVPqF8G64DxhV5RGu7gtK me@sno2wman.net"
    ];
  };

  users.users.sno2wman = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ02RYFEONAr/5a3fokBYHUFVPqF8G64DxhV5RGu7gtK me@sno2wman.net"
    ];
  };
}
