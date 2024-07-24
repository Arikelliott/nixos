{

users.users.access = {
    isNormalUser = true;
    initialPassword = "pw123";
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user using "wheel" group.
    uid=1001; # Set User ID
};

}
