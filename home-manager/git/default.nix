{ pkgs, ... }:

{

    programs.git = {
        enable = true;
        userName  = "Arikelliott";
        userEmail = "20728146+Arikelliott@users.noreply.github.com";
        aliases = {
            cm = "commit";
            s = "status";
        };
        delta = {
            enable = true;
        };
    };

}
