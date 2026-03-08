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
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfwa8+K9yM9jSsgDkbcki5WTpg44Zmawy+jcqg00ntdCeX6QMKWFIlurwW4JWGjQOrnqdxTZNv6szlnBhX57XZtrXQ67X61m6txOprMRw+Vvr6jhkq2rf7VGF3/kYXKxR/VAMPphk8HGkVfZwaOCxCO9HkRTswN2ARUz+vqzSX/VWaoG5FMmq8fj39muNVRzBkz74pdwl3QFtg7VBkALWiDzdAKuM7/VEYgORYwxkNZx8tgyDz2usVxv7htKWgoifCUu20aBxJ4ZhUGR4n5kNRQTes4y5KWN8F6eWG2LJ444OQcd2RWdfVRQGSQnw93OLT8+hnULPR6HEblcJ7IOkr4dJUl8Do4Usqg/nCdAJ21zSzcKMeJIFICiwhZRAoVS85ihGyHAOt2/MeO8kvXlC3R3oiS3GPLbyvU7WpdOO3c7o34Vq3aQr4xNz7w4233/zMTYZLVas5SVBOqcY1ZS9dh0EyGdQmFaGVula8APzqoClHzMjpXlWBnClNOHMyMhM= aria@hoshino"
  ];

  networking.firewall.allowedTCPPorts = [ 22 ];
}
