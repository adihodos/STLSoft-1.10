let
  pkgs = import <nixpkgs> {};
in
pkgs.mkShell {
  buildInputs = with pkgs; [
    clang
  #  clang-tools
#    gdb
    renderdoc
    cmake    
    pkg-config

    cxxtest
    zlib
    fmt
    tbb
    xorg.libX11
    xorg.libXinerama
    libGL
    bashInteractive

  ];

  APPEND_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
    pkgs.xorg.libXcursor
    pkgs.xorg.libXi
    pkgs.xorg.libXrandr
  ];
  shellHook = ''
      export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$APPEND_LIBRARY_PATH"
    '';

  # Set Environment Variables
  #  RUST_BACKTRACE = 1;
}
  
