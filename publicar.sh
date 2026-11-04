#!/usr/bin/env bash
# ─────────────────────────────────────────────────────────────
# Sincroniza la presentación local con GitHub Pages.
#
#   ./publicar.sh          → sube los cambios (git add + commit + push)
#   ./publicar.sh --check  → sólo verifica si hay cambios pendientes
#
# El repo público es: zums-stuff/economia-digital-IE-2027-1
# La carpeta local es: <vault>/10 Projects/11 Facultad/2027-1/
#                      Introduccion_a_la_Economia/Proyecto/Presentacion
# ─────────────────────────────────────────────────────────────
set -euo pipefail

HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO="https://github.com/zums-stuff/economia-digital-IE-2027-1.git"
BRANCH="main"

cd "$HERE"

echo "→ Carpeta: $HERE"

if [[ "${1:-}" == "--check" ]]; then
  if [[ -n "$(git status --porcelain)" ]]; then
    echo "→ Hay cambios sin publicar:"
    git status --short
  else
    echo "→ Todo publicado, sin cambios pendientes."
  fi
  exit 0
fi

# --no-verify: el hook de Obsidian/git puede interferir con archivos grandes.
git add -A
if git diff --cached --quiet; then
  echo "→ No hay cambios. Nada que publicar."
  exit 0
fi

echo "→ Cambios:"
git status --short

git commit -q --no-verify -m "Presentación: actualización de gráficos y contenido

$(git diff --cached --stat | tail -1)"

git push -q --no-verify origin "$BRANCH"

echo "→ Publicado."
echo "→ URL: https://zums-stuff.github.io/economia-digital-IE-2027-1/"
echo "  (GitHub Pages tarda ~1 min en reflejar los cambios)"
