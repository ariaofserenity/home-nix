{ pkgs, ... }:

{
  home.packages = [
  (pkgs.symlinkJoin {
    name = "ghidra-wrapped";
    paths = [ pkgs.ghidra ];
    buildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/ghidra \
        --set _JAVA_AWT_WM_NONREPARENTING 1
    '';
  })
];
}