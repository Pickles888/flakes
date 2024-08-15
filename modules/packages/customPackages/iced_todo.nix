{ lib
, fetchFromGitHub
, rustPlatform
, pkgs
}:

rustPlatform.buildRustPackage rec {
  pname = "iced-todo";
  version = "1.0.1";

  src = fetchFromGitHub {
    owner = "Pickles888";
    repo = "iced-todo";
    rev = "v${version}";
    sha256 = "sha256-MUb327AHKDhKswzdorD/rfLLrRX3IWGMiLDcTclhEsY=";
  };

  cargoHash = "sha256-elM7LP3wUmMizTQzpAVBZ9IiHo7wPPA63nucRf9yBtE=";

  nativeBuildInputs = with pkgs; [
    pkg-config
    cmake
    makeWrapper
  ];

  buildInputs = with pkgs; [
    fontconfig

    vulkan-headers
    vulkan-loader
    libGL

    libxkbcommon
    # WINIT_UNIX_BACKEND=wayland
    wayland

    # WINIT_UNIX_BACKEND=x11
    xorg.libXcursor
    xorg.libXrandr
    xorg.libXi
    xorg.libX11
  ];

  postFixup = ''
    wrapProgram $out/bin/${pname} \
      --suffix LD_LIBRARY_PATH : ${pkgs.lib.makeLibraryPath buildInputs} \
      --suffix WINIT_UNIX_BACKEND : "wayland"
  '';

  meta = with lib; {
    description = "A todo app made with iced-rs";
    homepage = "https://github.com/Pickles888/iced-todo";
    license = licenses.gpl3;
    maintainers = with maintainers; [ Pickles888 ];
  };
}
