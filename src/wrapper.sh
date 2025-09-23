#!/usr/bin/env bash
set -e

# Variable de entorno para indicar que el extractor ya está integrado
export EXTRACTOR_INSTALLED=true

# Ejecuta tu frontend Rust (GUI)
if [ -x "/app/bin/minecraft_egui" ]; then
    exec /app/bin/minecraft_egui "$@"
else
    echo "Error: no se encontró /app/bin/minecraft_egui"
    exit 1
fi
