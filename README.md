# Plantilla Saúl Pro · edición de video con IA (gratis)

Edita tus reels con **Claude Code** en el estilo **Saúl Pro**: tú hablando con tu fondo real y un filtro de piel sutil, texto
palabra por palabra (chico + gigante, incluso detrás de tu cabeza), escenas animadas que ilustran lo que dices, textura de
película, música y efectos. Claude encuentra tus mejores tomas, te muestra un plan paso a paso, edita y revisa el video cuadro
por cuadro antes de entregártelo.

Ejemplo terminado: **"Video editado - C8252.mp4"** en la sección *Releases* de este repositorio.

## Requisitos
- **Mac** con chip Apple (M1 o más nueva) · macOS 14+ · ~8 GB libres, **o**
- **Windows 10/11** con WSL (Ubuntu, gratis de Microsoft) · 16 GB de RAM recomendados · ~12 GB libres.
- En los dos: un plan de Claude que incluya **Claude Code** (Pro o Max).

## Instalación (Claude lo hace por ti)
Lo más fácil: descarga la **guía PDF** (Mac o Windows) y sigue sus pasos. En resumen, en Mac:
1. Instala Claude Code: abre la **Terminal** y pega `curl -fsSL https://claude.ai/install.sh | bash`; luego escribe `claude`.
2. Descarga este repositorio (botón verde **Code → Download ZIP**, o `git clone`), entra a la carpeta y abre `claude` ahí.
3. Dile a Claude: **"Instala la plantilla siguiendo INSTALAR.md"**. Al final renderiza un video de prueba.

**En Windows:** abre PowerShell como administrador y corre `wsl --install -d Ubuntu`, reinicia, abre **Ubuntu** y ahí
instala Claude Code (`curl -fsSL https://claude.ai/install.sh | bash`), descarga el repositorio con
`git clone https://github.com/soysaul-mtz/plantilla-saul-pro.git ~/plantilla-saul-pro`, entra con `cd ~/plantilla-saul-pro`,
abre `claude` y dile **"Instala la plantilla siguiendo INSTALAR.md"**.

## Cómo se usa
Abre `claude` en esta carpeta y pídele: *"Edita este video con Saúl Pro: /ruta/a/mi/video.MOV"*.
Te pregunta la música (una carpeta con tus canciones o un conector de música), la duración máxima y la palabra para tu CTA,
te enseña el plan y edita cuando le dices "sí".

## ¿Quieres más?
Esta es 1 de las **61 plantillas** del *Sistema de edición de video con IA* (Saúl Pro 3D, testimoniales, anuncios con retomas,
reacciones, original vs editado, Editor 1–50…). Escríbeme por Instagram **@soysaul_mtz**.

## Licencia
Gratis para uso personal y de tu negocio. No se puede revender ni volver a publicar como propio. Ver [LICENCIA.md](LICENCIA.md).
