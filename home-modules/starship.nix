{config, pkgs, lib, ...}:
{
  programs.starship = {
    enable = true;
    settings = {
      line_break.disabled = true;
      format = lib.concatStrings [
        "$all"
        "$character"
      ];
      character = {
       success_symbol = "[λ](bold green)";
       error_symbol = "[✗](bold red)";
      };
      directory = {
        format = lib.concatStrings [
          "\\[[$path]"
          "($style)"
          "[$read_only]"
          "($read_only_style)\\] "
        ];
      };
    };
  };
}
