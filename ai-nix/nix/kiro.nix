{ pkgs ? import <nixpkgs> {} }:

let
  # Get latest version metadata
  metadata = builtins.fromJSON (builtins.readFile (pkgs.fetchurl {
    url = "https://prod.download.desktop.kiro.dev/stable/metadata-linux-x64-stable.json";
  }));
  
  # Extract tarball URL
  tarballUrl = builtins.head (builtins.filter 
    (url: pkgs.lib.hasSuffix ".tar.gz" url)
    (map (release: release.updateTo.url) metadata.releases)
  );
in

pkgs.stdenv.mkDerivation rec {
  pname = "kiro";
  version = "latest";

  src = pkgs.fetchurl {
    url = tarballUrl;
    sha256 = pkgs.lib.fakeSha256;
  };

  nativeBuildInputs = with pkgs; [ makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin $out/share/applications $out/share/icons
    
    # Copy main executable
    cp kiro $out/bin/kiro
    chmod +x $out/bin/kiro
    
    # Copy icon if exists
    if [ -f resources/app/resources/linux/code.png ]; then
      cp resources/app/resources/linux/code.png $out/share/icons/kiro.png
    fi
    
    # Create enhanced wrapper for Wayland
    makeWrapper $out/bin/kiro $out/bin/kiro-enhanced \
      --run 'if [ "$XDG_SESSION_TYPE" = "wayland" ] || [ -n "$WAYLAND_DISPLAY" ]; then
               exec "$0" --enable-features=UseOzonePlatform --ozone-platform=wayland "$@"
             else
               exec "$0" "$@"
             fi'
    
    # Create desktop entry
    cat > $out/share/applications/kiro.desktop <<EOF
[Desktop Entry]
Name=Kiro
Keywords=web,development,code,api,text,editor
Exec=$out/bin/kiro-enhanced %u
Icon=$out/share/icons/kiro.png
Terminal=false
Type=Application
StartupWMClass=Kiro
Categories=Api;Code;Development;Text;Edit;Editor;
Actions=new-empty-window;

[Desktop Action new-empty-window]
Name=New Empty Window
Exec=$out/bin/kiro-enhanced --new-window %F
Icon=$out/share/icons/kiro.png
EOF
  '';
}
