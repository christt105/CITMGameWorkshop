#!/usr/bin/env bash
#
# Reempaqueta les plantilles d'inici del taller (assets de la release v2026).
#
# Ús:
#   ./build-templates.sh            # crea els 3 ZIP a ./dist
#   ./build-templates.sh --upload   # crea els ZIP i els puja a la release v2026
#
# Requisits: git, python3 i (per a --upload) la CLI gh autenticada.
# El submòdul flappy-bird/FlappyBird ha d'estar a la branca 'workshop-scaffold'
# (és la que el repo principal apunta per defecte).
#
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SUB="$ROOT/flappy-bird/FlappyBird"
DIST="$ROOT/dist"
TAG="v2026"
REPO="christt105/CITMGameWorkshop"

command -v python3 >/dev/null || { echo "Falta python3"; exit 1; }

rm -rf "$DIST"; mkdir -p "$DIST"

clean_unity() { rm -rf "$1/Library" "$1/Temp" "$1/Logs" "$1/obj" "$1/.vs"; }
zipdir() { ( cd "$DIST" && python3 -c "import shutil,sys; shutil.make_archive(sys.argv[1],'zip','.',sys.argv[1])" "$1" ); }

echo "Submòdul FlappyBird a: $(git -C "$SUB" rev-parse --abbrev-ref HEAD 2>/dev/null || echo '?') @ $(git -C "$SUB" rev-parse --short HEAD)"

echo "==> FlappyBird-2026.zip (proyecto vacío, dia 1)"
FB="$DIST/FlappyBird-2026"; mkdir -p "$FB"
cp -r "$SUB/FlappyBirdWorkshop" "$FB/FlappyBirdWorkshop"; clean_unity "$FB/FlappyBirdWorkshop"
# Buidem Scripts, Prefabs, Scenes i Animation per al Dia 1
rm -rf "$FB/FlappyBirdWorkshop/Assets/Scripts"/*
rm -rf "$FB/FlappyBirdWorkshop/Assets/Prefabs"/*
rm -rf "$FB/FlappyBirdWorkshop/Assets/Scenes"/*
rm -rf "$FB/FlappyBirdWorkshop/Assets/Animation"/*
cp "$ROOT/flappy-bird/GUIA.md" "$ROOT/flappy-bird/FUNCIONS.md" "$SUB/LICENSE" "$FB/"
zipdir FlappyBird-2026

echo "==> FlappyBird-Dia2.zip (plantilla amb TODOs per reomplir, dia 2)"
FD="$DIST/FlappyBird-Dia2"; mkdir -p "$FD"
cp -r "$SUB/FlappyBirdWorkshop" "$FD/FlappyBirdWorkshop"; clean_unity "$FD/FlappyBirdWorkshop"
# Eliminem el codi que hi ha dins dels marcadors de solució per deixar només els TODOs
python3 -c "
import glob, re
for f in glob.glob('$FD/FlappyBirdWorkshop/Assets/Scripts/**/*.cs', recursive=True):
    with open(f, 'r', encoding='utf-8') as file:
        content = file.read()
    content = re.sub(r'[ \t]*// <SOL>.*?[ \t]*// </SOL>\n?', '', content, flags=re.DOTALL)
    with open(f, 'w', encoding='utf-8') as file:
        file.write(content)
"
cp "$ROOT/flappy-bird/GUIA.md" "$ROOT/flappy-bird/FUNCIONS.md" "$SUB/LICENSE" "$FD/"
zipdir FlappyBird-Dia2

echo "==> Platformer3D-2026.zip (Godot 4.6)"
PF="$DIST/Platformer3D-2026"; mkdir -p "$PF"
cp -r "$ROOT/platformer-3d/Platformer3D/." "$PF/"
rm -rf "$PF/.godot"
cp "$ROOT/platformer-3d/GUIA.md" "$ROOT/platformer-3d/MECANIQUES.md" "$PF/"
zipdir Platformer3D-2026

echo
echo "ZIPs creats a: $DIST"
ls -lh "$DIST"/*.zip

if [[ "${1:-}" == "--upload" ]]; then
  command -v gh >/dev/null || { echo "Falta la CLI gh per a --upload"; exit 1; }
  echo "==> Pujant a la release $TAG de $REPO..."
  gh release upload "$TAG" \
    "$DIST/FlappyBird-2026.zip" \
    "$DIST/FlappyBird-Dia2.zip" \
    "$DIST/Platformer3D-2026.zip" \
    --repo "$REPO" --clobber
  echo "Fet."
fi
