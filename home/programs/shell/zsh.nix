{
  ...
}:

{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update = "sudo nixos-rebuild switch";
    };
    history = {
      size = 10000;
    };
    initContent = ''
      bindkey "''${key[Up]}" history-beginning-search-backward
      bindkey "''${key[Down]}" history-beginning-search-forward
      autoload -Uz colors && colors
      setopt PROMPT_SUBST
      PROMPT='%B%F{1}%n@%m%f %F{5}%~%f%b # '
    '';
  };
}
