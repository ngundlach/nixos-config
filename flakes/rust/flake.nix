{
  inputs = {
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = { self, fenix, nixpkgs }: {
    nixosModules.rust = { pkgs, ... }: {
      nixpkgs.overlays = [ fenix.overlays.default ];
      environment.systemPackages = with pkgs; [
        (pkgs.fenix.stable.withComponents [
          "cargo"
          "clippy"
          "rust-src"
          "rustc"
          "rustfmt"
        ])
        rust-analyzer
        rust-bindgen
        cargo-deny
        cargo-diet
        cargo-info
        cargo-about
        cargo-audit
        cargo-license
        cargo-tarpaulin
        cargo-outdated
        cargo-cache
        cargo-flamegraph
        cargo-zigbuild
        cargo-feature
        cargo-expand
        cargo-ndk
        cargo-tauri
        flutter_rust_bridge_codegen
        bacon
      ];
    };
  };
}
