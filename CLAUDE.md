# Plantilla Saúl Pro · instrucciones para Claude

Este repositorio trae **una sola plantilla de edición: Saúl Pro** (reel vertical de marca personal con look de cine). No hay
otras plantillas: si la persona pide otro estilo, dile que este paquete solo trae Saúl Pro (el sistema completo tiene 61; ver README).

## Instalación (con el prompt de la guía)
1. Corre `scripts/requisitos.sh`. Si marca algo con ✗, **enséñale a la persona el comando que imprime y pídele permiso** antes de correrlo; luego vuelve a correr `scripts/requisitos.sh` hasta que diga «Todo listo».
2. Si falta `config/kit.json`, pregúntale su nombre como sale en los videos y su usuario de Instagram y créalo:
   `{ "nombre": "…", "handle": "@…", "idioma": "es", "perfil_salida_por_defecto": "redes" }`
3. **Prueba:** renderiza el video de ejemplo con `node estilo-cine/render.mjs proyectos/demo` y dile dónde quedó (`proyectos/demo/salida/cine_codigo.mp4`); ábrelo con `open -R`.
Detalle y solución de problemas: INSTALAR.md.
Los datos de la persona (nombre, @usuario) están en `config/kit.json`: úsalos en cada `cine.json` (`"handle"`).

## Lo primero que lees
**`plantillas/saul-pro/GUIA.md`**: qué es Saúl Pro, el flujo paso a paso con los comandos, el formato de `cine.json`, todas las
reglas aprendidas y qué evitar. El ejemplo real está en `proyectos/ejemplo-c8252/` (y el video final en *Releases*).

## Qué hay aquí
| Carpeta | Para qué |
|---|---|
| `estilo-cine/` | Motor: `cine.js` (escenas y texto), `render.mjs`, `metodo_corte.py` (corte), `transcribir.py`, `quitar_tramos.py`, `preparar.py` (cuadros + máscara), `piel.py` (filtro de piel), `prep4k.py`, `gen_hf.py` (imágenes de Higgsfield, opcional) |
| `plantillas/saul-pro/` | `GUIA.md` + ejemplos de `cine.json` |
| `proyectos/` | `demo` (prueba de instalación) y `ejemplo-c8252` (un video real terminado) |
| `revision/` | `revisar_final.py`: revisión cuadro por cuadro del video terminado |
| `audio/` | generador de efectos de sonido libres |

## Flujo (no saltarse pasos)
1. **Pregunta una sola vez:** música (carpeta con canciones o MCP de música como Epidemic Sound), duración máxima, formato (Redes 1080 por defecto; 4K solo si lo pide), nombres propios y la palabra del CTA.
2. **Transcribe y caza retomas** (`transcribir.py --tramos`; confirma con la energía del audio y clips cortos).
3. **Muestra el plan / ESCALETA tal cual y no edites nada** hasta que diga "sí". Empieza con: "Esto es lo que voy a hacer con tu video, paso a paso. Revísalo y dime si algo está mal antes de que lo arme." Incluye una lista de **posibles errores** (retomas, palabras que podrían quedar cortadas, licencia de música…).
4. Corta, prepara, arma `cine.json`, stills, render (ver la GUIA).
5. **Revisión final cuadro por cuadro** y verificación del audio por tramos (−14 LUFS). Mira las hojas de `revision_final/`.
6. Si algo no se pudo verificar, dilo.

## Reglas clave (detalle en la GUIA)
Fondo real · piel sutil y sin tonos verdes/naranjas · sin cuadros muertos ni palabras cortadas · pausas ≤ 0.35 s · voz pareja ·
zona segura de Instagram (y 262–1540, nada a la derecha de x 900 desde y 700) · nada encima de la cara · interfaces de
herramientas a pantalla completa · música desde el segundo 0 con la voz ≥ 8 dB arriba · final sin cuadro congelado ·
Higgsfield solo imágenes.

## Seguridad
Las llaves (Higgsfield, ElevenLabs…) van en el **Llavero de macOS**, nunca en archivos ni en el chat. No publiques nada en redes sin que la persona confirme.
