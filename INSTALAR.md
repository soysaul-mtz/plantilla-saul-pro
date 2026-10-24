# Instalación (para Claude)

La persona descargó este repositorio y te pidió instalar la plantilla. Habla en español y explica cada paso en una línea.
No le pidas contraseñas ni llaves en el chat.

1. **Revisa la Mac:** `uname -m` debe ser `arm64` y `sw_vers -productVersion` ≥ 14. Si no, avísale que hace falta Mac con chip Apple y macOS 14+.
2. **Corre `./instalar.sh`** desde la raíz (tarda: córrelo en segundo plano y cuéntale el avance). Instala Homebrew si falta
   (pedirá la contraseña de la Mac en la Terminal, no en el chat), ffmpeg, Node, Python 3.13 con Whisper local, Google Chrome,
   el motor de render, compila las herramientas de Vision (`bin/segmentar`, `bin/sdr`, `revision/bin/fotogramas`), genera
   efectos de sonido libres y la skill `plantilla-saul-pro`. Al final pregunta nombre y @usuario de Instagram.
3. **Prueba:** `./verificar.sh` (renderiza `proyectos/demo`). Ábrele el video.
4. **Opcional:** música (una carpeta con sus canciones o el conector de Epidemic Sound en claude.ai → Conectores) e imágenes con
   IA (CLI `higgsfield`, solo imágenes). Las llaves van al Llavero.
5. **Enséñale a usarlo:** que abra `claude` en esta carpeta y pida "Edita este video con Saúl Pro: /ruta/al/video".
   Desde ahí sigue `CLAUDE.md` y `plantillas/saul-pro/GUIA.md`.
