<!-- Instrucciones concisas para agentes de IA que trabajan en este workspace -->
# Copilot instructions (es)

Este repositorio parece ser un workspace de VS Code con configuraciones y artefactos locales (carpeta `.vscode/`). No hay un único proyecto fuente monolítico; en su lugar existe:

- Archivos de configuración: `argv.json` (config de instancia de VS Code, no modificar sin confirmar).
- Artefactos de CMake: `CMakeCache.txt` y `CMakeFiles/` (indican builds locales en `c:/Users/USUARIO/.vscode`).
- Carpeta `cli/` con `port_forwarding_tunnel.json` (metadatos de túnel/cluster).
- Varias subcarpetas de extensiones (`extensions/`) que contienen README y guías específicas.

Objetivo del agente:
- Ser productivo localmente: identificar claramente si la tarea requiere modificar configuración del workspace o crear nuevos artefactos.

Reglas y prioridades concretas:

1. No editar `argv.json` salvo indicación explícita del usuario. Es configuración sensible de la instancia de VS Code (locale, crash-reporter-id).
2. Antes de cambiar archivos en `.vscode/` o `CMakeCache.txt`, preguntar al usuario si es una configuración intencional o un respaldo local.
3. Para construir o ejecutar código relacionado con QB64, usa las tareas de VS Code existentes: las etiquetas de tareas detectadas son `buildQB64`, `runQB64`, `buildQB64pe`, `runQB64pe`. Ejemplo de comando (extracto de la configuración de tareas):

```
qb64.exe -x ${file} -o ${fileBasenameNoExtension}.exe
qb64pe.exe -x ${file} -o ${fileBasenameNoExtension}.exe
```

4. Si necesitas ejecutar builds generales detecta primero si hay CMake configurado (ver `CMakeCache.txt`, `CMakeFiles/`). Ejecuta comandos de CMake en el directorio raíz del workspace y confirma antes de editar el cache.

5. Al redactar cambios: referencia explícita de archivos en respuestas (por ejemplo: `CMakeCache.txt`, `cli/port_forwarding_tunnel.json`) y usa enlaces cuando correspondan en PRs o documentación.

Patrones y convenciones observadas (ejemplos específicos):
- Mucho contenido es README de extensiones bajo `extensions/` — para entender comportamientos dependientes de extensiones, lee esos README (p. ej. `extensions/*/README.md`).
- No existen archivos `AGENT.md` ni `.github/copilot-instructions.md` previos; por tanto, prioriza claridad y evita suposiciones sobre estructura del código.

Qué pedir al humano cuando falte contexto:
- ¿Cuál es el objetivo concreto (editar configuración de VS Code, desarrollar un proyecto CMake, crear código QB64, mantener backups)?
- ¿Puedo alterar o normalizar archivos locales (`argv.json`, `CMakeCache.txt`)?

Comportamiento esperado del agente al proponer cambios:
- Proponer cambios pequeños y reversibles; crear PR/patch con explicación concisa.
- Incluir comandos exactos para reproducir: ejemplo `Run Task` usando las tareas VS Code (`buildQB64`/`runQB64`).
- Si modifica la estructura de carpetas, preguntar antes y documentar el motivo.

Si necesitas más contexto, solicita acceso a: archivos fuente (si existen), `tasks.json` del workspace (si lo hay), y cualquier README adicional que describa el propósito del workspace.

Fin.
