{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    zed-editor-fhs
    alejandra
    nixd
    nil
  ];
}
