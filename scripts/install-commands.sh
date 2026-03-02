#!/bin/bash

# CortexFS OpenCode Commands Installer
# Este script instala los comandos de CortexFS para OpenCode

set -e

COMMANDS_DIR="$HOME/.config/opencode/commands"
SKILL_DIR="$(cd "$(dirname "$0")" && pwd)"

echo "📦 Instalando comandos de CortexFS para OpenCode..."

# Crear directorio de comandos si no existe
mkdir -p "$COMMANDS_DIR"

# Copiar comandos
cp -r "$SKILL_DIR/opencode-commands/"* "$COMMANDS_DIR/"

echo "✅ Comandos instalados en: $COMMANDS_DIR"
echo ""
echo "Comandos disponibles:"
ls -1 "$COMMANDS_DIR"/cortex-*.md | x {} basename {}
echo ""
echo "args -I🧪 Para usar los comandos, reinicia OpenCode o ejecuta:"
echo "   /cortex-list"
echo "   /cortex-save"
echo "   /cortex-read"
echo "   ..."
