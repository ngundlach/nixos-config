{
  lib,
  stdenv,
  fetchurl,
  dpkg,
  autoPatchelfHook,
  makeWrapper,
  alsa-lib,
  alsa-plugins,
  curl,
  ffmpeg-headless,
  fontconfig,
  freetype,
  libva,
  libx11,
  libxcb,
  libxcursor,
  libxi,
  libxkbcommon,
  libxrandr,
  openblas,
  openssl,
  pipewire,
  vulkan-loader,
  wayland,
  wl-clipboard,
  wtype,
  xdg-utils,
  symlinkJoin,
}:

stdenv.mkDerivation {
  pname = "hex";
  version = "3.3.0";

  src = fetchurl {
    url = "https://anoma.ly/release/hex/files/e5b3678eed33ca07c8771508f58df86a346f6b71324366ee93d205e8a6d54450/hex.deb";
    sha256 = "e5b3678eed33ca07c8771508f58df86a346f6b71324366ee93d205e8a6d54450";
  };

  nativeBuildInputs = [
    dpkg
    autoPatchelfHook
    makeWrapper
  ];

  buildInputs = [
    stdenv.cc.cc.lib
    alsa-lib
    fontconfig
    freetype
    libx11
    libxcb
    libxcursor
    libxi
    libxkbcommon
    libxrandr
    openssl
    vulkan-loader
    wayland
  ];

  unpackPhase = ''
    runHook preUnpack
    dpkg-deb -x $src .
    runHook postUnpack
  '';

  installPhase = ''
    runHook preInstall
    install -Dm755 usr/bin/hex $out/bin/hex
    install -Dm644 usr/share/applications/anomaly.hex.desktop \
      $out/share/applications/anomaly.hex.desktop
    mkdir -p $out/share
    cp -R usr/share/icons $out/share/
    install -Dm644 usr/share/licenses/hex/LICENSE \
      $out/share/licenses/hex/LICENSE

    substituteInPlace $out/share/applications/anomaly.hex.desktop \
      --replace-fail '/usr/bin/hex' "$out/bin/hex"
    runHook postInstall
  '';

  postFixup = ''
    wrapProgram $out/bin/hex \
      --prefix PATH : ${
        lib.makeBinPath [ curl ffmpeg-headless wl-clipboard wtype xdg-utils ]
      } \
      --prefix LD_LIBRARY_PATH : ${
        lib.makeLibraryPath [
          vulkan-loader
          openblas
          alsa-lib
          wayland
          libxkbcommon
          fontconfig
          pipewire
          libva
          libx11
          libxcb
          libxcursor
          libxrandr
          libxi
          openssl
          stdenv.cc.cc.lib
        ]
      } \
      --set ALSA_PLUGIN_DIR ${
        symlinkJoin {
          name = "hex-alsa-plugins";
          paths = [
            "${pipewire}/lib/alsa-lib"
            "${alsa-plugins}/lib/alsa-lib"
          ];
        }
      }
  '';

  meta = {
    description = "Local-first voice dictation (prebuilt Linux binary)";
    homepage = "https://anoma.ly/hex/";
    license = lib.licenses.mit;
    mainProgram = "hex";
    platforms = [ "x86_64-linux" ];
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
  };
}
