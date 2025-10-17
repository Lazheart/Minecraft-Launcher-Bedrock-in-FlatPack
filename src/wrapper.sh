#!/usr/bin/env bash
set -euo pipefail

echo "[Lazheart Flatpak] Iniciando entorno KDE/Qt..."

# === Identificadores ===
APP_ID="${FLATPAK_ID:-org.lazheart.minecraft-launcher}"
APP_BIN="/app/bin/minecraft-launcher-ui"   # 🔧 Nuevo: apunta al script PyQt5
LOG_DIR="${XDG_CONFIG_HOME:-$HOME/.var/app/$APP_ID}/logs"
LOG_FILE="$LOG_DIR/launcher.log"

# === Crear directorios ===
mkdir -p "$LOG_DIR"

# === Variables de entorno ===
export PYTHONUNBUFFERED=1
export QTWEBENGINE_DISABLE_SANDBOX=1
export QT_QPA_PLATFORM="wayland;xcb"           # prioridad a Wayland
export QTWEBENGINE_CHROMIUM_FLAGS="--no-sandbox"
export QT_PLUGIN_PATH="/app/lib/plugins"
export QML_IMPORT_PATH="/app/lib/qml"
export QML2_IMPORT_PATH="/app/lib/qml"
export LD_LIBRARY_PATH="/app/lib:${LD_LIBRARY_PATH:-}"
export PATH="/app/bin:$PATH"
export LANG=${LANG:-en_US.UTF-8}

# === Detección del entorno gráfico ===
if [[ -n "${WAYLAND_DISPLAY:-}" ]]; then
    echo "[Flatpak] Ejecutando en Wayland (Qt nativo)" | tee -a "$LOG_FILE"
else
    echo "[Flatpak] Ejecutando en X11 (modo XWayland)" | tee -a "$LOG_FILE"
fi

# === Verificación del script principal ===
if [[ ! -f "$APP_BIN" ]]; then
    echo "[Error] No se encontró el launcher Python en $APP_BIN" | tee -a "$LOG_FILE"
    echo "Verifica que fue instalado correctamente en /app/bin/minecraft-launcher-ui" | tee -a "$LOG_FILE"
    exit 1
fi

# === Ejecución del frontend Python ===
echo "[Lazheart Flatpak] Iniciando UI Qt Python (PyQt5)..." | tee -a "$LOG_FILE"
exec "$APP_BIN" "$@" 2>&1 | tee -a "$LOG_FILE"
