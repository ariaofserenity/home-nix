{
  ...
}:

{
  environment.variables = {
    QT_QPA_PLATFORM = "wayland";
  };

  security.sudo.enable = false;
  security.doas = {
    enable = true;
    extraRules = [
      {
        groups = [
          "wheel"
          "doas"
        ];
        persist = true;
        keepEnv = true;
      }
    ];
  };
}
