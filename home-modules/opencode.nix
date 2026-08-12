{pkgs, ...}: {
  programs.opencode = {
    enable = true;
    settings.mcp.nixos = {
      type = "local";
      command = ["${pkgs.mcp-nixos}/bin/mcp-nixos"];
      enabled = true;
    };
    tui.theme = "tokyonight";
  };
}
