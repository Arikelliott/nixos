{

    networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain"; # Configure network proxy if necessary

    # - Firewall -
        # Open ports in the firewall.
        # networking.firewall.allowedTCPPorts = [ ... ];
        # networking.firewall.allowedUDPPorts = [ ... ];
        # Or disable the firewall altogether.
        networking.firewall.enable = false;

}