{
  ...
}:

{
  services = {
      syncthing = {
          enable = true;
          group = "users";
          user = "aria";
          dataDir = "/home/aria/Documents/sync";    # Default folder for new synced folders
          configDir = "/home/aria/.config/syncthing";   # Folder for Syncthing's settings and keys
      };
  };
}
