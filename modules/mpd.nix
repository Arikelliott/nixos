{ config, ... }:

let
  USER = "arik";
in
{
  services.mpd.user = USER;
  home-manager.users.${USER} = {
    services.mpd = {
      enable = true;
      musicDirectory = "/home/${USER}/Music/";
      extraConfig = ''
        audio_output {
          type "pipewire"
          name "My PipeWire Output"
        }
      '';
    };
  };

  systemd.services.mpd.environment = {
    XDG_RUNTIME_DIR = "/run/user/${toString config.users.users.${USER}.uid}";
  };
}

