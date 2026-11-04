{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.hex;
in
{
  options.programs.hex = {
    enable = lib.mkEnableOption "Hex local voice dictation";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.callPackage ../pkgs/hex-bin.nix {};
      description = "Hex package to install.";
    };
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
  };
}
