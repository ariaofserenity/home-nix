{
  config,
  pkgs,
  ...
}:
let
  apps = import ./apps.nix { inherit pkgs; };
in
{
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      mod = "Alt";
    in
    {
      "${mod}+Return".action = spawn apps.terminal;
      "Ctrl+Alt+L".action.spawn = [
        "noctalia-shell"
        "ipc"
        "call"
        "lockScreen"
        "lock"
      ];
      "Alt+D".action = spawn apps.appLauncher;
      "${mod}+O" = {
        action = toggle-overview;
        repeat = false;
      };
      "${mod}+Shift+Q".action = close-window;
      "${mod}+Left".action = focus-column-left;
      "${mod}+Down".action = focus-window-down;
      "${mod}+Up".action = focus-window-up;
      "${mod}+Right".action = focus-column-right;
      "${mod}+J".action = focus-column-left;
      "${mod}+L".action = focus-column-right;
      "${mod}+E".action = focus-monitor-next;
      "${mod}+Shift+Left".action = move-column-left;
      "${mod}+Shift+Down".action = move-window-down;
      "${mod}+Shift+Up".action = move-window-up;
      "${mod}+Shift+Right".action = move-column-right;
      "${mod}+Shift+J".action = move-column-left;
      "${mod}+Shift+L".action = move-column-right;
      "${mod}+WheelScrollDown" = {
        action = focus-workspace-down;
        cooldown-ms = 150;
      };
      "${mod}+WheelScrollUp" = {
        action = focus-workspace-up;
        cooldown-ms = 150;
      };
      "${mod}+1".action = focus-workspace 1;
      "${mod}+2".action = focus-workspace 2;
      "${mod}+3".action = focus-workspace 3;
      "${mod}+4".action = focus-workspace 4;
      "${mod}+5".action = focus-workspace 5;
      "${mod}+6".action = focus-workspace 6;
      "${mod}+7".action = focus-workspace 7;
      "${mod}+8".action = focus-workspace 8;
      "${mod}+9".action = focus-workspace 9;
      "${mod}+Shift+1".action.move-column-to-workspace = [ 1 ];
      "${mod}+Shift+2".action.move-column-to-workspace = [ 2 ];
      "${mod}+Shift+3".action.move-column-to-workspace = [ 3 ];
      "${mod}+Shift+4".action.move-column-to-workspace = [ 4 ];
      "${mod}+Shift+5".action.move-column-to-workspace = [ 5 ];
      "${mod}+Shift+6".action.move-column-to-workspace = [ 6 ];
      "${mod}+Shift+7".action.move-column-to-workspace = [ 7 ];
      "${mod}+Shift+8".action.move-column-to-workspace = [ 8 ];
      "${mod}+Shift+9".action.move-column-to-workspace = [ 9 ];
      "${mod}+F".action = maximize-column;
      "${mod}+Shift+F".action = fullscreen-window;
      "${mod}+Shift+S".action.screenshot = [ ];
      "${mod}+Space".action = toggle-window-floating;
    };
}
