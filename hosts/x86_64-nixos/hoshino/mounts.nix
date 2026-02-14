{ ... }:

{
  fileSystems."/mnt/media" = {
    device = "192.168.2.14:/mnt/d01/media";
    fsType = "nfs";
    options = [
      "rw"
      "hard"
      "intr"
      "nolock"
    ];
  };

  fileSystems."/mnt/home" = {
    device = "192.168.2.14:/mnt/d01/home";
    fsType = "nfs";
    options = [
      "rw"
      "hard"
      "intr"
      "nolock"
    ];
  };

  fileSystems."/mnt/common" = {
    device = "192.168.2.14:/mnt/d01/common";
    fsType = "nfs";
    options = [
      "rw"
      "hard"
      "intr"
      "nolock"
    ];
  };
}
