#!/bin/zsh
# Revisa la instalación y renderiza el video de prueba (proyectos/demo). Uso: ./verificar.sh [--sin-render]
KIT="$(cd "$(dirname "$0")" && pwd)"; cd "$KIT"; f=0
chk() { if eval "$2" >/dev/null 2>&1; then print -P "%F{green}✓%f $1"; else print -P "%F{red}✗%f $1  →  $3"; f=1; fi; }
chk "ffmpeg"                 "command -v ffmpeg"                                "brew install ffmpeg"
chk "Node"                   "command -v node"                                  "brew install node"
chk "Google Chrome"          "test -d '/Applications/Google Chrome.app'"        "brew install --cask google-chrome"
chk "Python + Whisper (mlx)" ".venv/bin/python -c 'import mlx_whisper, cv2, numpy'" "./instalar.sh"
chk "motor (puppeteer)"      "test -d motor/node_modules/puppeteer-core"        "cd motor && npm install"
chk "bin/segmentar"          "test -x bin/segmentar"                            "./instalar.sh"
chk "revisión final"         "test -x revision/bin/fotogramas"                  "./instalar.sh"
chk "efectos de sonido"      "test -f estilo-cine/sfx/whoosh_rapido.mp3"        "./instalar.sh"
chk "skill plantilla-saul-pro" "test -f ${SKILLS_DIR:-$HOME/.claude/skills}/plantilla-saul-pro/SKILL.md" "./instalar.sh"
[[ "$1" == "--sin-render" ]] && exit $f
print -P "\n%F{cyan}Render de prueba (proyectos/demo)…%f"
node estilo-cine/render.mjs proyectos/demo && print -P "%F{green}✓ Todo funciona:%f proyectos/demo/salida/cine_codigo.mp4" && open -R proyectos/demo/salida/cine_codigo.mp4
