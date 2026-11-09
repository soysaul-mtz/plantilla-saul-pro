#!/bin/zsh
# Revisa que esté todo lo que usa la plantilla Saúl Pro y dice el comando EXACTO para lo que falte (no instala nada solo).
# Uso: scripts/requisitos.sh        (desde la carpeta de la plantilla; se puede correr las veces que quieras)
cd "$(dirname "$0")/.."; falta=0
si() { print -P "%F{green}✓%f $1"; }
no() { print -P "%F{red}✗%f $1\n    → $2"; falta=$((falta+1)); }
[[ "$(uname -m)" == "arm64" ]] && si "Mac con chip Apple" || no "Mac con chip Apple (M1, M2, M3…): Whisper y el recorte de la persona lo necesitan" "esta plantilla no funciona en Mac Intel"
xcode-select -p >/dev/null 2>&1 && si "Herramientas de línea de comandos de Apple" || no "Herramientas de línea de comandos de Apple (compilan las herramientas de visión)" "xcode-select --install"
command -v brew >/dev/null && si "Homebrew" || no "Homebrew (instala los demás programas)" '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
command -v ffmpeg >/dev/null && si "ffmpeg" || no "ffmpeg (video y audio)" "brew install ffmpeg"
command -v node >/dev/null && [ "$(node -p 'process.versions.node.split(".")[0]')" -ge 20 ] && si "Node $(node -v)" || no "Node 20 o más nuevo (motor de render)" "brew install node"
[ -x /opt/homebrew/bin/python3.13 ] && si "Python 3.13" || no "Python 3.13" "brew install python@3.13"
[ -d "/Applications/Google Chrome.app" ] && si "Google Chrome (el motor dibuja con Chrome)" || no "Google Chrome" "brew install --cask google-chrome"
if (( falta )); then echo; echo "Faltan $falta programa(s) de tu Mac. Instálalos (cada uno con su comando) y vuelve a correr scripts/requisitos.sh"; exit 1; fi
# lo de esta carpeta (no toca nada fuera de ella salvo la skill de Claude): un solo comando lo deja listo
p=0
.venv/bin/python -c 'import mlx_whisper, cv2, numpy' 2>/dev/null && si "Python de la plantilla + Whisper" || p=1
[ -d motor/node_modules/puppeteer-core ] && si "motor de render" || p=1
[ -x bin/segmentar ] && [ -x bin/sdr ] && [ -x revision/bin/fotogramas ] && si "herramientas de visión" || p=1
[ -f estilo-cine/sfx/whoosh_rapido.mp3 ] && si "efectos de sonido" || p=1
[ -f "${SKILLS_DIR:-$HOME/.claude/skills}/plantilla-saul-pro/SKILL.md" ] && si "skill de Claude" || p=1
if (( p )); then echo; print -P "%F{red}✗%f Falta preparar la carpeta de la plantilla (Python, motor, herramientas de visión, efectos y skill; ≈ 5 min, baja ≈ 1.6 GB la primera vez)\n    → ./instalar.sh"; exit 1; fi
[ -f config/kit.json ] && si "config/kit.json (tus datos)" || print -P "%F{yellow}·%f Falta config/kit.json (tu nombre y tu @): Claude, pregúntaselos y créalo"
echo; echo "Todo listo. Prueba: node estilo-cine/render.mjs proyectos/demo"
