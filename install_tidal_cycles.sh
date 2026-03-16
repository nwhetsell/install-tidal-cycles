#!/bin/sh

brew install cabal-install ghc

cabal update
cabal v1-install tidal

brew install --cask supercollider

sc_dir=~/'Library/Application Support/SuperCollider'

extensions_dir="$sc_dir/Extensions"
mkdir -p "$extensions_dir"
plugins_version=3.13.0
plugins_archive="sc3-plugins-$plugins_version-macOS.zip"
curl --location --remote-name --show-error "https://github.com/supercollider/sc3-plugins/releases/download/Version-$plugins_version/$plugins_archive"
unzip "$plugins_archive" -d "$extensions_dir"
cp -R "$extensions_dir/sc3-plugins/SC3plugins" "$extensions_dir"
rm -r "$extensions_dir/sc3-plugins"
rm "$plugins_archive"

echo 'include("SuperDirt");' | /Applications/SuperCollider.app/Contents/MacOS/sclang

if [ -f "$sc_dir/startup.scd" ]; then
  mv "$sc_dir/startup.scd" "$sc_dir/startup.old.scd"
fi
curl --show-error https://raw.githubusercontent.com/musikinformatik/SuperDirt/develop/superdirt_startup.scd --output "$sc_dir/startup.scd"

brew install --cask pulsar
pulsar --package install tidalcycles
