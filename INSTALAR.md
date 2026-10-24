# Instalación (para Claude)

La persona descargó este repositorio y te pidió instalar la plantilla. Habla en español y explica cada paso en una línea.
No le pidas contraseñas ni llaves en el chat.

0. **¿Mac o Windows?** Corre `uname -s`. `Darwin` = Mac (pasos 1–5). `Linux` = Windows con WSL o Linux: sigue **"En Windows"** abajo.
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

## En Windows (WSL) / Linux
1. La carpeta debe estar en Linux (`~/plantilla-saul-pro`), no en `/mnt/c/...` (sería muy lento). Si está en `/mnt/c`, muévela con `mv`.
2. **Corre `./instalar-windows.sh`.** La primera vez dice que faltan programas del sistema e imprime `sudo …/instalar-windows.sh --sistema`.
   Tú NO puedes escribir la contraseña de Ubuntu: **pídele a la persona que pegue ese comando en su ventana de Ubuntu** y te avise
   (instala ffmpeg, Python, Node, Chrome y fuentes; ~2 minutos).
3. Vuelve a correr `./instalar-windows.sh` (sin sudo; córrelo en segundo plano): Python con Whisper (faster-whisper, baja ~1.6 GB),
   herramientas de visión (MediaPipe/OpenCV/RapidOCR, las equivalentes a Vision de Mac), el motor, efectos y la skill.
   Si no pudo preguntar nombre y @usuario, pregúntaselos y crea `config/kit.json`.
4. **Prueba:** `./verificar-windows.sh` (renderiza `proyectos/demo`; tarda unos 3–4 minutos) y dile dónde verlo en Windows (la ruta que imprime).
5. **Enséñale a usarlo** igual que en Mac. Sus videos de Windows están en `/mnt/c/Users/<usuario>/` (Escritorio = `Desktop`, Descargas = `Downloads`).
