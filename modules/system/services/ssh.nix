{
  ...
}:

{
  services.openssh = {
    enable = true;
    ports = [ 22 ];
    settings = {
      PasswordAuthentication = false;
      AllowUsers = [ "aria" ];
      UseDns = true;
      X11Forwarding = false;
      PermitRootLogin = "no";
    };
  };

  users.users.aria.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDaGzAqH/9U43Bcvj9XrIWH6urY8o6GzHxBrrQOkoPyuTqPxNQT623O8bCO4SvjaC3Ajv2CLSxDFoLkoxTNPx6YrHTNtNTJOUJT8HkhnxfZKrWRmOt4Xd9agLVbluxGrlgLasfjVF5c1JyWu1/QHh72xqki6mBCfaJMtYQJHH6mNKqtUr6OBPvtwEEd5DwNIDc/hUURTG8BvqGvt/voxmTxmNOnvf556PmHCrhNyPQ4w/bMhTVQnH8Yyj+hFKgVhpT5xg5C/YFicOgQJMFg0BpOBFXXahx5+LhFwSeSFxfNyRjYO78xMLpIKg+uEcc1vOPAn9Rp/6PSzWTztR87RLG89VBtnPjlzvuWDK4it7cUiYLFFMDJGxFw9hqRSkkv6MHN85mrGCtoHVRRMjHozKEfhzhwfQo/QpbiF/VKXy8SzkhQt7s9ZAMqhfwJkJsDPB8haeN3TJ3GfPjrKL+6R/iYFIvnV6gjFeKD45LEUc1TgZNtHlRiUNlrGot5FRz9NLk= aria@zemuria"
  ];

  networking.firewall.allowedTCPPorts = [ 22 ];
}
