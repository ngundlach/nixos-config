{
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = {
    self,
    nixpkgs,
  }: {
    nixosModules.android-sdk = {pkgs, ...}: let
      androidComp = pkgs.androidenv.composeAndroidPackages {
        platformVersions = ["36"];
        buildToolsVersions = ["36.0.0"];
        includeSystemImages = true;
        systemImageTypes = ["google_apis_playstore"];
        abiVersions = ["x86_64"];
        includeNDK = true;
        includeEmulator = true;
        includeExtras = ["extras;google;google_play_services"];
        extraLicenses = [
          "android-googletv-license"
          "android-sdk-arm-dbt-license"
          "android-sdk-license"
          "android-sdk-preview-license"
          "google-gdk-license"
          "intel-android-extra-license"
          "intel-android-sysimage-license"
          "android-googlexr-license"
          "mips-android-sysimage-license"
        ];
      };
    in {
      nixpkgs.config.android_sdk.accept_license = true;
      environment.variables = {
        ANDROID_HOME = "${androidComp.androidsdk}/libexec/android-sdk";
        ANDROID_SDK_ROOT = "${androidComp.androidsdk}/libexec/android-sdk";
        ANDROID_NDK_ROOT = "${androidComp.androidsdk}/libexec/android-sdk/ndk-bundle";
      };
      environment.systemPackages = [
        androidComp.androidsdk
        pkgs.android-studio
        pkgs.flutter
      ];
      systemd.tmpfiles.rules = [
        "L /run/android-sdk - - - - ${androidComp.androidsdk}/libexec/android-sdk"
      ];
    };
  };
}
