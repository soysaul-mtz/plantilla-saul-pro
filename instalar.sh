#!/bin/zsh
# Instalador de la plantilla Saúl Pro. Uso: ./instalar.sh   (se puede correr varias veces; solo instala lo que falte)
set -e
KIT="$(cd "$(dirname "$0")" && pwd)"; cd "$KIT"
ok()   { print -P "%F{green}✓%f $1"; }
paso() { print -P "\n%F{cyan}▸ $1%f"; }
aviso(){ print -P "%F{yellow}⚠ $1%f"; }
[[ "$(uname -m)" == "arm64" ]] || aviso "Esta Mac no es Apple Silicon: Whisper (mlx) y el recorte con Vision no van a funcionar."

paso "1/8 Herramientas de línea de comandos de Apple (swift)"
if xcode-select -p >/dev/null 2>&1; then ok "ya instaladas"; else xcode-select --install || true; aviso "Termina la instalación que se abrió y vuelve a correr ./instalar.sh"; exit 1; fi

paso "2/8 Homebrew"
if ! command -v brew >/dev/null; then /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; eval "$(/opt/homebrew/bin/brew shellenv)"; fi
ok "brew $(brew --version | head -1 | awk '{print $2}')"

paso "3/8 Programas: ffmpeg, Node, Python"
for p in ffmpeg node python@3.13; do brew list --formula "$p" >/dev/null 2>&1 || brew install "$p"; done
ok "ffmpeg · node $(node -v) · $(/opt/homebrew/bin/python3.13 --version)"

paso "4/8 Google Chrome (el motor renderiza con Chrome)"
if [[ -d "/Applications/Google Chrome.app" ]]; then ok "ya instalado"; else brew install --cask google-chrome; fi

paso "5/8 Python (.venv) + Whisper local"
[[ -d .venv ]] || /opt/homebrew/bin/python3.13 -m venv .venv
.venv/bin/pip install -q --upgrade pip && .venv/bin/pip install -q -r requirements.txt && ok "paquetes de Python listos"
print "   bajando el modelo de Whisper (≈1.6 GB, solo la primera vez)…"
.venv/bin/python -c "from huggingface_hub import snapshot_download as d; d('mlx-community/whisper-large-v3-turbo')" >/dev/null 2>&1 && ok "modelo Whisper listo" || aviso "se baja solo la primera vez que transcribas"
[[ -e revision/.venv ]] || ln -s ../.venv revision/.venv

paso "6/8 Motor de render"
(cd motor && npm install --silent --no-audit --no-fund >/dev/null) && ok "motor (puppeteer)"

paso "7/8 Herramientas de Vision"
mkdir -p bin revision/bin
swiftc -O estilo-cine/segmentar.swift -o bin/segmentar 2>/dev/null && ok "bin/segmentar (máscara de persona)"
swiftc -O revision/sdr.swift -o bin/sdr 2>/dev/null && ok "bin/sdr (video HDR → color normal)"
swiftc -O revision/fotogramas.swift -o revision/bin/fotogramas 2>/dev/null && ok "revision/bin/fotogramas (revisión final cuadro por cuadro)"

paso "8/8 Efectos de sonido y skill de Claude Code"
.venv/bin/python audio/efectos_basicos.py >/dev/null && ok "estilo-cine/sfx (efectos libres)"
SK="${SKILLS_DIR:-$HOME/.claude/skills}"; mkdir -p "$SK"
for s in skills/*/; do
  n=$(basename "$s"); rm -rf "$SK/$n"; cp -R "$s" "$SK/$n"
  print "\n> Carpeta de la plantilla: \`$KIT\` (las rutas de esta skill son relativas a esa carpeta)." >> "$SK/$n/SKILL.md"; ok "skill $n"
done

if [[ ! -f config/kit.json && -t 0 ]]; then
  read "nom?Tu nombre como sale en los videos: "; read "han?Tu usuario de Instagram (con @): "
  mkdir -p config; print "{ \"nombre\": \"${nom:-Tu nombre}\", \"handle\": \"${han:-@tu_usuario}\", \"idioma\": \"es\", \"perfil_salida_por_defecto\": \"redes\" }" > config/kit.json
  ok "config/kit.json"
fi
print -P "\n%F{green}Listo.%f Sigue con: ./verificar.sh"
