#!/usr/bin/env bash
set -euo pipefail

# ==== Información de entorno ====
echo "[Minecraft EGUI Wrapper] Iniciando entorno Flatpak..."

# Marca para que el launcher sepa que está dentro del sandbox
export EXTRACTOR_INSTALLED=true
export RUST_LOG=warn

# Ruta del ejecutable Rust (frontend)
APP_BIN="/app/bin/minecraft_egui"

# Verificación de entorno
if [[ -z "${FLATPAK_ID:-}" ]]; then
    echo "[ADVERTENCIA] No se está ejecutando dentro de un entorno Flatpak."
fi

# ==== Ejecución del frontend ====
if [[ -x "$APP_BIN" ]]; then
    echo "[Minecraft EGUI Wrapper] Ejecutando interfaz..."
    exec "$APP_BIN" "$@"
else
    echo "[ERROR] No se encontró el binario: $APP_BIN"
    echo "Verifica que el módulo 'minecraft_egui' se haya compilado correctamente."
    exit 1
fi
# ==== Fin del script ====