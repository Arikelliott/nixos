{

    services.openssh.enable = true; # Enable the OpenSSH daemon.
    programs.ssh.enableAskPassword = false; # Disable Askpass (hopefully)
    # programs.gnupg.agent.enableSSHSupport = true;
    programs.ssh.startAgent = true;

}
